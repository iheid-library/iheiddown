#' @importFrom utils packageVersion packageDescription
.onLoad <- function(libname, pkgname) {
  packageStartupMessage(pkgname, " for IHEID\n")
  packageStartupMessage("Version ", utils::packageVersion("iheiddown"),
    " created on ",
    utils::packageDescription("iheiddown", fields = "Date"),
    "\n"
  )
}
