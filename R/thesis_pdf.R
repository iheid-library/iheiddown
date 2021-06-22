#' Creates an R Markdown PDF Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the IHEID Thesis LaTeX template file.
#' @param input Rmd input file that will be processed by the function.
#' @param ... Instructions passed to the function from a correctly specified .Rmd document
#' @return A modified \code{pdf_document} based on the IHEID Thesis LaTeX
#'   template
#' @examples
#' \dontrun{
#' knit: iheiddown::thesis_pdf
#' }
#' @importFrom bookdown render_book pdf_book
#' @export
thesis_pdf <- function(input = ".", ...){
  options(bookdown.render.file_scope = FALSE)
  
  author <- readLines(input)
  author <- author[grepl("^lastnames:", author)]
  author <- strsplit(author, " ")[[1]][2]
  
  bookdown::render_book(..., 
                        output_file = paste0("Thesis_", author, "_", Sys.Date()), 
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
#' @param input Rmd input file that will be processed by the function.
#' @param ... Instructions passed to the function from a correctly specified .Rmd document
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
chapter_pdf <- function(input, ...){
  # Extract metadata to check whether to knit in context or not.
  in_context <- readLines(input)
  in_context <- in_context[grepl("^in_context:", in_context)]
  in_context <- strsplit(in_context, " ")[[1]][2]
  if(in_context){
    # Extract metadata to name output file without running into annoying 
    # bookdown error
    author <- readLines(input)
    author <- author[grepl("^author:", author)]
    author <- strsplit(author, " ")[[1]][2]
    chapter <- readLines(input)
    chapter <- chapter[grepl("^chapter:", chapter)]
    chapter <- strsplit(chapter, " ")[[1]][2]
    message("In-context rendering")
    #Render chapter
    bookdown::preview_chapter(input = input, ...,
                              output_file = paste0("versions/", author, "_", "Chapter_", chapter, "_", Sys.Date()), 
                              output_format = rmarkdown::pdf_document(latex_engine = "xelatex",
                                                                      template = system.file('rmarkdown', 'templates', 'chapter_pdf', 'resources', 'template.tex',
                                                                                             package = 'iheiddown')))
    file.remove(c(list.files(pattern='.*.maf', recursive=TRUE),
                  list.files(pattern='.*.mtc', recursive=TRUE)))
  } else {
    # Extract metadata to name output file without running into annoying 
    # bookdown error
    author <- readLines(input)
    author <- author[grepl("^author:", author)]
    author <- strsplit(author, " ")[[1]][2]
    chapter <- readLines(input)
    chapter <- chapter[grepl("^chapter:", chapter)]
    chapter <- strsplit(chapter, " ")[[1]][2]
    message("Out of context rendering")
    #Render chapter
    rmarkdown::render(input ,...,
                      output_file = paste0("versions/", author, "_", "Chapter_", chapter, "_", Sys.Date()), 
                      output_format = rmarkdown::pdf_document(latex_engine = "xelatex",
                                                              template = system.file('rmarkdown', 'templates', 'chapter_pdf', 'resources', 'template.tex',
                                                                                     package = 'iheiddown')))
  }
  
  
}
