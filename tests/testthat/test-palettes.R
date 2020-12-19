test_that("palettes work", {
  expect_equal(unname(iheid_palette("IHEID")[1]), c("#E20020"))
  expect_equal(unname(iheid_palette("IHEID")[2]), c("#5c666f"))
  expect_equal(unname(iheid_palette("IHEID")[3]), c("#6f7072"))
  expect_equal(unname(iheid_palette("Centres")[3]), c("#268D2B"))
  expect_equal(unname(iheid_palette("SDGs")[3]), c("#4C9F38"))
})
