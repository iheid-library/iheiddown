# iheiddown <img src="inst/iheiddown.png" align="right" width="150"/>

This GitHub repository provides an R Markdown template for writing a Masters or PhD Dissertation at the Graduate Institute of International and Development Studies in Geneva based on the [IHEID  LaTeX dissertation template](https://github.com/jhollway/iheidmytex) and R.

## Installing iheiddown

1. Install [R](https://cran.rstudio.com), [RStudio version 1.2 or higher](https://www.rstudio.com/products/rstudio/download/#download), and [$\LaTeX$](https://www.latex-project.org/get/) on your system.^[Note that, for unclear reasons, Yihui Xie's [TinyTeX](https://yihui.name/tinytex/) is causing trouble. Try uninstalling tinytex::uninstall_tinytex() and install a local copy. Unfortunately, full LaTeX installations are *large*.]
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
the main document you have created (e.g. Untitled.Rmd) will automatically open in RStudio.
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
just type (or copy) the following into the console:

`bookdown::render_book('Untitled.Rmd', 'bookdown::pdf_book')`^["Untitled.Rmd" should be replaced with whatever you called your thesis document in step 5 of Getting started above. Note that R's working directory must be set to the project folder (in this case "Untitled/") to find the metadata/preface file.]

All your front matter and chapters of your thesis will be compiled
and the complete product can be found under the project folder: "docs/_main.pdf".

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

The PDF version is fully functional. 
The word, gitbook and epub versions might be developed at a later time.

## Feedback

Please get in touch with [me](https://jameshollway.com) or raise an issue for this repo
if you encounter any bugs, if you have any suggestions, or if you want to contribute.
