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
