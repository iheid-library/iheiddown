
# Iheiddown <img src="man/figures/iheiddown.png" align="right" width="220"/>

<!-- badges: start -->

![GitHub release (latest by
date)](https://img.shields.io/github/v/release/jhollway/iheiddown)
![GitHub Release
Date](https://img.shields.io/github/release-date/jhollway/iheiddown)
![GitHub
issues](https://img.shields.io/github/issues-raw/jhollway/iheiddown)
<!-- [![HitCount](http://hits.dwyl.com/jhollway/iheiddown.svg)](http://hits.dwyl.com/jhollway/iheiddown) -->
[![Codecov test
coverage](https://codecov.io/gh/jhollway/iheiddown/branch/main/graph/badge.svg)](https://codecov.io/gh/jhollway/iheiddown?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/jhollway/iheiddown/badge/main)](https://www.codefactor.io/repository/github/jhollway/iheiddown/overview/main)
<!-- ![GitHub All Releases](https://img.shields.io/github/downloads/jhollway/iheiddown/total) -->
<!-- badges: end -->

`{iheiddown}` is a package that provides templates for writing documents
in styles consistent with the Graduate Institute of International and
Development Studies in Geneva/ Institut de Hautes Etudes Internationales
et du Developpement (IHEID) in (R) markdown.

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

## Write syllabi and presentations in *RMarkdown*

Not quite done yet, there is even more!

-   Create IHEID-styled syllabi with our template.

-   Create IHEID-styled presentations based on the great
    [`{xaringan}`](https://github.com/yihui/xaringan) package.

## Installing iheiddown

1.  Install [R](https://cran.r-project.org), [RStudio version 1.2 or
    higher](https://www.rstudio.com/products/rstudio/download/#download),
    and [LaTeX](https://www.latex-project.org/get/), or
    [MiKTeX](https://miktex.org/howto/install-miktex/)<sup>[1](#myfootnote1)</sup>
    on your system.<sup>[2](#myfootnote2)</sup>
2.  Open RStudio and click on the `Packages` tab of the bottom right
    pane of the window (by default). Click `Install` at the top left of
    that tab and type “remotes” into the text box. Hit enter.
3.  Next type (or copy) `remotes::install_github("jhollway/iheiddown")`
    into the prompt in the `Console` tab in the bottom left pane. Hit
    enter.

That’s it! `iheiddown` is now installed and ready to go.

Note that you can always rerun
`remotes::install_github("jhollway/iheiddown")` – if there’s a newer
version, it’ll install that.

## Getting started with your thesis

`iheiddown` sets up a thesis template that you can then modify for your
dissertation. It’s very easy to get started.

1.  Open RStudio (if it is not already).
2.  Click the new document symbol at the very top left and choose
    `R Markdown...`.
3.  Then from the options on the left `From Template`.
4.  Scroll down through the options on the right until you find
    `Thesis   {iheiddown}`.
5.  Name your thesis project `index`, i.e. your main `.Rmd` should be
    named `index.Rmd`
6.  Select where the project should be saved on your hard drive.

Congratulations! You have now set up a thesis project. For a more
detailed walkthrough, please check out the presentation article on the
package webiste.

## Writing your thesis

When you create the template for the first time, the main document you
have created (e.g. ‘Untitled.Rmd’) will automatically open in RStudio.
In this document you can enter in key details about yourself and your
dissertation between the --- and ---. Note that any text after hashtags,
\#, are comments only and are not computed.

The \#metadata\# section should be fairly self-explanatory. The \#front
matter\# section includes pointers to various front matter elements,
such as dedications, acknowledgments (thank you), abbreviations, and
your abstract. Note that it points to files in a folder created by the
template called “front-and-back-matter/”. If you look in this folder,
you will find placeholders for your own abstract and acknowledgments.
You can simply edit these and the edited versions will be used when the
thesis is compiled. This section also includes various options for
toggling lists of figures, tables, etc, in the final version.

The \#bibliography\# section points to where the bibtex file (.bib) with
all your bibliographic information resides. You can also just call your
.bib file “references.bib” and replace the template version in the bib/
folder. Lastly, the \#formatting\# section offers options for changing
the format ready for printing. You can mostly ignore the \#output\#
section, for now.

Below the second --- is some example text that will become the preface
of the thesis when it is compiled. So where is the real content of the
dissertation?

Just as the abstract and acknowledgements, etc, were kept in a
“front-matter/” folder, so too are the individual chapters of your
dissertation kept in a “chapters/” folder. The placeholder text is
designed to take you through the basic syntax and more complicated
options available when using *RMarkdown*, but once you feel comfortable
and have created your own examples, feel free to delete the placeholder
text (or even the files) and create your own in its place.

*Markdown* is easy to read as well as write, so there’s no need for
endless compilation. But when it comes time to compile the document,
just turn to your main .Rmd file (‘Untitled.Rmd’ in our case) and either
click the `Knit` button at the top or use the keyboard shortcut
`Shift-Cmd-K` (Mac) or `Shift-Ctrl-K` (Windows).

Finally, please check out the package website’s thesis article for a
more detailed look at the contents of your thesis project and a step by
step guide on how to generate one.

<!-- 
## Knitting individual chapters

To knit an individual chapter without compiling the entire thesis:
1. open the **.Rmd** file of a chapter
2. add a YAML header specifying the output format(s) (e.g. `bookdown::word_document2` for a word document you might want to upload to Google Docs for feedback from collaborators)
3. Click the `knit` button (the output file is then saved in the root folder)

As shown in the sample chapters' YAML headers, to output a single chapter to PDF, use:

```yaml
output:
  bookdown::pdf_document2:
    template: templates/iheiddiss.tex
```
This will format the chapter in the myiheidtex style but without including the front matter (table of contents, abstract, etc)
-->

## Output

All your front matter and chapters of your thesis will be compiled and
the complete product can be found under the project folder “versions/”.
A date is automatically appended to the filename to assist with tracking
versions.

The PDF version is fully functional. The word, gitbook and epub versions
might be developed at a later time.

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
