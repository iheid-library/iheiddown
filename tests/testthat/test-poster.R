# Testing that the problem set rendering works
# 
# Still need to install miktex or some stuff on all runners before running these
# tests
# 
# Strange error when rendering that only occurs within tests. Linked to some
# toc? However we do not generate one in these templates...
# 
# test_that("iheiddown_poster() works", {
#   # Setup
#   rmarkdown::draft(file = paste0(test_path(), "/UntitledPoster"),
#                    template = "iheiddown_poster",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   setwd(paste0(test_path(), "/UntitledPoster"))
#   iheiddown::iheiddown_poster("UntitledPoster.Rmd")
#   # Test
#   expect_true(file.exists("UntitledPoster.html"))
#   # Clean
#   setwd("../../..")
#   unlink(paste0(test_path(), "/UntitledPoster"), recursive = TRUE)
# })
# 
# test_that("iheiddown_betterland() works", {
#   # Setup
#   rmarkdown::draft(file = paste0(test_path(), "/UntitledPoster"),
#                    template = "iheiddown_betterland",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   setwd(paste0(test_path(), "/UntitledPoster"))
#   iheiddown::iheiddown_poster("UntitledPoster.Rmd")
#   # Test
#   expect_true(file.exists("UntitledPoster.html"))
#   # Clean
#   setwd("../../..")
#   unlink(paste0(test_path(), "/UntitledPoster"), recursive = TRUE)
# })
# 
# test_that("iheiddown_betterport() works", {
#   # Setup
#   rmarkdown::draft(file = paste0(test_path(), "/UntitledPoster"),
#                    template = "iheiddown_betterport",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   setwd(paste0(test_path(), "/UntitledPoster"))
#   iheiddown::iheiddown_poster("UntitledPoster.Rmd")
#   # Test
#   expect_true(file.exists("UntitledPoster.html"))
#   # Clean
#   setwd("../../..")
#   unlink(paste0(test_path(), "/UntitledPoster"), recursive = TRUE)
# })
