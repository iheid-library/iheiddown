#' Creates an R Markdown PDF Syllabus document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Syllabus LaTeX template file.
#'
#' @export
#'
#' @return A modified \code{pdf_document} based on the IHEID Syllabus LaTeX
#'   template
#' @examples
#' \dontrun{
#' output:iheiddown::syllabus_pdf
#' }
syllabus_pdf <- function(...){
  rmarkdown::pdf_document(..., latex_engine = "xelatex",
                     template = system.file('rmarkdown', 'templates', 'syllabus_pdf', 'resources', 'template.tex', 
                                                 package = 'iheiddown'))
}
