#' Previewing rmarkdown documents
#'
#' Use the \pkg{servr} package to continuously serve and reload
#' the Rmd document.
#' @name preview
#' @param moon The input Rmd file path (if missing and in RStudio, the current
#'   active document is used).
#' @param cast_from The root directory of the server.
#' @param ... Passed to \code{rmarkdown::\link[rmarkdown]{render}()}.
#' @references xaringan
#' @importFrom xaringan inf_mr
#' @export
preview_realtime <- xaringan::inf_mr

#' @rdname preview
#' @param which A integer vector of the server IDs; 
#' by default, IDs of all existing servers in the current R session obtained from `daemon_list()`, 
#' i.e., all daemon servers will be stopped by default.
#' @importFrom servr daemon_stop
#' @export
preview_stop <- servr::daemon_stop
