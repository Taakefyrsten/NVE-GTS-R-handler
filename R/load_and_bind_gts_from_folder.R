#' Load and combine GTS batch results from a folder
#'
#' Reads all `.rds` batch files written by \code{\link{download_nve_gts}} from
#' a given folder, flattens them into a single list, and returns it. The
#' resulting list contains one element per grid-point request.
#'
#' @param folder_name A character string giving the path to the folder
#'   containing the `.rds` batch files (relative to the current working
#'   directory). This is typically the `<name>_<layer>` folder created by
#'   \code{\link{download_nve_gts}}.
#'
#' @return A flat list where each element is the parsed JSON response for one
#'   grid-point request (a list as returned by
#'   \code{\link{request_nve_gts}}). Elements corresponding to failed requests
#'   will be \code{NULL}.
#'
#' @seealso \code{\link{download_nve_gts}}, \code{\link{name_folder}}
#'
#' @examples
#' \dontrun{
#' # After running download_nve_gts():
#' results <- load_and_bind_gts_from_folder("oslo_area_tm")
#' }
#'
#' @importFrom purrr flatten
#' @export
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
