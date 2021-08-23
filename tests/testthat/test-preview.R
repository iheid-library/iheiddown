test_that("Live preview with preview_stop() works", {
  testthat::expect_message(iheiddown::preview_stop("test_stop/test_stop.Rmd"),
                           "Preview stopped")
})
