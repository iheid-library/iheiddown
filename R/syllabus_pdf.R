#' Creates an R Markdown PDF Syllabus document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Syllabus LaTeX template file.
#'
#' @export
#'
#' @param ... Instructions passed to the function from a correctly specified
#' .Rmd document
#' @param input The name of the .Rmd file to serve as input.
#' @importFrom rmarkdown pdf_document
#' @return A modified \code{pdf_document} based on the IHEID Syllabus LaTeX
#'   template, automatically named by course and date.
#' @examples
#' \dontrun{
#' output:
#'   iheiddown::syllabus_pdf:
#'     input: "Untitled.Rmd" 
#'     # Replace with whatever the name of this file is, e.g. "MINT001.Rmd"
#' }
syllabus_pdf <- function(input, ...) {
  code <- readLines(input)
  code <- code[grepl("^code:", code)]
  code <- strsplit(code, " ")[[1]][2]
  # Set base format
  output_format <- rmarkdown::pdf_document(
    latex_engine = "xelatex",
    template = system.file("rmarkdown",
                           "templates",
                           "syllabus_pdf",
                           "resources",
                           "template.tex",
                           package = "iheiddown"))
  # Add lua filter
  output_format$pandoc$lua_filters <- c(
    rmarkdown::pandoc_path_arg(rmarkdown::pkg_file_lua(filters = "color-text.lua",
                                                      package = "iheiddown")), 
    output_format$pandoc$lua_filters)
  # Render stuff
  rmarkdown::render(input,
                    output_file = paste0(code, "_Syllabus_", Sys.Date()),
                    ...,
                    output_format = output_format)
                      
}
