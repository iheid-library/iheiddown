# Testing that the problem set rendering works
# 
# Still need to install miktex or some stuff on all runners before running these
# tests
# test_that("syllabus_pdf() works", {
#   # Setup
#   rmarkdown::draft(file = paste0(test_path(), "/UntitledPS"), template = "syllabus",
#                    package = "iheiddown", create_dir = TRUE, edit = FALSE)
#   setwd(paste0(test_path(), "/UntitledPS"))
#   iheiddown::problemset_pdf("UntitledPS.Rmd")
#   # Test
#   expect_true(file.exists(paste0("MINT001_ProblemSet_", Sys.Date(), ".pdf")))
#   # Clean
#   setwd("../../..")
#   unlink(paste0(test_path(), "/UntitledPS"), recursive = TRUE)
# })
