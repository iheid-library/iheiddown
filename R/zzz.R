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

utils::globalVariables(c("value", "is_code", "start_end", "start_comment", "end_comment"))