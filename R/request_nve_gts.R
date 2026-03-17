#' Perform a single NVE GTS API request
#'
#' Sends an HTTP GET request to a NVE Grid Time Series API URL and returns the
#' parsed JSON response body. Returns \code{NULL} on HTTP errors or network
#' failures, making it safe to use inside parallel map calls.
#'
#' @param url A character string containing the full NVE GTS API URL, e.g. as
#'   constructed by \code{\link{download_nve_gts}}.
#'
#' @return A list representing the parsed JSON response body, or \code{NULL} if
#'   the request fails or returns a non-200 status code.
#'
#' @seealso \code{\link{download_nve_gts}}
#'
#' @examples
#' \dontrun{
#' url <- paste0(
#'   "https://gts.nve.no/api/GridTimeSeries/",
#'   "269390/6653390/2023-01-01/2023-01-31/tm.json"
#' )
#' result <- request_nve_gts(url)
#' }
#'
#' @importFrom httr2 request req_perform resp_status resp_body_json
#' @export
request_nve_gts <- function(url) {
  # Runs a request for a given GTS url
  req <- httr2::request(url)

  tryCatch({
    resp <- req |> httr2::req_perform()
    if (resp |> httr2::resp_status() == 200) {
      resp |> httr2::resp_body_json()
    } else {
      NULL
    }
  }, error = function(e) {
    return(NULL)
  })
}
