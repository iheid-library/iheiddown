# iheiddown <img src="inst/iheiddown.png" align="right" width="150"/>

<!-- badges: start -->
![GitHub release (latest by date)](https://img.shields.io/github/v/release/jhollway/iheiddown)
![GitHub Release Date](https://img.shields.io/github/release-date/jhollway/iheiddown)
![GitHub issues](https://img.shields.io/github/issues-raw/jhollway/iheiddown)
![GitHub All Releases](https://img.shields.io/github/downloads/jhollway/iheiddown/total)
<!-- badges: end -->

This GitHub repository provides an R Markdown template for writing 
a Masters or PhD Dissertation at the Graduate Institute of International and Development Studies in Geneva 
in RStudio based on the [IHEID LaTeX dissertation template](https://github.com/jhollway/iheidmytex).

_R Markdown_ creates a user-friendly, simple and straightforward way to write a well-formatted dissertation,
with nicely formatted paragraphs, tables and figures that can be generated directly from your data,
weaving together argument, evidence, and interpretation.
The use of LaTeX in combination with _Markdown_ is more consistent than the output of a word processor, 
much less prone to corruption or crashing, and the resulting file is smaller than a Word file. 
While you may have never had problems using Word in the past, 
your thesis is likely going to be about twice as large and complex as anything you've written before, 
taxing Word's capabilities.
Though `iheiddown` should shine in particular for those who are analysing data, 
or are including tables, figures, equations, or complex cross-references 
(e.g. table of contents, figures, tables, appendices, or an index) in their dissertation,
the user-friendly nature and pretty output should make it of great benefit to nearly anyone writing a thesis project.

## Installing iheiddown

1. Install [R](https://cran.rstudio.com), [RStudio version 1.2 or higher](https://www.rstudio.com/products/rstudio/download/#download), and [LaTeX](https://www.latex-project.org/get/), or [MiKTeX](https://miktex.org/howto/install-miktex/)<sup>[1](#myfootnote1)</sup> on your system.<sup>[2](#myfootnote2)</sup>
1. Open RStudio and click on the `Packages` tab of the bottom right pane of the window (by default).
Click `Install` at the top left of that tab and type "devtools" into the text box. Hit enter.
1. Next type (or copy) `devtools::install_github("jhollway/iheiddown")` into the prompt in the `Console` tab in the bottom left pane. Hit enter.

That's it! `iheiddown` is now installed and ready to go.

## Getting started

`iheiddown` sets up a thesis template that you can then modify for your dissertation.
It's very easy to get started.

1. Open RStudio (if it is not already).
1. Click the new document symbol at the very top left and choose `R Markdown...`. 
1. Then from the options on the left `From Template`. 
1. Scroll down through the options on the right until you find `Thesis   {iheiddown}`.
1. Name your thesis project (if in doubt 'Untitled' is fine) and select where the project should be saved on your harddrive.

Congratulations! You have now set up a thesis project.

<!--
- The R packages `bookdown`, `tidyverse`, and `reticulate` (the other packages you need should be automatically installed when you build this project for the first time in RStudio)
- (If on a Mac): Command line developer tools. You can install these by typing `xcode-select --install` in a terminal prompt
-->

## Writing your thesis

When you create the template for the first time, 
the main document you have created (e.g. 'Untitled.Rmd') will automatically open in RStudio.
In this document you can enter in key details about yourself and your dissertation
between the \-\-\- and \-\-\-.
Note that any text after hashtags, \#, are comments only and are not computed. 

The \#metadata\# section should be fairly self-explanatory.
The \#front matter\# section includes pointers to various front matter elements,
such as dedications, acknowledgements (thank you), abbreviations, and your abstract.
Note that it points to files in a folder created by the template 
called "front-and-back-matter/".
If you look in this folder, you will find placeholders for your own
abstract and acknowledgements.
You can simply edit these and the 
edited versions will be used when the thesis is compiled.
This section also includes various options for 
toggling lists of figures, tables, etc, in the final version.

The \#bibliography\# section points to where the bibtex file (.bib) with
all your bibliographic information resides.
You can also just call your .bib file "references.bib" and replace the
template version in the bib/ folder.
Lastly, the \#formatting\# section offers options for changing the format
ready for printing.
You can mostly ignore the \#output\# section, for now.

Below the second \-\-\- is some example text that will become 
the preface of the thesis when it is compiled.
So where is the real content of the dissertation?

Just as the abstract and acknowledgements, etc,
were kept in a "front-and-back-matter/" folder,
so too are the individual chapters of your dissertation
kept in a "chapters/" folder.
The placeholder text is designed to take you through the
basic syntax and more complicated options available when
using Rmarkdown,
but once you feel comfortable and have created your own
examples, feel free to delete the placeholder text
(or even the files) and create your own in its place.

Markdown is easy to read as well as write,
so there's no need for endless compilation.
But when it comes time to compile the document,
just turn to your main .Rmd file ('Untitled.Rmd' in our case)
and either click the `Knit` button at the top
or use the keyboard shortcut `Shift-Cmd-K` (Mac) or `Shift-Ctrl-K` (Windows).

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

All your front matter and chapters of your thesis will be compiled
and the complete product can be found under the project folder: "docs/_main.pdf".

The PDF version is fully functional. 
The word, gitbook and epub versions might be developed at a later time.

## Feedback

Please [raise an issue](https://github.com/jhollway/iheiddown/issues) for this repo
if you encounter any bugs or if you have any suggestions,
or [get in touch with me](https://jameshollway.com) if you want to contribute.

<sup><a name="myfootnote1">1</a></sup> For Windows users, make sure you have the latest MiKTeX version installed on you computer. From the MiKTeX console, you should regularly check for updates as "MiKTeX user mode", this will prevent issues when generating your pdf document from your Markdown template.    
<sup><a name="myfootnote2">2</a></sup> Note that, for unclear reasons, Yihui Xie's [TinyTeX](https://yihui.name/tinytex/) is causing trouble. Try `tinytex::uninstall_tinytex()` and install a local copy. Unfortunately, full LaTeX installations are *large*.

