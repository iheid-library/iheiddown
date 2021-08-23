#' Previewing rmarkdown documents
#'
#' Use the \pkg{servr} package to continuously serve and reload
#' the Rmd document. Run \code{preview_start()} function while viewing the Rmd
#' panel of your presentation. To stop the server, run \code{preview_stop()}.
#' @name preview
#' @param file_path The input Rmd file path (if missing and in RStudio, the
#' current active document is used).
#' @param ... Additional arguments passed to
#' \code{rmarkdown::\link[rmarkdown]{render}()}.
#' @references xaringan
#' @importFrom xaringan inf_mr
#' @return Starts serving the current files to RStudio's Viewer pane.
#' @export
preview_start <- function(file_path, ...) {
  xaringan::inf_mr(moon = file_path, ...)
  message("Preview started")
}

#' @rdname preview
#' @param which An integer vector of the server IDs;
#' by default, IDs of all existing servers in the current R session obtained
#' from `daemon_list()`, i.e., all daemon servers will be stopped by default.
#' @importFrom servr daemon_stop daemon_list
#' @return Stops serving the current files to RStudio's Viewer pane.
#' @export
preview_stop <- function(which = NULL) {
  if (is.null(which)) which <- servr::daemon_list()
  servr::daemon_stop(which)
  message("Preview stopped")
}
