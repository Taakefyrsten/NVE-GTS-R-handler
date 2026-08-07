#' Download NVE Grid Time Series data in batches
#'
#' Fetches GTS data from the NVE API for a list of coordinates over a date
#' range and saves each batch directly to disk as `.rds` files. Batching
#' prevents memory exhaustion when requesting large numbers of grid points.
#' Already-completed batches are skipped automatically, making interrupted
#' runs resumable.
#'
#' @param name A character string used as a prefix for the output folder and
#'   batch file names.
#' @param coordinate_list A data frame or list with two numeric elements named
#'   `X` and `Y`, representing the UTM33 easting and northing coordinates of
#'   the grid points to query.
#' @param first_date A character string giving the start of the date range in
#'   `"YYYY-MM-DD"` format.
#' @param last_date A character string giving the end of the date range in
#'   `"YYYY-MM-DD"` format.
#' @param layer A character string naming the GTS layer to download. Must be
#'   one of \code{\link{VALID_GTS_LAYER_NAMES}}. Defaults to the first valid
#'   layer name.
#' @param batch_size Integer. Number of URLs (grid points) to process per
#'   batch. Defaults to \code{100}, which is tuned for region-sized jobs; see
#'   Details.
#' @param verbose Logical. If \code{TRUE} (default), prints start and end
#'   timestamps to the console.
#'
#' @return The output folder name, invisibly. Called mainly for its
#'   side-effect of writing `.rds` files into that folder.
#'
#' @details
#' The output folder is created in the current working directory, named by
#' \code{\link{name_folder}}, and each batch is saved inside it as
#' `batch_<i>_results.rds`. Pass the returned folder name straight to
#' \code{\link{load_and_bind_gts_from_folder}} to read the results back.
#'
#' \subsection{Choosing batch_size}{
#' Requests are fetched in parallel \emph{within} a batch, and each completed
#' batch is written to disk before the next begins. The batch is therefore
#' both the memory ceiling and the resume checkpoint. The default of 100 suits
#' large jobs - whole regions, tens of thousands of points - where those two
#' properties matter. For a small job, a few dozen points, set `batch_size` at
#' or above the point count so everything runs as one parallel sweep; a batch
#' smaller than your worker pool leaves workers idle. Configure a
#' \code{\link[future]{plan}} before calling to enable parallelism at all.
#' }
#'
#' \subsection{Resuming and the manifest}{
#' A manifest recording the layer, date range, batch size and full coordinate
#' vector is written into the folder on the first call. Later calls compare
#' their request against it and abort if it differs, so a changed date range
#' or coordinate set can never resume into a folder holding something else.
#' Rerunning an identical call skips batches whose file already exists and
#' fetches only what is missing.
#' }
#'
#' @seealso \code{\link{load_and_bind_gts_from_folder}},
#'   \code{\link{name_folder}}, \code{\link{request_nve_gts}},
#'   \code{\link{VALID_GTS_LAYER_NAMES}}
#'
#' @examples
#' \dontrun{
#' library(future)
#' plan(multisession)
#'
#' coords <- data.frame(X = c(269390, 270000), Y = c(6653390, 6654000))
#'
#' folder <- download_nve_gts(
#'   name            = "oslo_area",
#'   coordinate_list = coords,
#'   first_date      = "2023-01-01",
#'   last_date       = "2023-12-31",
#'   layer           = "tm",
#'   batch_size      = nrow(coords)
#' )
#'
#' results <- load_and_bind_gts_from_folder(folder)
#' }
#'
#' @importFrom furrr future_map
#' @export
download_nve_gts <- function(name, coordinate_list, first_date, last_date, layer = VALID_GTS_LAYER_NAMES, batch_size = 100, verbose = TRUE) {
  if (verbose) print(paste0("Start time: [", Sys.time(), "]"))

  layer <- match.arg(layer)

  if (length(batch_size) != 1L || is.na(batch_size) || batch_size < 1) {
    stop("`batch_size` must be a single positive number.", call. = FALSE)
  }
  batch_size <- as.integer(batch_size)

  folder_name <- name_folder(name, layer, coordinate_list, first_date, last_date)
  manifest <- gts_manifest(name, layer, coordinate_list, first_date, last_date, batch_size)

  # Generate URLs
  url_list <- sprintf(
    "https://gts.nve.no/api/GridTimeSeries/%.0f/%.0f/%s/%s/%s.json",
    manifest$coordinates$X, manifest$coordinates$Y, first_date, last_date, layer
  )

  url_batches <- split(url_list, ceiling(seq_along(url_list) / batch_size))

  if (!dir.exists(folder_name)) {
    dir.create(folder_name, recursive = TRUE)
    if (verbose) cat(paste("Created folder relative to CWD:", folder_name, "\n"))
  }

  # Refuses to continue if this folder already holds a different request
  sync_manifest(folder_name, manifest, verbose = verbose)

  # Call in batches
  for (i in seq_along(url_batches)) {
    if (i %% 10 == 0) {
      message(sprintf("[%s] Processing batch %d of %d...",
                      Sys.time(), i, length(url_batches)))
    }

    batch_file <- batch_path(folder_name, i)

    # Skip already processed batches
    if (file.exists(batch_file)) {
      if (i %% 10 == 0) {
        message(sprintf("[%s] Batch %d already processed. Skipping...",
                        Sys.time(), i))
      }
      next
    }

    # Fetch data in parallel for the current batch
    batch_results <- furrr::future_map(url_batches[[i]], request_nve_gts, .progress = FALSE)

    # Save the batch results
    saveRDS(batch_results, batch_file)
    rm(batch_results)
  }
  if (verbose) print(paste0("End time: [", Sys.time(), "]"))

  invisible(folder_name)
}

# Batch indices are zero-padded so that the files sort identically whether
# read in lexical or numeric order.
#' @keywords internal
#' @noRd
batch_path <- function(folder_name, i) {
  file.path(folder_name, sprintf("batch_%05d_results.rds", i))
}
