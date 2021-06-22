test_that("You can count on count_words()", {
  rmarkdown::draft(file = "test", template = "html_vignette",
                   package = "rmarkdown", create_dir = TRUE, edit = FALSE)
  testthat::expect_equal( iheiddown::count_words("test/test.Rmd"), 241)
  unlink("test", recursive = TRUE)
})
