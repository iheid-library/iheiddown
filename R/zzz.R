.onAttach <- function(libname, pkgname) {
  packageStartupMessage(crayon::red(pkgname, " for IHEID\n",
                                    "Version ",
                                    utils::packageVersion("iheiddown"),
    " created on ",
    utils::packageDescription("iheiddown", fields = "Date"),
    "\n"
  )
  )
}
