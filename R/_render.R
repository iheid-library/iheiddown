# N.B. This is for internal use and not distributed with the Iheiddown package

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "00-Example", template = "thesis",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("00-Example") # Since we can only knot from the WD
#Step 2 render the example project and replace in template folder
iheiddown::thesis_pdf("00-Example.Rmd", author = "John Smith")
#Come back to the original WD and copy the output while also renaming it
setwd("..")
date <- Sys.Date()
name <- paste0("John Smith_Thesis_", date,".pdf")
target_path <- "inst/rmarkdown/templates/thesis/skeleton/versions"
file.copy(paste0("00-Example/versions/John Smith_Thesis_", date,".pdf", collapse = ""),
          "inst/rmarkdown/templates/thesis/skeleton/versions")
file.rename(file.path(target_path, name), file.path(target_path, "IHEIDThesisExample.pdf"))
#Step 3 Clean up the files
unlink("00-Example", recursive = TRUE) # remove the draft folder
# TODO: Add automatic rendering for syllabi and presentation
