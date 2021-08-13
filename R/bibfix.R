#' @export
fix_bib <- function(bib_file){
  bib <- suppressWarnings(bib2df::bib2df(bib_file))
  bib$PAGES <- stringr::str_replace_all(bib$PAGES, stringr::fixed("{\\textendash}"), "--")
  bib$AUTHOR <- purrr::map(bib$AUTHOR, function(x){
    x <- stringr::str_replace(x, "^", "{")
    x <- stringr::str_replace(x, "\\{\\{", "{")
    x <- stringr::str_replace(x, "$", "}")
    x <- stringr::str_replace(x, "\\}\\}", "}")
  })
  bib$EDITOR <- purrr::map(bib$EDITOR, function(x){
    x <- stringr::str_replace(x, "^", "{")
    x <- stringr::str_replace(x, "\\{\\{", "{")
    x <- stringr::str_replace(x, "$", "}")
    x <- stringr::str_replace(x, "\\}\\}", "}")
  })
  bib2df::df2bib(bib, bib_file)
}