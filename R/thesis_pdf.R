#' Creates an R Markdown PDF Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Thesis LaTeX template file.
#' @param ... Instructions passed to the function from a correctly specified .Rmd document
#' @param author The surname of the author, 
#' passed to the function by a correctly specified .Rmd document
#' @return A modified \code{pdf_document} based on the IHEID Thesis LaTeX
#'   template
#' @examples
#' \dontrun{
#' knit: iheiddown::thesis_pdf
#' }
#' @importFrom bookdown render_book pdf_book
#' @export
thesis_pdf <- function(..., author){
  options(bookdown.render.file_scope = FALSE)
  bookdown::render_book(..., 
                        output_file = paste0(author, "_", "Thesis_", Sys.Date()), 
                        output_format = bookdown::pdf_book(latex_engine = "xelatex",
                                                        template = system.file('rmarkdown', 'templates', 'thesis_pdf', 'resources', 'template.tex',
                                                                               package = 'iheiddown'), citation_package = "biblatex"))
  file.remove(c(list.files(pattern='.*.maf', recursive=TRUE),
                list.files(pattern='.*.mtc', recursive=TRUE)))
}

#' Creates an R Markdown PDF Thesis chapter
#'
#' This function can be used in the header of each constituent chapter of an IHEID thesis
#' to output a draft version of the chapter for proofreading or sending to your supervisor.
#' @param ... Instructions passed to the function from a correctly specified .Rmd document
#' @param author The surname of the author, passed to the function by a correctly specified .Rmd document
#' @param chapter The chapter number (or title) of the dissertation, passed to the function by a correctly specified .Rmd document
#' @param in_context Whether to embed the chapter in the existing table of contents for the thesis.
#' By default FALSE.
#' @importFrom bookdown preview_chapter
#' @importFrom rmarkdown pdf_document
#' @import crayon
#' @return A modified \code{pdf_document} based on the IHEID Thesis LaTeX
#'   template
#' @examples
#' \dontrun{
#' knit: iheiddown::chapter_pdf
#' }
#' @export
chapter_pdf <- function(..., author, chapter, in_context = FALSE){
  
  if(in_context){
    bookdown::preview_chapter(...,
                              output_file = paste0("versions/", author, "_", "Chapter_", chapter, "_", Sys.Date()), 
                              output_format = rmarkdown::pdf_document(latex_engine = "xelatex",
                                                                      template = system.file('rmarkdown', 'templates', 'chapter_pdf', 'resources', 'template.tex',
                                                                                             package = 'iheiddown')))
    file.remove(c(list.files(pattern='.*.maf', recursive=TRUE),
                  list.files(pattern='.*.mtc', recursive=TRUE)))
  } else {
    rmarkdown::render(...,
                      output_file = paste0("versions/", author, "_", "Chapter_", chapter, "_", Sys.Date()), 
                      output_format = rmarkdown::pdf_document(latex_engine = "xelatex",
                                                              template = system.file('rmarkdown', 'templates', 'chapter_pdf', 'resources', 'template.tex',
                                                                                     package = 'iheiddown')))
  }
  
  
}
