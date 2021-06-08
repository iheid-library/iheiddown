#' Previewing rmarkdown documents
#'
#' Use the \pkg{servr} package to continuously serve and reload
#' the Rmd document.
#' @name preview
#' @param file_path The input Rmd file path (if missing and in RStudio, the current
#'   active document is used).
#' @param root_dir The root directory of the server.
#' @param ... Passed to \code{rmarkdown::\link[rmarkdown]{render}()}.
#' @references xaringan
#' @importFrom xaringan inf_mr
#' @export
preview_realtime <- function(file_path, root_dir, ...){
  xaringan::inf_mr(moon = file_path, cast_from = root_dir, ...)
}

#' @rdname preview
#' @param which A integer vector of the server IDs; 
#' by default, IDs of all existing servers in the current R session obtained from `daemon_list()`, 
#' i.e., all daemon servers will be stopped by default.
#' @importFrom servr daemon_stop daemon_list
#' @export
preview_stop <- function(which = NULL){
  if(is.null(which)) which <- servr::daemon_list()
  servr::daemon_stop(which)
}
