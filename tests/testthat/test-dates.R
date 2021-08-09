test_that("dates increment properly", {
  expect_equal(advdate("2020-09-14", 2), "(21 Sep)")
  expect_equal(advdate("2020-09-14", 4), "(5 Oct)")
})
