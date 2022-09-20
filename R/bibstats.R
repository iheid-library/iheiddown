#' Reporting bibliographic statistics
#' 
#' These functions are useful for calculating salient statistics
#' on the bibliographies used for dissertations or syllabi. They include the
#' following functions/metrics:
#' 
#' \describe{
#'   \item{`percent_female()`}{Displays the percentage of authors in a
#'   `.bib` file that are female. See the `{gender}` package for more details.}
#'   \item{`mean_year()`}{Displays the average year of publication of the items
#'   in a given `.bib` file.}
#'   \item{`mean_pages()`}{Displays the average number of pages of the items
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
#' percentage of female authors is computed across all papers or the percentage
#' represents the proportion of papers written by at least one woman.
#' @importFrom bib2df bib2df
#' @importFrom utils install.packages
#' @return Prints a summary statistic (e.g. mean or proportion)
NULL

#' @rdname bibstats
#' @export
percent_female <- function(bib_file,
                           rmd_file,
                           by = c("author", "publication")) {
  
  if (missing(bib_file)) bib_file <- find_bib()
  if (missing(rmd_file)) rmd_file <- rstudioapi::getSourceEditorContext()$path
  by <- match.arg(by, c("author", "publication"))
  # if (!requireNamespace("genderdata", quietly = TRUE)) {
  #   if (!requireNamespace("remotes", quietly = TRUE)) {
  #     utils::install.packages("remotes")
  #   }
  #   remotes::install_github("lmullen/genderdata")
  # }
  bib <- suppressWarnings(bib2df::bib2df(bib_file))
  if (!missing(rmd_file)) {
    used <- get_used_bib(bib_file, rmd_file)
    bib <- dplyr::filter(bib, .data$BIBTEXKEY %in% used)
  }
  authors <- bib$AUTHOR
  gender <- NULL
  # Total percentage of women
  if (by == "author") {
    authors <- unlist(authors)
    authors <- stringr::str_remove(authors, "^.+, \\{")
    authors <- stringr::str_remove(authors, "\\}")
    authors <- stringr::str_remove(authors, ".*,[:blank:]")
    authors <- stringr::str_remove(authors, "\\s.*")
    gender <- tryCatch({
      table(gender::gender(authors, method = "genderize")$gender)
    },
    message = "Rate limit for the `{gender}` R package has been reached due to the amount of download requests.
    Please wait a few hours and try again later."
    )
    if (!is.null(gender)) {
      paste0((1 - round(gender[2] / sum(gender), 2)) * 100,
             "% female authors") 
    }
  } else if (by == "publication") {
    # Percentage of papers written by at least one women
    for (i in seq_len(length(authors))) {
      for (j in seq_len(length(authors[[i]]))) {
        authors[[i]][[j]] <- stringr::str_remove(authors[[i]][[j]],
                                                 "^.+, \\{")
        authors[[i]][[j]] <- stringr::str_remove(authors[[i]][[j]],
                                                 "\\}")
        authors[[i]][[j]] <- stringr::str_remove(authors[[i]][[j]],
                                                 ".*,[:blank:]")
      }
    }
    gender <- tryCatch({
      sapply(authors, function(x)
        any(gender::gender(x, method = "genderize")$gender == "female"))
      },
      message = "Rate limit for the `{gender}` R package has been reached due to the amount of download requests.
      Please wait a few hours and try again later."
      )
    if (!is.null(gender)) {
      paste0(round(sum(gender) / length(gender), 2) * 100,
             "% female authors") 
    }
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
  paste0("Average date of publication: ",
               round(mean(years, na.rm = TRUE)))
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
  paste0("Average number of pages: ", round(mean(pages)))
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
  paste0("Total number of pages: ", round(sum(pages)))
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
