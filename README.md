
# iheiddown

<img src="man/figures/iheiddown.png" align="right" width="220"/>

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#maturing)
![CRAN/METACRAN](https://img.shields.io/cran/v/iheiddown) ![GitHub
release (latest by
date)](https://img.shields.io/github/v/release/jhollway/iheiddown)
![GitHub Release
Date](https://img.shields.io/github/release-date/jhollway/iheiddown)
![GitHub
issues](https://img.shields.io/github/issues-raw/jhollway/iheiddown)
<!-- [![HitCount](http://hits.dwyl.com/jhollway/iheiddown.svg)](http://hits.dwyl.com/jhollway/iheiddown) -->
[![Codecov test
coverage](https://codecov.io/gh/jhollway/iheiddown/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jhollway/iheiddown?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/jhollway/iheiddown/badge/main)](https://www.codefactor.io/repository/github/jhollway/iheiddown/overview/main)
<!-- ![GitHub All Releases](https://img.shields.io/github/downloads/jhollway/iheiddown/total) -->
<!-- badges: end -->

## Table of Contents

-   [iheiddown](#iheiddown)
    -   [Write your dissertation](#write-your-dissertation)
    -   [But not only !](#but-not-only-!)
    -   [Installation](#installation)
    -   [Quick start guide](#quick-start-guide)
    -   [Feedback](#feedback)

`{iheiddown}` is a package that provides templates for writing documents
in styles consistent with the Geneva Graduate Institute/ Institut de
Hautes Etudes Internationales et du Developpement (IHEID) in (R)
markdown.

The main use case for `{iheiddown}` is for writing a **Masters or PhD
Dissertation at IHEID**, as it offers a user-friendly, simple, and
straightforward way to write a well-formatted and consistent
dissertation that weaves together argument, evidence, and
interpretation. However, it also integrates templates for creating IHEID
themed presentations powered by
[`{xaringan}`](https://github.com/yihui/xaringan) as well as a template
for IHEID course syllabi.

## Write your dissertation

The package is built upon the [IHEID LaTeX dissertation
template](https://github.com/jhollway/iheidmytex), which offers versus
common word processors:

-   less prone to corruption or crashing
-   more internal consistency
-   ensured consistency with the IHEID dissertation and other
    guidelines, e.g. dedication, abstract, abbreviations, tables of
    contents, figures, and tables
-   automatic figure and table referencing
-   automatic compilation of your references and bibliography (under
    different styles)
-   compilation chapter-by-chapter (for sending to your supervisor) or
    whole dissertation (for submission)
-   cross-referencing
-   smaller files
-   automatic versioning
-   and much more!

Though you may have never had problems using Word in the past, the size
and structure of most theses tax Word’s capabilities.

However, `{iheiddown}` helps you avoid the need to (learn how to) write
in LaTeX. LaTeX can be daunting for first time users, and many users
often feel it would only pay off if they were writing very complex
dissertations. `{iheiddown}` allows students to write their
dissertations in *RMarkdown*.
[*Markdown*](https://www.markdownguide.org) is a simple and easy-to-use
way to ‘markup’ parts of plain text as headings, **bold** or *italics*
(and much more) in ways that remain very readable and thus editable as
you write. `{iheiddown}`, R, and LaTeX do the work to turn this into a
beautiful dissertation. You write in minimally marked-up plain text and
you get a correctly-formatted dissertation out at the end.

But wait, there’s more! Because `{iheiddown}` is an **R** package, it
especially shines for those who are analysing data.
[R](https://www.r-project.org) is a *free* statistical programme and
language that has a *huge* range of packages available for most current
methods of analysis and visualisation.
[RStudio](https://www.rstudio.com) is a typical frontend that makes
working in **R** and especially with `{iheiddown}` easy. So though
`{iheiddown}` is especially attractive to those writing dissertations
with many tables and figures, the user-friendly nature and pretty output
should make it of great benefit to nearly anyone writing a thesis
project.

You can see an example of the kind of dissertation output on the package
website.

## But not only !

Not quite done yet, there is even more! Take a look at the following
table for all available templates:

| Templates                                                       | Format                       | Status                |
|-----------------------------------------------------------------|------------------------------|-----------------------|
| Thesis                                                          | PDF                          | :thumbsup:            |
| Syllabus                                                        | PDF                          | :thumbsup:            |
| [`{xaringan}`](https://github.com/yihui/xaringan) presentations | HTML (can be printed to PDF) | :thumbsup:            |
| Problem set                                                     | PDF                          | :thumbsup:            |
| Posters                                                         | HTML (+ print to PDF)        | :star2: :new: :star2: |
| *Your idea*                                                     | *Open a PR!*                 | :sparkles:            |

## Installation

### Prerequisites

You will first need to install the following software on your
system<sup>[2](#myfootnote2)</sup>:

-   [R](https://cran.r-project.org)
-   [RStudio version 1.2 or
    higher](https://www.rstudio.com/products/rstudio/download/#download),
    and
-   [LaTeX](https://www.latex-project.org/get/) or
    [MiKTeX](https://miktex.org/howto/install-miktex/)<sup>[1](#myfootnote1)</sup>

### Installing the Stable Version

The easiest way to install the latest stable version of `{iheiddown}` is
via CRAN. Simply open the R console and enter the following to install
and load `{iheiddown}`

``` r
install.packages('iheiddown')
library(iheiddown)
```

That’s it! `iheiddown` is now installed and ready to go.

### Istalling the Development Version

To get access to the latest features, you may want to install the
development version of the package.

An easy way of getting access to this version is to install the latest
main version of `{iheiddown}` from Github. To do that, please install
the `{remotes}` package from CRAN and then enter the following commands
into the console:

-   For latest stable version:
    `remotes::install_github("jhollway/iheiddown")`
-   For latest development version:
    `remotes::install_github("jhollway/iheiddown@develop")`

Alternatively, you can find the binaries for all major OSes – Windows,
Mac, and Linux – by looking up the latest release of the package
[here](https://github.com/jhollway/iheiddown/releases/latest). Manually
download the appropriate binary for your operating system, and install
using an adapted version of the following commands:

-   For Windows:
    `install.packages("~/Downloads/iheiddown_winOS.zip", repos = NULL)`
-   For Mac:
    `install.packages("~/Downloads/iheiddown_macOS.tgz", repos = NULL)`
-   For Unix:
    `install.packages("~/Downloads/iheiddown_linuxOS.tar.gz", repos = NULL)`

## Quick start guide

`{iheiddown}`, among other things, sets up a thesis template that you
can then modify for your dissertation. It’s very easy to get started!

Since the process is similar for theses, presentations, problem sets and
syllabi let us take a look at how to set up a thesis project.

1.  Open RStudio (if it is not already).
2.  Click the new document symbol at the very top left and choose
    `R Markdown...`.
3.  Then from the options on the left `From Template`.
4.  Scroll down through the options on the right until you find
    `Thesis   {iheiddown}`.
5.  Name your thesis project `index`, i.e. your main `.Rmd` should be
    named `index.Rmd`
6.  Select where the project should be saved on your hard drive.

Congratulations! You have now set up your first thesis project. For a
more detailed walkthrough of the different functionalities and how to
get started with each one, please check out the different articles on
the [package website](https://jhollway.github.io/iheiddown/).

## Feedback

Please [raise an issue](https://github.com/jhollway/iheiddown/issues)
for this repo if you encounter any bugs or if you have any feature
requests. You can also vote on existing issues that you would like to
see addressed soon. If you would like to contribute to the repo, please
fork this repository and open a pull request when your changes are
ready, or [get in touch with me](https://jameshollway.com) directly.

<sup><a name="myfootnote1">1</a></sup> For Windows users, make sure you
have the latest MiKTeX version installed on you computer. From the
MiKTeX console, you should regularly check for updates as “MiKTeX user
mode”, this will prevent issues when generating your pdf document from
your Markdown template.  
<sup><a name="myfootnote2">2</a></sup> Note that, for unclear reasons,
Yihui Xie’s [TinyTeX](https://yihui.org/tinytex/) is causing trouble.
Try `tinytex::uninstall_tinytex()` and install a local copy.
Unfortunately, full LaTeX installations are *large*.
