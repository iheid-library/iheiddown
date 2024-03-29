% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thesis_pdf.R
\name{chapter_pdf}
\alias{chapter_pdf}
\title{Creates an R Markdown PDF Thesis chapter}
\usage{
chapter_pdf(input, ...)
}
\arguments{
\item{input}{Rmd input file that will be processed by the function.}

\item{...}{Instructions passed to the function from a correctly specified
.Rmd document}
}
\value{
A modified \code{pdf_document} based on the IHEID Thesis LaTeX
template
}
\description{
This function can be used in the header of each constituent chapter of an
IHEID thesis to output a draft version of the chapter for proofreading or
sending to your supervisor.
}
\examples{
\dontrun{
knit: iheiddown::chapter_pdf
}
}
