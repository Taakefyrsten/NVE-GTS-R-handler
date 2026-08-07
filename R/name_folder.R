#' Construct the standard GTS output folder name
#'
#' Builds the folder name used throughout the package. The name encodes
#' everything that defines a request - the layer, the date range, the spatial
#' extent of the coordinates and how many points there are - so that two
#' different requests do not write into the same folder.
#'
#' @param name A character string used as the prefix (e.g. a site or project
#'   name). Must not contain a path separator.
#' @param layer A character string giving the GTS layer short-code (e.g.
#'   `"tm"`, `"rr"`). See \code{\link{VALID_GTS_LAYER_NAMES}}.
#' @param coordinate_list A data frame or list with numeric elements named `X`
#'   and `Y` (UTM33N metres), as passed to \code{\link{download_nve_gts}}.
#' @param first_date,last_date Character strings giving the date range in
#'   `"YYYY-MM-DD"` format.
#'
#' @return A character string of the form
#'   `"<name>_<layer>_<first_date>_<last_date>_x<range>_y<range>_<n>pts"`.
#'
#' @details
#' Coordinates are summarised as their bounding box rounded to whole
#' kilometres, which is lossless enough to read at a glance because the GTS
#' grid itself is 1 km. Where the extent collapses to a single kilometre the
#' range is printed once rather than twice (`x269` rather than `x269-269`).
#'
#' The folder name is a **human-readable label, not a unique key**. A bounding
#' box identifies an extent, not a specific set of points: a sparse transect
#' and a dense grid clipped from the same polygon share it. Uniqueness is
#' enforced instead by the manifest \code{\link{download_nve_gts}} writes
#' inside the folder, which stores the full coordinate vector and is compared
#' against on every subsequent call.
#'
#' @seealso \code{\link{download_nve_gts}},
#'   \code{\link{load_and_bind_gts_from_folder}},
#'   \code{\link{gts_folder_reset}}
#'
#' @examples
#' coords <- data.frame(X = c(269390, 270000), Y = c(6653390, 6654000))
#' name_folder("oslo_area", "tm", coords, "2023-01-01", "2023-12-31")
#' #> [1] "oslo_area_tm_2023-01-01_2023-12-31_x269-270_y6653-6654_2pts"
#'
#' @export
name_folder <- function(name, layer, coordinate_list, first_date, last_date) {
  if (length(name) != 1L || !is.character(name) || !nzchar(name)) {
    stop("`name` must be a single non-empty character string.", call. = FALSE)
  }
  if (grepl("[/\\\\]", name)) {
    stop("`name` must not contain a path separator: ", name, call. = FALSE)
  }
  if (!layer %in% VALID_GTS_LAYER_NAMES) {
    stop("`layer` must be one of VALID_GTS_LAYER_NAMES, not ", dQuote(layer, FALSE),
         call. = FALSE)
  }

  check_date(first_date, "first_date")
  check_date(last_date, "last_date")

  xy <- as_coordinate_df(coordinate_list)

  paste0(
    name, "_", layer, "_", first_date, "_", last_date, "_",
    km_range(xy$X, "x"), "_", km_range(xy$Y, "y"), "_",
    nrow(xy), if (nrow(xy) == 1L) "pt" else "pts"
  )
}

# Summarise a coordinate vector as a whole-kilometre range, collapsing the
# range to a single value when the extent is under a kilometre wide.
km_range <- function(v, prefix) {
  r <- range(round(v / 1000))
  if (r[1L] == r[2L]) paste0(prefix, r[1L]) else paste0(prefix, r[1L], "-", r[2L])
}

check_date <- function(x, arg) {
  if (length(x) != 1L || !is.character(x) || !grepl("^\\d{4}-\\d{2}-\\d{2}$", x)) {
    stop("`", arg, "` must be a single date string in \"YYYY-MM-DD\" format, not ",
         dQuote(as.character(x)[1L], FALSE), call. = FALSE)
  }
  if (is.na(as.Date(x, format = "%Y-%m-%d"))) {
    stop("`", arg, "` is not a valid date: ", dQuote(x, FALSE), call. = FALSE)
  }
  invisible(x)
}

# Normalise the user's coordinate input to a plain two-column data frame, so
# that manifests written from a data.frame, a tibble and a bare list all
# compare equal.
as_coordinate_df <- function(coordinate_list) {
  if (is.null(coordinate_list$X) || is.null(coordinate_list$Y)) {
    stop("`coordinate_list` must have elements named `X` and `Y`.", call. = FALSE)
  }
  x <- as.numeric(coordinate_list$X)
  y <- as.numeric(coordinate_list$Y)

  if (length(x) != length(y)) {
    stop("`X` and `Y` must be the same length (got ", length(x), " and ",
         length(y), ").", call. = FALSE)
  }
  if (length(x) == 0L) {
    stop("`coordinate_list` is empty - no points to download.", call. = FALSE)
  }
  if (anyNA(x) || anyNA(y)) {
    stop("`coordinate_list` contains missing coordinates.", call. = FALSE)
  }

  data.frame(X = x, Y = y)
}
