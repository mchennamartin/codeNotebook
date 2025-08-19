# function I made, to install and load packages from CRAN and Bioconductor at the same time, no user input
# makes it much easier when changing R versions, correct package versions are automatically downloaded

# function loads listed package and downloads if needed,
# I will eventually make it work with a list of functions in later versions

# Function --------------------------------------------------------------------
load <- function(package){
  # package - character - represents package or packages to install e.g. 'dplyr', 'limma'

  # determine whether it is one package or a list of them, by detecting commas
  checkList <- grepl(', ', package)
  # if package variable has commas, checkList will return True

  # for listed input
  if(checkList == TRUE){
    # create list type from character/string
    packageList <- strsplit(package, ', ')
    packageList <- packageList[[1]]

    # look at number of elements in packageList
    packageNumber <- length(packageList)

    # create loop with length equal to number of packages
    for(i in 1:packageNumber){
      if(!require(packageList[[i]], character.only = TRUE)){
        install.packages(packageList[[i]], ask = FALSE)
      }
      # check to see if package installed, or if there was an error.
      # if packages is not installed yet, repeat with biocmanager
      if(!require(packageList[[i]], character.only = TRUE)){
        if (!require("BiocManager", quietly = TRUE))
        install.packages("BiocManager")

        BiocManager::install(packageList[[i]], ask = FALSE)
       }

    # load package into environment
    library(packageList[[i]], character.only = TRUE)
    }
    }


  # for sole input
  if(checkList == FALSE){
     if(!require(package, character.only = TRUE)){
        install.packages(package, ask = FALSE)
      }
      # check to see if package installed, or if there was an error.
      # if packages is not installed yet, repeat with biocmanager
      if(!require(package, character.only = TRUE)){
        if (!require("BiocManager", quietly = TRUE))
        install.packages("BiocManager")

        BiocManager::install(package, ask = FALSE)
       }

    # load package into environment
    library(package, character.only = TRUE)
    }

  }

# Test -------------------------------------
# now install/load packages with one line:
load('dplyr')

packageList <- 'limma, dplyr'
load(packageList)