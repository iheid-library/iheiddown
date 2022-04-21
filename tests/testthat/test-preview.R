test_that("Live preview with preview_stop() works", {
  expect_message(iheiddown::preview_stop("test_stop/test_stop.Rmd"),
                           "Preview stopped")
})
# # Hacky test since the function is not really testable.
# test_that("Live preview with preview_stop() works", {
#   expect_error(suppressWarnings(iheiddown::preview_start("test_stop/test_stop.Rmd")),
#                            paste0("The file '", getwd(),
#                                   "/test_stop/test_stop.Rmd' does not exist."))
# })
