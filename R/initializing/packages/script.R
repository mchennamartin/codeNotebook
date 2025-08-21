# function I made, to install and load packages from CRAN and Bioconductor at the same time, no user input
# makes it much easier when changing R versions, correct package versions are automatically downloaded

# function loads listed package and downloads if needed,
# I will eventually make it work with a list of functions in later versions

# FUNCTIONS --------------------------------------------------------------------
load <- function(package){
  # package - character - represents package or packages to install e.g. 'dplyr', 'limma'

  # determine whether it is one package or a list of them, by detecting commas
  check_if_list <- any(grepl(',' , package))
  # if package variable has commas, checkList will return True

  # for listed input
  if(check_if_list == TRUE){
    # create list type from character/string
    package_list <- strsplit(package, ', ')
    package_list <- package_list[[1]]

    # look at number of elements in packageList
    number_of_packages <- length(package_list)

    # create loop with length equal to number of packages
    for(i in 1:number_of_packages){

      # if package isn't installed, install it
      if(!require(package_list[[i]], character.only = TRUE)){
        install.packages(package_list[[i]], ask = FALSE)
      }

      # if packages is still not installed yet, biocmanager installer is required
      if(!require(package_list[[i]], character.only = TRUE)){
        if (!require("BiocManager", quietly = TRUE))
        install.packages("BiocManager")

        BiocManager::install(package_list[[i]], ask = FALSE)
       }

    # load package into environment once installed

    library(package_list[[i]], character.only = TRUE)

    }
    }


  # for sole input
  if(check_if_list == FALSE){
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

