# iheiddown 0.9.7

## Package updates:

- Updated website links for RStudio to "posit"

# iheiddown 0.9.6

## Package updates:

- Closed #129 by updating GitHub workflows to implement package caching
- Closed #130 by fixing theme issue relating to ggplot2's change from "size" to "linewidth"
- Closed #131 by fixing website rendering issues

# iheiddown 0.9.5

## Package updates:

- Fixed misspelling for image file used in poster.Rmd vignette

# iheiddown 0.9.4

## Package updates:

- Closed #126 by adding more informative message for when `percent_female()` reaches API rate limits
- Skipped `bibstats` functions tests on linux

## Thesis

- Added packages to 'thesis_pdf' template to improve rendering

# iheiddown 0.9.3

## Package updates:

- `bibstats` functions no longer force print
- `count_words()` test skipped on Linux

# iheiddown 0.9.2

## Package updates:

- Fixed case-sensitive path extension for Linux checks in various vignettes
- Fixed various issues in the `pushrelease` workflow
  - Release action was fixed by updating tag creation action
  - Setup-R action was updated to v2
  - Installing XQuartz dependency for macOS runner building the website since
  the latest version of `{pdftools}` requires it
- Packages used in GitHub Actions were moved to Suggests in DESCRIPTION

# iheiddown 0.9.1

## Package updates:

- Fixed invalid URLs mentioned in the CRAN comments
- Fixed case-sensitive path extension for Linux checks in poster vignette
- Switched to a newer ["release action"](https://github.com/ncipollo/release-action) since the old one has recently been archived and is no longer maintained.

# iheiddown 0.9.0

## Package updates:

- Closed #118 by commenting out function relying on problematic `{bib2df}` dependency
- Closed #119 by updating the Geneva Graduate Institute's logos
- Switched references to the old name of the Geneva Graduate Institute to the new one
- Closed #117 by adding small caps support to all templates.

## Presentation

- Closed #30 by adding font-scaling relative to parent container for the
presentation template

## Poster

- Closed #73 by adding a three poster templates from the `{posterdown}` package
  with an IHEID look.

## Website

- Updated pkgdown website to Bootstrap 5 theme and added search functionality
- Added a vignette explaining how to create IHEID themed posters

# iheiddown 0.8.6

## Minor fix

- Re-rendered README.md manually following CRAN comments about a potentially invalid URL

# iheiddown 0.8.5

## Minor fixes

- Fixed workflow issue in README rendering job and Website rendering job
- Fixed CRAN flagged issues:
  - Invalid link in README
  - Path issues to images used in the problem set vignette

# iheiddown 0.8.4

## Changed the website theme:

- Added a new CSS theme to the website
- Closed #107 By fixing the rendering issues of the website

## Other minor fixes:

- Closed #108  by adding a table of contents to the README
- Closed #111 fixed `{genderdata}` dependency issue by relying on a different source for name comparisons
- Closed #109 by adding an extended printing function
- Closed #110 by adding missing logos and creating a table listing available logos and their selectors on the presentation vignette.

## Thesis

- Added a second word count function, `count_words2()`, that obtains a more accurate word count estimate from the compiled PDF

# iheiddown 0.8.3

## Problem set template
- Closed #94 by adding a problem set template to `{iheiddown}`

## Thesis
- Closed #76 by adding an option for line numbering for thesis output when the
draft option is set to true

## Package
- Fixed #90 by solving the remaining issues of the package website deployment
workflow
- Closed #91 by removing unnecessary package dependencies following CRAN notes
- Closed #93 by adding bibliography statistics family of functions
  - `percent_female()` displays the percentage of female authors in a `.bib`
  file
  - `mean_year()` displays the mean of the publication year of the items in a
  given `.bib` file
  - `mean_pages()` displays the mean of the page length of the items in a given
  `.bib` file
  - `total_pages()` displays the total number of pages of all items in a given
  `.bib` file

# iheiddown 0.8.2

- This release attends to the changes requested by CRAN:
  - value tags have been added for `advdate`, `bookdown_profile`,
  `count_words`, `preview`, and `theme_iheid`.
  - a running example has been added to `count_words.Rd`.

# iheiddown 0.8.1

## Presentations

- Closed #56 by adding `xaringan_columns` JS macro for presentation
- Closed #70 by implementing progressive slides that highlight the last item
- Closed #57 by allowing users to add installed or remote logos on their slides
- Closed #69 By rewriting the `theme_iheid()` function based on hrbrthemes structure
- Closed #74 by implementing citations with `{RefManageR}`
- Closed #77 by adding square on/off section elements
- Closed #80 by adding the ninjutsu CSS slide slicing tools for better positioning
- Closed #79 by removing hidden dependencies in the presentation vignette
- Closed #75 by adding slide animations from the `animate.css` library

## Vignettes

- Closed #54 by adding tutorial vignettes to get users started with each template (syllabus, thesis, presentation)

## Package

- Closed #78 by reducing subdirectory size for CRAN submission
- Closed #68 by fixing the error message indicating that the output format was not of class `rmarkdown_output_format`
- Closed #84 by adding input argument to `chapter_pdf()` function
- Closed #81 by adding initial `count_words()` function
- Closed #60 by expanding automatic rendering script for syllabi and presentation templates

# iheiddown 0.8.0

## Presentations

- Closed #23 by adding a `{xaringan}` presentation template with a custom IHEID CSS file
  - Please use `xaringan::summon_remark()` to install required libs locally if working offline

## Thesis

- Closed #27 with a new selection of fonts for thesis: Helvetica, Droid Serif, Lucida Console
- Closed #53 by saving all Markdown files with the `WINDOWS-1252` default encoding
  - Please use `WINDOWS-1252` as the default encoding on Windows machines instead of Unicode
- Closed #55 by adding thesis pdf artifacts automatically to each release via a new `_render.R` file (included in the buildignore)

# iheiddown 0.7.4

## Package

- Updated README to inform users that new theses must be named "00-ProjectTitle" to avoid issues when merging Rmd files together
- Closed #39 by adding the `{ggplot2}` theme `theme_iheid()`
  - Fixed #50 by adding tests for `theme_iheid()`

## Thesis

- Closed #32 by changing lorem ipsum to LOTR references
- Fixed #49 by changing the "title" macro to "doctitle" to avoid an issue with Pandoc conversion to Latex on MacOS
- Fixed #47 by tweaking the draft macro to display page numbers properly when activated
- Fixed #42 where the `chapter_pdf()` function displayed placeholder text and headers for other unpreviewed chapters when knitting
- Closed #26 by adding an automatic package citations function to the thesis template.
  - Fixed #45 by changing the bibliography management tool to `{biblatex}` and implemented a series of macros in the YAML header of the index file
- Closed #46 by adding an appendix example that can include all the code from chapter code chunks

## Syllabus

- Closed #32 by changing lorem ipsum to LOTR references. 

# iheiddown 0.7.3

## Package

* Fixed #38 by adding `iheid_palettes` and `iheid_palette()` for accessing IHEID and SDG color palettes

## Thesis

* Closed #22 by adding example of how to create a Gantt plot including call to `iheid_palette()` 

# iheiddown 0.7.2

## Thesis

* Closed #28 by adding more details to filenames
  * Added author details to `thesis_pdf()` output
  * Added author details to `chapter_pdf()` output
  * Added chapter details to `chapter_pdf()` output
* Paused minitoc
  * `thesis_pdf()` and `chapter_pdf()` clean up `*.maf` and `*.mtc` files afterward
* `chapter_pdf()` now exports to `versions/`
  * Closed #33 as `chapter_pdf()` prints chapter abstract and chapter table of contents
  * Added manual `\setcounter{}` to example chapters
* Fixed #34 cslreferences bug in `thesis_pdf()` and `chapter_pdf()`
* Replaced deprecated `\over` use in equations in chapter 3 example with `\frac{}{}`

## Package

* Release individual packages
* More colourful load
* Fixed `{citr}` dependency

# iheiddown 0.7.1

## Thesis

* Rescaled `{citr}` image in chapter 2 of template
* Added `{Equatiomatic}` option to chapter 3 of thesis template
* Added IHEIDThesisExample.pdf for demonstration purposes

## Package

* Updated README
* Added info on load

# iheiddown 0.7.0

## Thesis

* Added `chapter_pdf()` knit function for previewing chapters (closes #19)
* Added `bookdown_profile` addin for RStudio to improve access to the bookdown profile
* Overhaul of chapter 4 of skeleton:
  * More detail and figure on code chunks
  * More detail on including external graphics
  * More detail on loading, exploring, and summarising data
  * Added detail on presenting tables of inferential results (closes #18)

## Syllabus

* Added 'geneva-syllabus.csl' to support in-text full citations (fixes #20)
* Added 'tightlist' framework to syllabus template

# iheiddown 0.6.0

* Set up `testthat` for package
* Added `advdate()` for incrementing dates by week
  * Updated syllabus template for `advdate()`
  * Added test for `advdate()`
* Added `chicago-syllabus.csl`
  * No more reliance on `RefManageR`
  * Imports `citr`, not strictly a dependence but highly recommended
  * No bibliography at end of document
  * Updated syllabus template for `chicago-syllabus.csl`
* Using second-level numbering for subsections in syllabus `template.tex`
* Added draft: true option in YAML
* Added codecov checks to github actions .yml

# iheiddown 0.5.1

* Fixed `front-matter/` error
* Shortened thesis abstract
* Elaborated thesis acknowledgements
* Shortened thesis preface
  * Elaborated *RMarkdown* motivation in thesis preface
* Renamed chapter 1 to `01-introduction.Rmd`
  * Discusses markup and formatting
* Renamed chapter 2 to `02-theory.Rmd`
  * Discusses bibliographies and citations
* Renamed chapter 3 to `03-method.Rmd`
  * Discusses inline code and math
* Renamed chapter 4 to `04-results.Rmd`
  * Discusses data analysis and tables and figures
* Added chapter 5 as `05-conclusion.Rmd`
  * Discusses additional resources and next steps
* Fixed references chapter title not appearing 
* Added `bookdown::preview_chapter()` YAML to each chapter

# iheiddown 0.5.0

* Fixed issue #13 related to bookdown v0.2.0
  * `thesis_pdf()` now a wrapper for `bookdown::render_book()` rather than `bookdown::pdf_book()`
  * `syllabus_pdf()` now a wrapper for `rmarkdown::render()` rather than `rmarkdown::pdf_document()`
  * Note that this is a breaking change compared to older scripts
* Fixed sectsty `\underbar` error
  * On thesis template
  * On syllabus template
* Fixed empty bibliography issue
  * Moved thesis references chapter
  * Changed front-and-back-matter to just front-matter
* Fixed 'nobind' global option issue
  * 'oneside' and 'twoside' remain as options
* Simplified syllabus skeleton structure
* Changed thesis output directory to 'versions'
* Added more informative filenames for thesis and syllabus outputs

# iheiddown 0.4.0

* Differentiated between PhD theses and masters dissertations in front pages
  * Breaking change: Note that you will now need to specify phd: true or phd: false in metadata
* Added supervisor and second reader information to metadata, appear on first page
  * Added external examiner information to metadata, appears on first page for PhDs
* Updates to pull request template

# iheiddown 0.3.0

* Added `syllabus_pdf()` function
* Added syllabus template
  * Required sections: title, code, credits, year, semester, program, professor and TA details, course description
  * Optional sections: course aims, structure, materials, evaluation, policies
  * Body section for course schedule
* Added skeleton files for syllabus
  * Includes auto week progression
  * Includes example citations

# iheiddown 0.2.3

* Added a `NEWS.md` file to track changes to the package.
* Fixed double licensing
* Added features section to README

# iheiddown 0.2.0

* Added better fonts
* Added red links to citations and internal links
* `thesis_pdf()` now runs on XeLaTeX
* Some cleaning up of thesis template and skeleton

# iheiddown 0.1.1

* Added motivation to README

# iheiddown 0.1.0

## Major changes

* Added `thesis_pdf()` function
* Migrated template resources (.tex, .cls, .csl) from skeleton to function resources
* Changed abbreviations from custom `mclistof` to `abbrv`
* Removed `thesisdown` dependence
* `iheiddown_profile` addin now defunct

## Minor changes

* Added `iheiddown` citation
* Updated README for knit-based usage and issue-based development
* Updated README with instructions for adapting the skeleton
* Updated README with simplified installation and setup instructions
* Updated logo
* Minor YAML changes
* Added issue/PR templates
* Added CODE_OF_CONDUCT

# iheiddown 0.0.1

* Setup package project
* Added MIT license
* Added `iheiddown.png` logo
* Added `skeleton.Rmd` and `template.yaml`
* Added skeleton chapters drawn from `thesisdown`
* Adapted Preface for `iheiddown`
* Added chapters folder in skeleton to simplify project structure
* Added template and class files drawn from `oxforddown`
* Added `SecretariatDocument.pdf` placeholder to skeleton
* Added all six title pages
* Locating IHEID logo in skeleton files (figures/)
* Added thesisno and department to metadata
* Renamed abstract to resume in metadata to avoid internal templating conflicts
* Added `_bookdown.yml`
* Added `iheiddown_profile` addin
* Removed html and word export options (for now)
