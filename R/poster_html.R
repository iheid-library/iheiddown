#' Posterdown inspired HTML posters
#' 
#' These functions render different versions of the original `{posterdown}`
#' templates with a little IHEID twist to them. All exports are in HTML format.
#' You can save them by printing them to PDF via a modern browser.
#'
#' @param ... Additional arguments to `rmarkdown::html_document`
#' @param template Additional argument passed to `pagedown::poster_relaxed`.
#' IHEID poster templates by default.
#' @param css Additional argument passed to `pagedown::poster_relaxed`.
#' NULL by default.
#' @source [`{Posterdown}`](https://github.com/brentthorne/posterdown)
#' @return R Markdown output format to pass to
#'   [rmarkdown::render()]
#'
#' @examples
#' \dontrun{
#' file <- file.path(tempdir(),"foo.rmd")
#' rmarkdown::draft(file, template="iheiddown_poster", package="iheiddown")
#' }
#' @name posterdown_html
NULL

#' @rdname posterdown_html 
#' @export
iheiddown_poster <- function(...,
	template = system.file("rmarkdown",
	                       "templates",
	                       "iheiddown_poster",
	                       "resources",
	                       "template.html",
	                       package = "iheiddown"), 
	css = NULL) {
	pagedown::poster_relaxed(...,
	                         css = css,
	                         template = template)
}

#' @description The output format `poster_betterland()` mimics the style of the
#' BetterPoster movement from twitter with an IHEID twist.
#' @rdname posterdown_html
#' @export
iheiddown_betterland <- function(...,
                            template = system.file("rmarkdown",
                                                   "templates",
                                                   "iheiddown_betterland",
                                                   "resources",
                                                   "template.html",
                                                   package = "iheiddown"),
                            css = NULL) {
  pagedown::poster_relaxed(...,
                           css = css,
                           template = template)
}

#' @description The output format `poster_betterport()` mimics the style of the
#' BetterPoster movement from twitter with an IHEID twist.
#' @rdname posterdown_html
#' @export
iheiddown_betterport <- function(...,
                                  template = system.file("rmarkdown",
                                                         "templates",
                                                         "iheiddown_betterport",
                                                         "resources",
                                                         "template.html",
                                                         package = "iheiddown"),
                                  css = NULL) {
  pagedown::poster_relaxed(...,
                           css = css,
                           template = template)
}
