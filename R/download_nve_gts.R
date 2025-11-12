# Downloads a series of GTS data given dates, area and layer in batches and saves them directly as RDS files.
# The direct writing prevents killing the R session by overloading the ram.

download_nve_gts <- function(name, coordinate_list, first_date, last_date, layer = VALID_GTS_LAYER_NAMES, batch_size = 100, verbose = TRUE) {
  if (verbose) print(paste0("Start time: [", Sys.time(), "]"))

  layer <- match.arg(layer)

  # Generate URLs
  url_list <- sprintf(
    "https://gts.nve.no/api/GridTimeSeries/%d/%d/%s/%s/%s.json",
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
