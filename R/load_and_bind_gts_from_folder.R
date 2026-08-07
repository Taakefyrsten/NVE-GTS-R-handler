#' Load and combine GTS batch results from a folder
#'
#' Reads all `.rds` batch files written by \code{\link{download_nve_gts}} from
#' a given folder, flattens them into a single list, and returns it. The
#' resulting list contains one element per grid-point request, in the same
#' order as the coordinates originally passed to
#' \code{\link{download_nve_gts}}.
#'
#' @param folder_name A character string giving the path to the folder
#'   containing the `.rds` batch files (relative to the current working
#'   directory). This is the value returned by \code{\link{download_nve_gts}},
#'   and can also be reconstructed with \code{\link{name_folder}}.
#'
#' @return A flat list where each element is the parsed JSON response for one
#'   grid-point request (a list as returned by
#'   \code{\link{request_nve_gts}}). Elements corresponding to failed requests
#'   will be \code{NULL}. The request manifest is attached as the
#'   \code{"gts_manifest"} attribute when the folder has one.
#'
#' @details
#' Only files matching the `batch_<i>_results.rds` pattern are read, and they
#' are ordered by batch index rather than by file name, so the returned list
#' follows the original coordinate order. The manifest file in the folder is
#' not treated as a batch.
#'
#' @seealso \code{\link{download_nve_gts}}, \code{\link{name_folder}}
#'
#' @examples
#' \dontrun{
#' folder <- download_nve_gts(
#'   name            = "oslo_area",
#'   coordinate_list = coords,
#'   first_date      = "2023-01-01",
#'   last_date       = "2023-12-31",
#'   layer           = "tm"
#' )
#'
#' results <- load_and_bind_gts_from_folder(folder)
#'
#' # The request that produced them travels with the data
#' attr(results, "gts_manifest")$first_date
#' }
#'
#' @importFrom purrr flatten
#' @export
load_and_bind_gts_from_folder <- function(folder_name) {
  if (!dir.exists(folder_name)) {
    stop("No such folder: ", folder_name, call. = FALSE)
  }

  file_names <- list.files(
    path = folder_name,
    pattern = "^batch_\\d+_results\\.rds$",
    full.names = TRUE
  )

  if (length(file_names) == 0L) {
    stop("No batch files found in \"", folder_name, "\".", call. = FALSE)
  }

  # Order by batch index, not by file name: an unpadded "batch_10" sorts
  # before "batch_2" lexically, which would scramble the point order.
  batch_index <- as.integer(sub("^batch_(\\d+)_results\\.rds$", "\\1",
                                basename(file_names)))
  file_names <- file_names[order(batch_index)]

  results <- lapply(file_names, readRDS) |>
    purrr::flatten()

  manifest_file <- manifest_path(folder_name)
  if (file.exists(manifest_file)) {
    attr(results, "gts_manifest") <- readRDS(manifest_file)
  }

  results
}
