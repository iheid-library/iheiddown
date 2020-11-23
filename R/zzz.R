.onLoad <- function(libname, pkgname) {
  packageStartupMessage(crayon::red(pkgname, " for IHEID\n"))
  packageStartupMessage(crayon::red("Version ", utils::packageVersion("iheiddown"),
    " created on ",
    utils::packageDescription("iheiddown", fields = "Date"),
    "\n"
  ))
}
