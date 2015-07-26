####You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# setwd("~/Dropbox/Coursera/datasciencecoursera/GettingAndCleaningData/data")
trainData <- read.table("./dataset/train/X_train.txt")
trainRating <- read.table("./dataset/train/y_train.txt")
trainSubject <- read.table("./dataset/train/subject_train.txt")

testData <- read.table("./dataset/test/X_test.txt")
testRating <- read.table("./dataset/test/y_test.txt")  
testSubject <- read.table("./dataset/test/subject_test.txt")

joinData <- rbind(trainData, testData)
joinLabel <- rbind(trainRating, testRating)
joinSubject <- rbind(trainSubject, testSubject)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
measures <- read.table("./dataset/features.txt")
mean_std <- grep("mean\\(\\)|std\\(\\)", measures[, 2])
 
joinData <- joinData[, mean_std]
names(joinData) <- gsub("\\(\\)", "", measures[mean_std, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names 

# 3. Uses descriptive activity names to name the activities in the data set
activity_label <- read.table("./dataset/activity_labels.txt")
activity_label[, 2] <- tolower(gsub("_", "", activity_label[, 2]))
substr(activity_label[2, 2], 8, 8) <- toupper(substr(activity_label[2, 2], 8, 8))
substr(activity_label[3, 2], 8, 8) <- toupper(substr(activity_label[3, 2], 8, 8))
activityLabel <- activity_label[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity" 

# 4. Appropriately labels the data set with descriptive activity names. 
names(joinSubject) <- "subject"
cjoined_data <- cbind(joinSubject, joinLabel, joinData)
write.table(cleanedData, "./dataset/merged_data.txt")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.







