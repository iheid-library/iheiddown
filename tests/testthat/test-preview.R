test_that("Live preview with preview_stop() works", {
  rmarkdown::draft(file = "test_stop_preview", template = "presentation",
                   package = "iheiddown", create_dir = TRUE, edit = FALSE)
  testthat::expect_message(iheiddown::preview_stop("test/test.Rmd"), "Preview stopped")
  unlink("test", recursive = TRUE)
})
