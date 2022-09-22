test_that("Bibstats works properly", {
  testthat::skip_on_cran()
  rmarkdown::draft(file = "test", template = "syllabus",
                   package = "iheiddown", create_dir = TRUE, edit = FALSE)
  expect_equal(percent_female(bib_file = "test/references.bib",
                              rmd_file = "test/test.Rmd", by = "author"),
               "33% female authors")
  expect_equal(percent_female(bib_file = "test/references.bib",
                              rmd_file = "test/test.Rmd",
                              by = "publication"),
               "50% female authors")
  expect_equal(mean_year(bib_file = "test/references.bib",
                         rmd_file = "test/test.Rmd"),
               "Average date of publication: 1934")
  expect_equal(total_pages(bib_file = "test/references.bib",
                           rmd_file = "test/test.Rmd"),
               "Total number of pages: 7")
  expect_equal(mean_pages(bib_file = "test/references.bib",
                          rmd_file = "test/test.Rmd"),
               "Average number of pages: 7")
  unlink("test", recursive = TRUE)
})

# test_that("Bibfix works properly", {
#   rmarkdown::draft(file = "test", template = "syllabus",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   expect_equal(fix_bib(bib_file = "test/references.bib"),
#                "test/references.bib")
#   unlink("test", recursive = TRUE)
# })
