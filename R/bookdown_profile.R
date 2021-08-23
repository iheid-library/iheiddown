#' Manage iheiddown profile
#'
#' @description This RStudio Addin opens up the ~/_bookdown.yml file for
#' users to edit. If the file doesn't exists, it will create one.
#' @importFrom utils file.edit
#' @return Opens or creates a bookdown profile YAML file for the current thesis.
#' @export
bookdown_profile <- function() {
  profile_file <- getOption("_bookdown.yml", "~/_bookdown.yml")
  if (!file.exists(profile_file)) {
    file.copy(
      from = system.file("_bookdown.yml", package = "iheiddown"),
      to = profile_file
    )
  }
  file.edit(profile_file)
}
