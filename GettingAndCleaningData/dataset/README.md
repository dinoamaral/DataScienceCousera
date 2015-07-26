# Getting and Cleaning Data Course Project
This file describes how run_analysis.R script works.
* 1. Unzip the data located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* 2. Create a folder "dataset" and save the "run_analysis.R" in this directory
* 3. To run the scripts save at "run_analysis.R", execute : source("run_analysis.R")
* 4. The results generate 2 files in the folder "dataset" :  a) merged_data.txt: a data frame called cjoined, which is the result of "cbinded" of files (test/train)-(Data/Rating/Subject) from the link above; b) data_with_means.txt : a data frame called result, which contains 180 rows with 66 features with average of each activity and each subject.
