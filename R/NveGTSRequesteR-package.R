#' NveGTSRequesteR: Download and load NVE Grid Time Series data
#'
#' Simplifies bulk downloading of gridded environmental time series from the
#' Norwegian Water Resources and Energy Directorate (NVE) Grid Time Series
#' (GTS) REST API. Data is fetched in parallel using \pkg{httr2} and
#' \pkg{furrr}, written to disk in batches to avoid memory exhaustion, and can
#' be resumed after interruption. A loader function reassembles the batches
#' into a single flat list for downstream analysis.
#'
#' @section Main workflow:
#' \enumerate{
#'   \item Set up a parallel backend with \code{\link[future]{plan}}.
#'   \item Call \code{\link{download_nve_gts}} with your coordinates, date
#'     range, and layer. Batch `.rds` files are written to
#'     `<name>_<layer>/`.
#'   \item Load and combine results with
#'     \code{\link{load_and_bind_gts_from_folder}}.
#'   \item Optionally clear a batch folder with \code{\link{gts_folder_reset}}
#'     to re-download from scratch.
#' }
#'
#' @section Reference data:
#' \itemize{
#'   \item \code{\link{VALID_GTS_LAYER_NAMES}} — character vector of all
#'     accepted layer codes.
#'   \item \code{\link{gts_layers_full}} — full metadata list (Norwegian name,
#'     unit, resolution, earliest date) for every layer.
#' }
#'
#' @section API:
#' Data is sourced from \url{https://gts.nve.no/api/}. No authentication is
#' required.
#'
#' @keywords internal
"_PACKAGE"
