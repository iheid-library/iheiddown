test_that("theme_iheid() axes are correct", {
  library(ggplot2)
  p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + theme_iheid()
  expect_identical(p$theme$axis.text$family, "Helvetica")
  expect_identical(unname(p$theme$axis.text$colour), "#5c666f")
  expect_identical(p$theme$axis.text$size, 14)
})

test_that("theme_iheid() title is correct", {
  library(ggplot2)
  p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + ggtitle("Test") + geom_point() + theme_iheid()
  expect_identical(p$theme$plot.title$family, "Helvetica")
  expect_identical(unname(p$theme$plot.title$colour), "#E20020")
  expect_identical(p$theme$plot.title$size, 28)
})
