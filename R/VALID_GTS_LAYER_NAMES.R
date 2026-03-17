#' Valid NVE GTS layer names
#'
#' A character vector of all layer short-codes accepted by the NVE Grid Time
#' Series API. Used as the default and validation set for the \code{layer}
#' argument of \code{\link{download_nve_gts}}.
#'
#' For full metadata on each layer (Norwegian full name, unit, time resolution,
#' and earliest available date) see \code{\link{gts_layers_full}}.
#'
#' @format A character vector with 76 elements. Selected examples:
#' \describe{
#'   \item{rr}{Daily precipitation (mm)}
#'   \item{tm}{Daily mean temperature (°C, stored as Kelvin)}
#'   \item{swe}{Snow water equivalent (mm)}
#'   \item{sd}{Snow depth (raw mm, displayed as cm)}
#'   \item{windSpeed10m24h06}{10 m wind speed, daily (m/s)}
#' }
#'
#' @seealso \code{\link{gts_layers_full}}, \code{\link{download_nve_gts}}
#'
#' @source \url{https://gts.nve.no/api/}
"VALID_GTS_LAYER_NAMES"

VALID_GTS_LAYER_NAMES <- c(
  "rr","rr3d","rr1h","rr3h","rrl","rrl3h","rrprrrxm5","rr3hprrr3hxm5","rrsc",
  "rrsc3h","darr3h","tm","tm1h","tm3h","datm3h","swe","swe3h","snowload",
  "sd","sd3h","swepr","age","sca","ski","qtt","qtt3h","qtt7d","qtt10d","qttsdai",
  "gwb_q","gwb_eva","qtt3dls","tmgr","swechange7d","fsw","fsw3h","fsw3d","fsw7d",
  "sdfsw","sdfsw3h","qsw","qsw7d","qsw3h","lwc","lwc3h","gwb_sssdev","gwb_frd",
  "gwb_sssrel","sdfsw3d","gwb_qttprrrxm200","gwb_qtt3dprrrxm200","gwb_qprqxyrx30yr",
  "gwb_qttprqttxyrx30yr","gwb_qtt3dprqtt3dxyrx30yr","additionalSnowDepth",
  "depthHoarIndex1","depthHoarIndex2","gwb_qtt","gwb_landslideindex1",
  "gwb_landslideindex2","qttls","gwb_gwtdev","gwb_gwt","gwb_qtt3d",
  "gwb_qttprgwb_rryr30yr","gwb_qtt3dlst","sdfsw7d","swerank",
  "windDirection10m24h06","windDirection10m1h","windDirection10m3h",
  "windSpeed10m24h06","windSpeed10m1h","windSpeed10m3h","qswenergy",
  "qswenergy3h","slushflowRatio","fmi10d"
)
