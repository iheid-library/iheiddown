test_that("theme_iheid() axes are correct", {
  library(ggplot2)
  p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + theme_iheid()
  expect_identical(p$theme$axis.text.x$family, "sans")
  expect_identical(p$theme$axis.text.x$family, "sans")
  expect_identical(unname(p$theme$axis.text.x$colour), "#5c666f")
  expect_identical(unname(p$theme$axis.text.y$colour), "#5c666f")
  expect_identical(p$theme$axis.text.x$size, 11.5)
  expect_identical(p$theme$axis.text.y$size, 11.5)
})

test_that("theme_iheid() title is correct", {
  library(ggplot2)
  p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + ggtitle("Test") + geom_point() + theme_iheid()
  expect_identical(p$theme$plot.title$family, "sans")
  expect_identical(unname(p$theme$plot.title$colour), "#E20020")
  expect_identical(p$theme$plot.title$size, 18)
})
