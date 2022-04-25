# Testing that the syllabus rendering works
# 
# Still need to install miktex or some stuff on all runners before running these
# tests
# test_that("presentation_html() works", {
#   # Setup
#   rmarkdown::draft(file = paste0(test_path(), "/Untitled"), template = "syllabus",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   setwd(paste0(test_path(), "/Untitled"))
#   iheiddown::syllabus_pdf("Untitled.Rmd")
#   # Test
#   expect_true(file.exists(paste0("MINT001_Syllabus_", Sys.Date(), ".pdf")))
#   # Clean
#   setwd("../../..")
#   unlink(paste0(test_path(), "/Untitled"), recursive = TRUE)
# })
