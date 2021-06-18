test_that("theme_iheid() axes are correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p$theme$axis.text.x$family, "sans")
  expect_identical(p$theme$axis.text.x$family, "sans")
  expect_identical(unname(p$theme$axis.text.x$colour), "#5c666f")
  expect_identical(unname(p$theme$axis.text.y$colour), "#5c666f")
  expect_identical(p$theme$axis.text.x$size, 11.5)
  expect_identical(p$theme$axis.text.y$size, 11.5)
})

test_that("theme_iheid() title is correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::ggtitle("Test") + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p$theme$plot.title$family, "sans")
  expect_identical(unname(p$theme$plot.title$colour), "#E20020")
  expect_identical(p$theme$plot.title$size, 18)
})

test_that("theme_iheid() grid is correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::ggtitle("Test") + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p[["theme"]][["panel.grid"]][["colour"]][["IHEIDBlack"]],
                   "#5c666f")
  expect_identical(p[["theme"]][["panel.grid"]][["size"]], 0.2)
})

test_that("theme_iheid() caption style is correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::ggtitle("Test") + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p[["theme"]][["plot.caption"]][["colour"]][["IHEIDGrey"]],
                   "#6f7072")
  expect_identical(p[["theme"]][["plot.caption"]][["family"]], "sans")
  expect_identical(p[["theme"]][["plot.caption"]][["face"]], "italic")
  expect_identical(p[["theme"]][["plot.caption"]][["size"]], 9)
})

test_that("theme_iheid() strip style is correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::ggtitle("Test") + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p[["theme"]][["strip.text"]][["family"]], "sans")
  expect_identical(p[["theme"]][["strip.text"]][["size"]], 12)
  expect_identical(p[["theme"]][["strip.text"]][["face"]], "plain")
})

test_that("theme_iheid() subtitle style is correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::ggtitle("Test") + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p[["theme"]][["plot.subtitle"]][["family"]], "sans")
  expect_identical(p[["theme"]][["plot.subtitle"]][["size"]], 12)
  expect_identical(p[["theme"]][["plot.subtitle"]][["face"]], "plain")
  expect_identical(p[["theme"]][["plot.subtitle"]][["colour"]][["IHEIDBlack"]], "#5c666f")
})

test_that("theme_iheid() caption style is correct", {
  p <- ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) + ggplot2::ggtitle("Test") + ggplot2::geom_point() + iheiddown::theme_iheid()
  expect_identical(p[["theme"]][["plot.caption"]][["colour"]][["IHEIDGrey"]],
                   "#6f7072")
  expect_identical(p[["theme"]][["plot.caption"]][["family"]], "sans")
  expect_identical(p[["theme"]][["plot.caption"]][["face"]], "italic")
  expect_identical(p[["theme"]][["plot.caption"]][["size"]], 9)
})

