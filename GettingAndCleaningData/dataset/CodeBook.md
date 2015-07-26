# Getting and Cleaning Data Course Project CodeBook
### Here follows a description of variables, data and transformation performed in the Course Project of "Getting and Cleaning Data" (Coursera):

* The data for the project was collected from the link bellow :
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The run_analysis.R script is built using the following steps:

a) Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" directory and assign the following  variables respectively: trainData, trainLabel and trainSubject.

b) Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" directory and assign the following  variables respectively: testData, testLabel and testSubject.

* Join testData and trainData to generate a 10299x561 data frame called joinData; join testLabel and trainLabel to generate a 10299x1 data frame called joinLabel; join testSubject and trainSubject to generate a 10299x1 data frame called joinSubject.

* Read the features.txt file from the "/data" folder and store the data in a variable called measures. Only the measurements on the mean and standard deviation are extracted and stores at mean_std variable.

* It is removed the following symbols from names: "()" and "-". It is also changed the first letter of "mean" and "std" for a corresponding capital letter respectively.

* Store the data from file "./data/activity_labels.txt" in a variable called activity_label.

* Make all names to lower cases and remove the underscore and insert a capitalized letter right fater the underscore

* Transform the values of joinLabel according to the activity data frame.

* Combine the joinSubject, joinLabel and joinData by column and store a variable called cjoined_data.

* Insert the names "subject" and "activity". The "subject" column ranges from 1 to 30 and "activity" has 6 differents types of classification

* Write the cjoined_data out to "merged_data.txt".

* Write the result out to "data_with_means.txt".
