test_that("You can count on count_words()", {
  skip_on_os("linux")
  testthat::expect_equal(iheiddown::count_words(testthat::test_path("test.Rmd")), 241)
})
