setwd("~/Dropbox/Coursera/R Programming")

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # initialize a vector to hold the pollutant data
  pol_vec <- c()
  # list all files in "directory" folder
  files <- dir(directory, full.names=T)
  #read all files listed and load them in a vector  
  for(y in id) {
    data <- read.csv(files[y])
    pol_vec <- c(pol_vec, data[!is.na(data[, pollutant]), pollutant])
  }
  #compute the mean of pollutant desired 
  pol_mean <- mean(pol_vec)
  return(round(pol_mean,3)) 
}