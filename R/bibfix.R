#' @export
fix_bib <- function(bib_file){
  if(missing(bib_file)) bib_file <- find_bib()
  bib <- suppressMessages(bib2df::bib2df(bib_file))
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


#' @export
get_used_bib <- function(bib_file, rmd_file){
  if(missing(bib_file)) bib_file <- find_bib()
  if(missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  bib <- suppressMessages(bib2df::bib2df(bib_file))
  current_bibs <- readr::read_lines(rmd_file) %>%
    tibble::as_tibble() %>%
    remove_front_matter() %>%
    remove_code_chunks() %>%
    remove_inline_code() %>%
    remove_html_comment() %>%
    get_biblines() %>%
    dplyr::mutate(value = stringr::str_remove(value, "@")) %>%
    select(value) %>% c()
  current_bibs$value
}

get_biblines <- function(x){
  filter(x, grepl("@", .data$value))
}
