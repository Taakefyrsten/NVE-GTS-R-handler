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
