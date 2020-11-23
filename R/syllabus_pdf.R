#' Creates an R Markdown PDF Syllabus document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Syllabus LaTeX template file.
#'
#' @export
#'
#' @param ... Instructions passed to the function from a correctly specified .Rmd document
#' @param input The name of the .Rmd file to serve as input.
#' @param output_file The file name for the exported PDF. Giving the course code variable '*code'
#' specified in the YAML above provides an automatically named file.
#' @importFrom rmarkdown pdf_document
#' @return A modified \code{pdf_document} based on the IHEID Syllabus LaTeX
#'   template, automatically named by course and date.
#' @examples
#' \dontrun{
#' output:
#'   iheiddown::syllabus_pdf:
#'     input: "Untitled.Rmd" # Replace with whatever the name of this file is, e.g. "MINT001.Rmd"
#'     output_file: *code
#' }
syllabus_pdf <- function(input, output_file, ...){
  rmarkdown::render(input, 
                    output_file = paste0(output_file, "_Syllabus_", Sys.Date()), # = paste(rmarkdown::metadata$code,'.pdf'), 
                    ..., 
                    output_format = rmarkdown::pdf_document(..., latex_engine = "xelatex",
                     template = system.file('rmarkdown', 'templates', 'syllabus_pdf', 'resources', 'template.tex',
                                                 package = 'iheiddown'),
                     ))
}
