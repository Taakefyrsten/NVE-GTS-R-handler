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
#'   batch. Defaults to \code{100}.
#' @param verbose Logical. If \code{TRUE} (default), prints start and end
#'   timestamps to the console.
#'
#' @return Called for its side-effect of writing `.rds` files to a subfolder
#'   named `<name>_<layer>/` relative to the current working directory.
#'   Returns \code{NULL} invisibly.
#'
#' @details
#' The output folder is created as `<name>_<layer>/` in the current working
#' directory if it does not already exist. Each batch is saved as
#' `<folder>/<folder>_<i>_results.rds`. Parallel fetching within each batch
#' is handled by \code{\link[furrr]{future_map}}; configure a
#' \code{\link[future]{plan}} before calling this function to enable
#' parallelism.
#'
#' @seealso \code{\link{load_and_bind_gts_from_folder}},
#'   \code{\link{request_nve_gts}}, \code{\link{VALID_GTS_LAYER_NAMES}}
#'
#' @examples
#' \dontrun{
#' library(future)
#' plan(multisession)
#'
#' coords <- data.frame(X = c(269390, 270000), Y = c(6653390, 6654000))
#'
#' download_nve_gts(
#'   name       = "oslo_area",
#'   coordinate_list = coords,
#'   first_date = "2023-01-01",
#'   last_date  = "2023-12-31",
#'   layer      = "tm"
#' )
#' }
#'
#' @importFrom furrr future_map
#' @export
download_nve_gts <- function(name, coordinate_list, first_date, last_date, layer = VALID_GTS_LAYER_NAMES, batch_size = 100, verbose = TRUE) {
  if (verbose) print(paste0("Start time: [", Sys.time(), "]"))

  layer <- match.arg(layer)

  # Generate URLs
  url_list <- sprintf(
    "https://gts.nve.no/api/GridTimeSeries/%.0f/%.0f/%s/%s/%s.json",
    coordinate_list$X, coordinate_list$Y, first_date, last_date, layer
  )

  url_batches <- split(url_list, ceiling(seq_along(url_list) / batch_size))

  folder_name <- paste0(name, "_", layer)

  if (!dir.exists(folder_name)) {
    dir.create(folder_name, recursive = TRUE)
    if (verbose) cat(paste("Created folder relative to CWD:", folder_name, "\n"))
  }

  # Call in batches
  for (i in seq_along(url_batches)) {
    if (i %% 10 == 0) {
      message(sprintf("[%s] Processing batch %d of %d...",
                      Sys.time(), i, length(url_batches)))
    }

    # Skip already processed batches
    if (file.exists(sprintf("%s/%s_%d_results.rds",
                            folder_name, folder_name, i))) {
      if (i %% 10 == 0) {
        message(sprintf("[%s] Batch %d already processed. Skipping...",
                        Sys.time(), i))
      }
      next
    }

    # Fetch data in parallel for the current batch
    batch_results <- furrr::future_map(url_batches[[i]], request_nve_gts, .progress = FALSE)

    # Save the batch results
    saveRDS(batch_results, sprintf("%s/%s_%d_results.rds", folder_name, folder_name, i))
    rm(batch_results)
  }
  if (verbose) print(paste0("End time: [", Sys.time(), "]"))
}
