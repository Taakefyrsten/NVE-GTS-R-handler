#' @keywords internal
#' @noRd
GTS_MANIFEST_FILE <- "_gts_manifest.rds"

#' @keywords internal
#' @noRd
manifest_path <- function(folder_name) file.path(folder_name, GTS_MANIFEST_FILE)

# Build the record of what a folder is supposed to contain. The full
# coordinate vector is stored, not a summary: the folder name only carries a
# bounding box, so the manifest is the only thing that can tell two requests
# with the same extent apart.
#' @keywords internal
#' @noRd
gts_manifest <- function(name, layer, coordinate_list, first_date, last_date,
                         batch_size) {
  list(
    manifest_version = 1L,
    package_version  = as.character(utils::packageVersion("NveGTSRequesteR")),
    created          = Sys.time(),
    name             = name,
    layer            = layer,
    first_date       = first_date,
    last_date        = last_date,
    batch_size       = as.integer(batch_size),
    coordinates      = as_coordinate_df(coordinate_list)
  )
}

# Compare a stored manifest against the request being made now, and abort if
# they describe different things. batch_size is checked because it sets the
# batch boundaries: resuming with a different one would interleave points from
# two different partitionings into the same file sequence.
#' @keywords internal
#' @noRd
check_manifest <- function(stored, current, folder_name) {
  diffs <- character()

  for (f in c("layer", "first_date", "last_date", "batch_size")) {
    if (!identical(stored[[f]], current[[f]])) {
      diffs <- c(diffs, sprintf(
        "  %s: stored %s, requested %s",
        f, format(stored[[f]]), format(current[[f]])
      ))
    }
  }

  if (!identical(stored$coordinates, current$coordinates)) {
    n_stored <- nrow(stored$coordinates)
    n_now <- nrow(current$coordinates)
    diffs <- c(diffs, if (n_stored != n_now) {
      sprintf("  coordinates: stored %d points, requested %d points", n_stored, n_now)
    } else {
      sprintf("  coordinates: %d points in both, but the values differ", n_stored)
    })
  }

  if (length(diffs) == 0L) return(invisible(TRUE))

  stop(
    "Folder \"", folder_name, "\" already holds a different request.\n",
    paste(diffs, collapse = "\n"), "\n",
    "Resuming would mix results from two requests in one folder.\n",
    "Use a different `name`, or clear the folder with gts_folder_reset(\"",
    folder_name, "\").",
    call. = FALSE
  )
}

# Decide what to do about the manifest for a folder we are about to write to,
# and leave a valid one on disk. Returns invisibly.
#' @keywords internal
#' @noRd
sync_manifest <- function(folder_name, manifest, verbose = TRUE) {
  path <- manifest_path(folder_name)

  if (file.exists(path)) {
    check_manifest(readRDS(path), manifest, folder_name)
    return(invisible(TRUE))
  }

  existing <- list.files(folder_name, pattern = "_results\\.rds$")
  if (length(existing) > 0L) {
    stop(
      "Folder \"", folder_name, "\" contains ", length(existing),
      " batch file(s) but no manifest.\n",
      "This folder was most likely written by NveGTSRequesteR < 2.0.0, whose ",
      "folder names did not encode the coordinates or date range, so its ",
      "contents cannot be verified against this request.\n",
      "Re-download into a new `name`, or clear the folder with ",
      "gts_folder_reset(\"", folder_name, "\").",
      call. = FALSE
    )
  }

  saveRDS(manifest, path)
  invisible(TRUE)
}
