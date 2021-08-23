#' Creates an R Markdown PDF Problem Set document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Problem Set LaTeX template file.
#'
#' @export
#'
#' @param ... Instructions passed to the function from a correctly specified
#' .Rmd document
#' @param input The name of the .Rmd file to serve as input.
#' @importFrom rmarkdown pdf_document
#' @return A modified \code{pdf_document} based on the IHEID Problem Set LaTeX
#'   template, automatically named by course and date.
#' @examples
#' \dontrun{
#' output:
#'   iheiddown::problemset_pdf:
#'     input: "Untitled.Rmd"
#'     # Replace with whatever the name of this file is, e.g. "MINT001.Rmd"
#' }
problemset_pdf <- function(input, ...) {
  code <- readLines(input)
  code <- code[grepl("^code:", code)]
  code <- strsplit(code, " ")[[1]][2]
  rmarkdown::render(input,
                    output_file = paste0(code, "_ProblemSet_", Sys.Date()),
                    ...,
                    output_format = rmarkdown::pdf_document(
                      latex_engine = "xelatex",
                      template = system.file("rmarkdown",
                                             "templates",
                                             "problemset_pdf",
                                             "resources",
                                             "template.tex",
                                             package = "iheiddown")))
}
