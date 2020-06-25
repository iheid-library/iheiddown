#' Creates an R Markdown PDF Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Thesis LaTeX template file.
#'
#' @export
#'
#' @return A modified \code{pdf_document} based on the IHEID Thesis LaTeX
#'   template
#' @examples
#' \dontrun{
#' output:iheiddown::thesis_pdf
#' }
thesis_pdf <- function(...){
  bookdown::pdf_book(..., latex_engine = "xelatex",
                     template = system.file('rmarkdown', 'templates', 'thesis_pdf', 'resources', 'template.tex', 
                                                 package = 'iheiddown'))
}
