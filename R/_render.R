# N.B. This is for internal use and not distributed with the iheiddown package

############
# Thesis
############

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "00-Example", template = "thesis",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("00-Example") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
file.rename("00-Example.Rmd", "index.Rmd")
iheiddown::thesis_pdf("index.Rmd")
#Come back to the original WD and copy the output while also renaming it
setwd("..")
date <- Sys.Date()
name <- paste0("Thesis_Name_", date, ".pdf")
target_path <- "00-Example/versions"
file.rename(file.path(target_path, name), file.path(target_path,
                                                    "IHEIDThesisExample.pdf"))

############
# Syllabus
############

# Automatic rendering of syllabus_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "Untitled", template = "syllabus",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("Untitled") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
iheiddown::syllabus_pdf("Untitled.Rmd")
#Come back to the original WD and copy the output while also renaming it
setwd("..")
date <- Sys.Date()
name <- paste0("MINT001_Syllabus_", date, ".pdf")
target_path <- "Untitled"
file.rename(file.path(target_path, name), file.path(target_path,
                                                    "IHEIDSyllabusExample.pdf"))

##############
# Problem Set
##############

# Automatic rendering of problemset_pdf will run on a Windows VM
# Step 1 Create an example project
rmarkdown::draft(file = "UntitledPS", template = "problemset",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("UntitledPS") # Since we can only knit from the WD
# Step 2 render the example project and replace in template folder
iheiddown::problemset_pdf("UntitledPS.Rmd")
#Come back to the original WD and copy the output while also renaming it
setwd("..")
date <- Sys.Date()
name <- paste0("MINT001_ProblemSet_", date, ".pdf")
target_path <- "UntitledPS"
file.rename(file.path(target_path, name),
            file.path(target_path, "IHEIDProblemSetExample.pdf"))

############
# Presentation
############

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "index", template = "presentation",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("index") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
# Create output dir
rmarkdown::render("index.Rmd")
#Come back to the original WD and copy the output
setwd("..")


############
# Poster
############

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "UntitledPoster", template = "iheiddown_poster",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("UntitledPoster") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
# Create output dir
rmarkdown::render("UntitledPoster.Rmd")
#Come back to the original WD and copy the output
setwd("..")
target_path <- "UntitledPoster"
name <- "UntitledPoster.html"
file.rename(file.path(target_path, name), file.path(target_path,
                                                    "IHEID_poster.html"))

###################
# Poster betterland
###################

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "UntitledPosterBetterland", template = "iheiddown_betterland",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("UntitledPosterBetterland") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
# Create output dir
rmarkdown::render("UntitledPosterBetterland.Rmd")
#Come back to the original WD and copy the output
setwd("..")
target_path <- "UntitledPosterBetterland"
name <- "UntitledPosterBetterland.html"
file.rename(file.path(target_path, name), file.path(target_path,
                                                    "IHEID_poster_better_land.html"))

###################
# Poster Betterport
###################

# Automatic rendering of thesis_pdf will run on a Windows VM
#Step 1 Create an example project
rmarkdown::draft(file = "UntitledPosterBetterport", template = "iheiddown_betterport",
                 package = "iheiddown", create_dir = TRUE, edit = FALSE)
setwd("UntitledPosterBetterport") # Since we can only knit from the WD
#Step 2 render the example project and replace in template folder
# Create output dir
rmarkdown::render("UntitledPosterBetterport.Rmd")
#Come back to the original WD and copy the output
setwd("..")
target_path <- "UntitledPosterBetterport"
name <- "UntitledPosterBetterport.html"
file.rename(file.path(target_path, name), file.path(target_path,
                                                    "IHEID_poster_better_port.html"))

################################################################################

# Deploy examples on the website as well by copying them to /docs

target_dir <- "docs/sample_output"
dir.create(target_dir)
# Thesis
file.copy("00-Example/versions/IHEIDThesisExample.pdf",
          target_dir,
          overwrite = TRUE)
# Syllabus
file.copy("Untitled/IHEIDSyllabusExample.pdf", target_dir, overwrite = TRUE)
# Problem Set
file.copy("UntitledPS/IHEIDProblemSetExample.pdf", target_dir, overwrite = TRUE)
# Presentation
file.copy("index/index.html", target_dir, overwrite = TRUE)
file.copy("index/index_cache", target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("index/index_files", target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("index/assets", target_dir, recursive = TRUE, overwrite = TRUE)
# Poster
file.copy("UntitledPoster/UntitledPoster_files",
          target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("UntitledPoster/IHEID_poster.html",
          target_dir, overwrite = TRUE)
# Posterbetterland
file.copy("UntitledPosterBetterland/myplot.svg", target_dir, overwrite = TRUE)
file.copy("UntitledPosterBetterland/UntitledPosterBetterland_files",
          target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("UntitledPosterBetterland/IHEID_poster_better_land.html",
          target_dir, overwrite = TRUE)
# Posterbetterport
file.copy("UntitledPosterBetterport/UntitledPosterBetterport_files",
          target_dir, recursive = TRUE, overwrite = TRUE)
file.copy("UntitledPosterBetterport/IHEID_poster_better_port.html",
          target_dir, overwrite = TRUE)


# Note, the directories generated will be erased further down the GitHub
# workflow. Uncomment the next few lines if you're running the code manually.
# 
# unlink("00-Example", recursive = TRUE)
# unlink("Untitled", recursive = TRUE)
# unlink("UntitledPS", recursive = TRUE)
# unlink("index", recursive = TRUE)
# unlink("UntitledPoster", recursive = TRUE)
# unlink("UntitledPosterBetterland", recursive = TRUE)
# unlink("UntitledPosterBetterport", recursive = TRUE)
