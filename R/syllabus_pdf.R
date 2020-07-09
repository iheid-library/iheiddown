#' Creates an R Markdown PDF Syllabus document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Syllabus LaTeX template file.
#'
#' @export
#'
#' @param input The name of the .Rmd file to serve as input.
#' @return A modified \code{pdf_document} based on the IHEID Syllabus LaTeX
#'   template
#' @examples
#' \dontrun{
#' output:
#'   iheiddown::syllabus_pdf:
#'     input: "Untitled.Rmd" # Replace with whatever the name of this file is, e.g. "MINT001.Rmd"
#' }
syllabus_pdf <- function(...){
  rmarkdown::render(input, 
                    ..., 
                    output_format = rmarkdown::pdf_document(..., latex_engine = "xelatex",
                     template = system.file('rmarkdown', 'templates', 'syllabus_pdf', 'resources', 'template.tex',
                                                 package = 'iheiddown'),
                     ))
}
