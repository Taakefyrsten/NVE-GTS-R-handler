#' Delete all files in a GTS batch folder
#'
#' Interactively prompts the user for confirmation before deleting all files in
#' the specified folder. This is intended to clear previously downloaded GTS
#' batch `.rds` files so that \code{\link{download_nve_gts}} can re-fetch from
#' scratch. The folder itself is preserved; only its contents are removed.
#'
#' @param folder_name A character string giving the path to the folder to
#'   reset (relative to the current working directory). This is the value
#'   returned by \code{\link{download_nve_gts}}, and can also be reconstructed
#'   with \code{\link{name_folder}}.
#'
#' @return \code{TRUE} invisibly if files were deleted or the folder was
#'   already empty; \code{FALSE} invisibly if the user cancelled the
#'   operation.
#'
#' @details
#' The folder's request manifest is deleted along with the batch files, which
#' is what makes the folder reusable for a different date range or coordinate
#' set - \code{\link{download_nve_gts}} refuses to write into a folder whose
#' manifest describes a different request.
#'
#' @section Warning:
#' This function **permanently deletes files**. Deletion cannot be undone.
#' The user must type `TRUE` at the prompt to proceed.
#'
#' @seealso \code{\link{download_nve_gts}}, \code{\link{name_folder}}
#'
#' @examples
#' \dontrun{
#' gts_folder_reset("oslo_area_tm_2023-01-01_2023-12-31_x269-270_y6653-6654_2pts")
#' }
#'
#' @export
gts_folder_reset <- function(folder_name) {
  # This function deletes all files in a given folder NB !DANGER DANGER!
  # Ask the user to confirm
  confirm <- readline(
    prompt = paste0("WARNING: This will DELETE ALL FILES in '", folder_name, "'.\n",
                    "Type 'TRUE' to continue: ")
  )

  # Check confirmation
  if (tolower(confirm) != "true") {
    message("Operation cancelled by user.")
    return(invisible(FALSE))
  }

  # Proceed with deletion
  file_names <- list.files(path = folder_name, full.names = TRUE)

  if (length(file_names) == 0) {
    message("No files found in folder: ", folder_name)
    return(invisible(TRUE))
  }

  file.remove(file_names)
  message("All files deleted from: ", folder_name)
  return(invisible(TRUE))
}
