#' Construct the standard GTS output folder name
#'
#' Combines a user-supplied name and a GTS layer identifier into the folder
#' name convention used throughout the package (`<name>_<layer>`).
#'
#' @param name A character string used as the prefix (e.g. a site or project
#'   name).
#' @param layer A character string giving the GTS layer short-code (e.g.
#'   `"tm"`, `"rr"`). See \code{\link{VALID_GTS_LAYER_NAMES}}.
#'
#' @return A character string of the form `"<name>_<layer>"`.
#'
#' @seealso \code{\link{download_nve_gts}},
#'   \code{\link{load_and_bind_gts_from_folder}},
#'   \code{\link{gts_folder_reset}}
#'
#' @examples
#' name_folder("oslo_area", "tm")
#' #> [1] "oslo_area_tm"
#'
#' @export
name_folder <- function(name, layer){ paste0(name, "_", layer) }
