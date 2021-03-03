test_that("palettes work", {
  expect_equal(unname(iheid_palette("IHEID")[1]), "#E20020")
  expect_equal(unname(iheid_palette("IHEID")[2]), "#5c666f")
  expect_equal(unname(iheid_palette("IHEID")[3]), "#6f7072")
  expect_equal(unname(iheid_palette("Centres")[3]), "#268D2B")
  expect_equal(unname(iheid_palette("SDGs")[3]), "#4C9F38")
})
