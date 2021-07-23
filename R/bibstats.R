#' Printing bibliographic statistics
#' 
#' These functions are useful for calculating salient statistics
#' on the bibliographies used for dissertations or syllabi.
#' @name bibstats
#' @param bib_file a .bib file for the project
#' @importFrom bib2df bib2df
#' @importFrom gender gender
#' @return prints a summary statistic (e.g. mean or proportion)
NULL

#' @rdname bibstats
#' @export
percent_female <- function(bib_file){
  authors <- suppressWarnings(bib2df::bib2df(bib_file)$AUTHOR)
  authors <- lapply(authors, function(x) stringr::str_remove_all(x, " and"))
  authors <- lapply(authors, function(x) stringr::str_replace_all(x, "[\\w\\s]+, ", ""))
  authors <- lapply(authors, function(x) stringr::str_extract_all(x, "^\\w+"))
  authors <- unlist(authors)
  if(!require("remotes")) install.packages("remotes")
  if(!require("genderdata")) remotes::install_github("lmullen/genderdata")
  gender <- table(gender::gender(authors)$gender)
  print(paste0(round(gender[1]/sum(gender),2)*100, "% female authors"))
}

#' @rdname bibstats
#' @export
mean_year <- function(bib_file){
  years <- suppressWarnings(bib2df::bib2df(bib_file)$YEAR)
  print(paste0("Average date of publication: ", round(mean(years))))
}

#' @rdname bibstats
#' @export
mean_pages <- function(bib_file){
  pages <- suppressWarnings(bib2df::bib2df(bib_file)$PAGES)
  pages <- na.omit(pages)
  pages <- stringr::str_split(pages, "--")
  pages <- sapply(pages, function(x){
    if(length(x)==2) as.numeric(x[[2]])-as.numeric(x[[1]]) else as.numeric(x)
  })
  print(paste0("Average number of pages: ", round(mean(pages))))
}

#' @rdname bibstats
#' @export
total_pages <- function(bib_file){
  pages <- suppressWarnings(bib2df::bib2df(bib_file)$PAGES)
  pages <- na.omit(pages)
  pages <- stringr::str_split(pages, "--")
  pages <- sapply(pages, function(x){
    if(length(x)==2) as.numeric(x[[2]])-as.numeric(x[[1]]) else as.numeric(x)
  })
  print(paste0("Total number of pages: ", round(sum(pages))))
}