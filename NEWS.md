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
