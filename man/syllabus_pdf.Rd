% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/syllabus_pdf.R
\name{syllabus_pdf}
\alias{syllabus_pdf}
\title{Creates an R Markdown PDF Syllabus document}
\usage{
syllabus_pdf(input, ...)
}
\arguments{
\item{input}{The name of the .Rmd file to serve as input.}

\item{...}{Instructions passed to the function from a correctly specified
.Rmd document}
}
\value{
A modified \code{pdf_document} based on the IHEID Syllabus LaTeX
template, automatically named by course and date.
}
\description{
This is a function called in output in the YAML of the driver Rmd file
to specify using the IHEID Syllabus LaTeX template file.
}
\examples{
\dontrun{
output:
  iheiddown::syllabus_pdf:
    input: "Untitled.Rmd" 
    # Replace with whatever the name of this file is, e.g. "MINT001.Rmd"
}
}
