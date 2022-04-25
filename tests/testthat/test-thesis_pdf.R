# Testing that the thesis rendering works
# 
# Still need to install miktex or some stuff on all runners before running these
# tests
# test_that("thesis_pdf() works", {
#   # Setup
#   rmarkdown::draft(file = paste0(test_path(), "/00-Example"), template = "thesis",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   setwd(paste0(test_path(), "/00-Example"))
#   file.rename("00-Example.Rmd", "index.Rmd")
#   iheiddown::thesis_pdf("index.Rmd")
#   iheiddown::chapter_pdf("01-introduction.Rmd")
#   # Test
#   expect_true(file.exists(paste0("versions/Thesis_Name_", Sys.Date(), ".pdf")))
#   expect_true(file.exists(paste0("versions/Author_Chapter_1_", Sys.Date(), ".pdf")))
#   # Clean
#   setwd("../../..")
#   unlink(paste0(test_path(), "/00-Example"), recursive = TRUE)
# })
