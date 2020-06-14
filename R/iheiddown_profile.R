#' Manage iheiddown profile
#'
#' @description This RStudio Addin opens up the ~/iheiddown-profile.yaml file for
#' users to edit. If the file doesn't exists, it will create one.
#' 
#' @importFrom utils file.edit
#' @export
iheiddown_profile <- function() {
  profile_file <- getOption("iheiddown_profile", "~/iheiddown-profile.yaml")
  if (!file.exists(profile_file)) {
    file.copy(
      from = system.file("iheiddown-profile.yaml", package = "iheiddown"),
      to = profile_file
    )
  }
  file.edit(profile_file)
}