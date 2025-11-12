load_and_bind_gts_from_folder <- function(folder_name) {
  file_names <- list.files(path = folder_name)

  assign(
    folder_name,
    lapply(
      file_names,
      function(f) {
        readRDS(paste0(folder_name, "/", f))
      }
    )
  ) |>
    purrr::flatten()
}
