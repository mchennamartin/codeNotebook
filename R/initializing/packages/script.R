#function I made, to install and load packages from CRAN and Bioconductor at the same time, no user input
#makes it much easier when changing R versions, correct package versions are automatically downloaded

#function loads listed package and downloads if needed,
#I will eventually make it work with a list of functions in later versions

load <- function(package){
  #package - character - represents package to install e.g. 'dplyr', 'limma'
  if(!require(package, character.only = T)){
    install.packages(package)
  }
  #check to see if package installed, or if there was an error.
  #if packages is not installed yet, repeat with biocmanager
  if(!require(package, character.only = T)){
    if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

    BiocManager::install(package)
   }

  #load package into environment
  library(package, character.only = T)
}

#now install/load packages with one line:

load('dplyr')
