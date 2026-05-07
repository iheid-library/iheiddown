test_that("You can count on count_words()", {
  testthat::expect_equal(iheiddown::count_words(testthat::test_path("test.Rmd")), 241)
})
