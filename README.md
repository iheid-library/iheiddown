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

## Output 

The PDF version is fully functional. The word, gitbook and epub versions might be developed at a later time.


## Feedback

Please get in touch with [me](https://jameshollway.com) or raise an issue for this repo
if you encounter any bugs, if you have any suggestions, or if you want to contribute.
