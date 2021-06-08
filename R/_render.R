# N.B. This is for internal use and not distributed with the Iheiddown package

############
# Thesis
############

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

############
# Syllabus
############

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "Untitled", template = "Syllabus",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("Untitled") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
rmarkdown::render("Untitled.Rmd")
#Come back to the original WD and copy the output while also renaming it
setwd("..")
date <- Sys.Date()
name <- paste0("MINT001_Syllabus_", date,".pdf")
target_path <- "Untitled"
file.rename(file.path(target_path, name), file.path(target_path, "IHEIDSyllabusExample.pdf"))

############
# Presentation
############

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "index", template = "Presentation",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("index") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
# Create output dir
rmarkdown::render("index.Rmd")
#Come back to the original WD and copy the output
setwd("..")

################################################################################

# Deploy examples on the website as well by copying them to /docs

target_dir <- "docs/sample_output"
dir.create(target_dir)
# Thesis
file.copy("00-Example/versions/IHEIDThesisExample.pdf", target_dir, overwrite = TRUE)
# Syllabus
file.copy("Untitled/IHEIDSyllabusExample.pdf", target_dir, overwrite = TRUE)
# Presentation
file.copy("index/index.html", target_dir, overwrite = TRUE)
file.copy("index/index_cache", target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("index/index_files", target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("index/assets", target_dir, recursive = TRUE, overwrite = TRUE)

# Note, the directories generated will be erased further down the GitHub workflow
