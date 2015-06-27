setwd("~/Dropbox/Coursera/R Programming")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  x <- 1
  # list all files in "directory" folder
  files <- dir(directory, full.names=T)
  complete_data <- rep(0, length(id))
  ## read data from files listed in "directory" folder and compute/sum the "complete cases" for each one !!!
  for(y in id) {
    data <- read.csv(files[y])
    complete_data[x] <- sum(complete.cases(data))
    x <- x + 1
  }
  #compute total "complete cases": where 'id' is the monitor ID number and 'nobs' is the number of complete cases 
  total <- data.frame (id = id, nobs = complete_data)
  return(total) 
}