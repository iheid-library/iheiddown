# N.B. This is for internal use and not distributed with the Iheiddown package

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "00-Example", template = "Thesis",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("00-Example") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
iheiddown::thesis_pdf("00-Example.Rmd", author = "JohnSmith")
#Come back to the original WD and copy the output while also renaming it
setwd("..")
date <- Sys.Date()
name <- paste0("JohnSmith_Thesis_", date,".pdf")
target_path <- "00-Example/versions"
file.rename(file.path(target_path, name), file.path(target_path, "IHEIDThesisExample.pdf"))
# In the future: Add automatic rendering for syllabus and presentation templates
