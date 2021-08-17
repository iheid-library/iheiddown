#' Reporting bibliographic statistics
#' 
#' These functions are useful for calculating salient statistics
#' on the bibliographies used for dissertations or syllabi.
#' @name bibstats
#' @param bib_file a .bib file for the project.
#' If not given, the functions will search for a .bib file in the folder
#' associated with the file the source editor has open.
#' @param rmd_file a .rmd file
#' If not given, the functions will check to see whether the
#' current file open in the source editor is an .rmd file,
#' and if so use that.
#' @importFrom bib2df bib2df
#' @importFrom utils install.packages
#' @return prints a summary statistic (e.g. mean or proportion)
NULL

#' @rdname bibstats
#' @export
percent_female <- function(bib_file, rmd_file) {
  if (missing(bib_file)) bib_file <- find_bib()
  if (missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  bib <- suppressMessages(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)){
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  } 
  authors <- bib$AUTHOR
  authors <- lapply(authors, function(x) stringr::str_remove_all(x, "^.+, \\{"))
  authors <- lapply(authors, function(x) stringr::str_remove_all(x, "\\}"))
  authors <- lapply(authors, function(x) stringr::str_split(x, " ")[[1]][1])
  # authors <- lapply(authors, function(x) stringr::str_remove_all(x, " and"))
  # authors <- lapply(authors, function(x) stringr::str_replace_all(x,
  #                                                                 "[\\w\\s]+, ",
  #                                                                 ""))
  # authors <- lapply(authors, function(x) stringr::str_extract_all(x, "^\\w+"))
  authors <- unlist(authors)
  if (!requireNamespace("remotes", quietly = TRUE)) 
    utils::install.packages("remotes")
  if (!requireNamespace("genderdata", quietly = TRUE)) 
    remotes::install_github("lmullen/genderdata")
  gender <- table(gender::gender(authors)$gender)
  print(paste0(round(gender[1] / sum(gender), 2) * 100, "% female authors"))
}

#' @rdname bibstats
#' @export
mean_year <- function(bib_file, rmd_file) {
  if (missing(bib_file)) bib_file <- find_bib()
  if (missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  bib <- suppressMessages(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)){
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  } 
  years <- as.numeric(bib$YEAR)
  print(paste0("Average date of publication: ", round(mean(years, na.rm = TRUE))))
}

#' @rdname bibstats
#' @export
mean_pages <- function(bib_file, rmd_file) {
  if (missing(bib_file)) bib_file <- find_bib()
  if (missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  bib <- suppressMessages(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)) {
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  } 
  pages <- bib$PAGES
  pages <- na.omit(pages)
  pages <- stringr::str_split(pages, "--")
  pages <- sapply(pages, function(x) {
    if (length(x) == 2) as.numeric(x[[2]]) - as.numeric(x[[1]])
    else as.numeric(x)
  })
  print(paste0("Average number of pages: ", round(mean(pages))))
}

#' @rdname bibstats
#' @importFrom stats na.omit
#' @importFrom stringr str_split str_detect
#' @importFrom usethis ui_info
#' @importFrom fs path_dir
#' @export
total_pages <- function(bib_file, rmd_file) {
  if (missing(bib_file)) bib_file <- find_bib()
  bib <- suppressMessages(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)) {
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  } 
  pages <- bib$PAGES
  pages <- stats::na.omit(pages)
  pages <- stringr::str_split(pages, "--")
  pages <- sapply(pages, function(x) {
    if (length(x) == 2) as.numeric(x[[2]]) - as.numeric(x[[1]])
    else as.numeric(x)
  })
  print(paste0("Total number of pages: ", round(sum(pages))))
}

find_bib <- function(){
  path <- rstudioapi::getSourceEditorContext()$path
  dir <- fs::path_dir(path)
  files <- list.files(dir)
  if (length(files[stringr::str_detect(files, ".bib")][[1]]) < 1) 
    stop("No bibliography found for current document. Please specify one.")
  bib <- files[stringr::str_detect(files, ".bib")][[1]]
  bib_file <- paste0(dir, "/", bib)
  usethis::ui_info("Found .bib file `{bib}`")
  bib_file
}
