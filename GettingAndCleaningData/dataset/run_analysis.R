####You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# setwd("~/Dropbox/Coursera/datasciencecoursera/GettingAndCleaningData/data")
trainData <- read.table("./data/train/X_train.txt")
trainRating <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")

testData <- read.table("./data/test/X_test.txt")
testRating <- read.table("./data/test/y_test.txt")  
testSubject <- read.table("./data/test/subject_test.txt")

joinData <- rbind(trainData, testData)
joinLabel <- rbind(trainRating, testRating)
joinSubject <- rbind(trainSubject, testSubject)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
measures <- read.table("./data/features.txt")
mean_std <- grep("mean\\(\\)|std\\(\\)", measures[, 2])
 
joinData <- joinData[, mean_std]
names(joinData) <- gsub("\\(\\)", "", measures[mean_std, 2])
names(joinData) <- gsub("mean", "Mean", names(joinData))
names(joinData) <- gsub("std", "Std", names(joinData)) 
names(joinData) <- gsub("-", "", names(joinData)) 

# 3. Uses descriptive activity names to name the activities in the data set
activity_label <- read.table("./data/activity_labels.txt")
activity_label[, 2] <- tolower(gsub("_", "", activity_label[, 2]))
substr(activity_label[2, 2], 8, 8) <- toupper(substr(activity_label[2, 2], 8, 8))
substr(activity_label[3, 2], 8, 8) <- toupper(substr(activity_label[3, 2], 8, 8))
activityLabel <- activity_label[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity" 

# 4. Appropriately labels the data set with descriptive activity names. 
names(joinSubject) <- "subject"
cjoined_data <- cbind(joinSubject, joinLabel, joinData)
write.table(cjoined_data, "~/GitHub/DataScienceCoursera/GettingAndCleaningData/dataset/merged_data.txt")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

subject_Len <- length(table(joinSubject)) 
activity_Len <- dim(activity_label)[1]
column_Len <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subject_Len*activity_Len, ncol=column_Len) 
result <- as.data.frame(result)
colnames(result) <- colnames(cjoined_data)

nrow <- 1
for(i in 1:subject_Len) {
  for(j in 1:activity_Len) {
    result[nrow, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[nrow, 2] <- activity_label[j, 2]
    var1 <- i == cjoined_data$subject
    var2 <- activity_label[j, 2] == cjoined_data$activity_label
    result[nrow, 3:column_Len] <- colMeans(cjoined_data[var1&var2, 3:column_Len])
    nrow <- nrow + 1
  }
}
write.table(result, "~/GitHub/DataScienceCoursera/GettingAndCleaningData/dataset/data_with_means.txt")
