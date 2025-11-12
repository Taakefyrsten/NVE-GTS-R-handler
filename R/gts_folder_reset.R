gts_folder_reset <- function(folder_name) {
  # This function deletes all files in a given folder NB !DANGER DANGER!
  # Ask the user to confirm
  confirm <- readline(
    prompt = paste0("⚠️ This will DELETE ALL FILES in '", folder_name, "'.\n",
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
