#' Advance dates by week
#'
#' @description This function takes a start date, e.g. of a course,
#' and advances it by a number of weeks.
#' This function is used in the syllabus template.
#' 
#' @param startdate The first date in the series (e.g. first day of class).
#' @param week The number of weeks into the series. 
#' Week 1 is the first date in the series.
#' @return A vector of dates in the format "dd mmm" in parentheses.
#' @examples
#' advdate("2021-06-23", 1:3)
#' @export
advdate <- function(startdate, week) {
  zadv <- as.Date(startdate) + 7*(week-1)
  tmp <- paste0("(", trimws(format(zadv, format="%e %b")), ")")
  return(tmp)
}
