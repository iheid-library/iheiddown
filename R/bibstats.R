#' Reporting bibliographic statistics
#' 
#' These functions are useful for calculating salient statistics
#' on the bibliographies used for dissertations or syllabi. They include the
#' following functions/metrics:
#' 
#' \describe{
#'   \item{`percent_female()`}{Displays the percentage of female authors in a
#'   `.bib` file.}
#'   \item{`mean_year()`}{Displays the mean of the publication year of the items
#'   in a given `.bib` file.}
#'   \item{`mean_pages()`}{Displays the mean of the page numbers of the items
#'   in a given `.bib` file.}
#'   \item{`total_pages()`}{Displays the total number of pages of all items
#'   in a given `.bib` file.}
#' }
#' @name bibstats
#' @param bib_file A .bib file for the project.
#' If not given, the functions will search for a .bib file in the folder
#' associated with the file the source editor has open.
#' @param rmd_file A .rmd file
#' If not given, the functions will check to see whether the
#' current file open in the source editor is an .rmd file,
#' and if so use that.
#' @param by A string in c("author", "publication") which determines if the
#' percentage of female authors is computed across all authors of all papers,
#' or by publication.
#' @importFrom bib2df bib2df
#' @importFrom utils install.packages
#' @return Prints a summary statistic (e.g. mean or proportion)
#' 
NULL

#' @rdname bibstats
#' @export
percent_female <- function(bib_file,
                           rmd_file,
                           by = c("author", "publication")) {
  
  if (missing(bib_file)) bib_file <- find_bib()
  if (missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  by <- match.arg(by)
  
  if (!requireNamespace("genderdata", quietly = TRUE)) {
    if (!requireNamespace("remotes", quietly = TRUE)) {
      utils::install.packages("remotes")
    }
    remotes::install_github("lmullen/genderdata")
  }
  
  bib <- suppressWarnings(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)) {
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  }
  authors <- bib$AUTHOR
  if (by == "author") {
    authors <- unlist(authors)
    authors <- stringr::str_remove(authors, "^.+, \\{")
    authors <- stringr::str_remove(authors, "\\}")
    authors <- stringr::str_remove(authors, " .+$")
    gender <- table(gender::gender(authors)$gender)
    print(paste0(round(gender[1] / sum(gender), 2) * 100, "% female authors"))
  } else if (by == "publication") {
    authors <- lapply(authors,
                      function(x) stringr::str_remove_all(x, "^.+, \\{"))
    authors <- lapply(authors,
                      function(x) stringr::str_remove_all(x, "\\}"))
    authors <- lapply(authors,
                      function(x) stringr::str_remove_all(x, " .+$"))
    gender <- sapply(authors,
                     function(x) any(gender::gender(x)$gender == "female"))
    print(paste0(round(sum(gender) / length(gender), 2) * 100,
                 "% female authors"))
  }

}

#' @rdname bibstats
#' @export
mean_year <- function(bib_file, rmd_file) {
  if (missing(bib_file)) bib_file <- find_bib()
  if (missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  bib <- suppressMessages(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)) {
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  }
  years <- as.numeric(bib$YEAR)
  print(paste0("Average date of publication: ",
               round(mean(years, na.rm = TRUE))))
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
  pages <- lapply(pages, function(x) {
    if (length(x) == 2) as.numeric(x[[2]]) - as.numeric(x[[1]])
    else as.numeric(x)
  })
  pages <- unlist(pages)
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
  pages <- lapply(pages, function(x) {
    if (length(x) == 2) as.numeric(x[[2]]) - as.numeric(x[[1]])
    else as.numeric(x)
  })
  pages <- unlist(pages)
  print(paste0("Total number of pages: ", round(sum(pages))))
}

find_bib <- function() {
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
