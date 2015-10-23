##After extracting the Data in the folder named "dataset" in working directory

#Step 1 of Project:
##reading text and converting to data.frame

trainData <- read.table("./dataset/train/X_train.txt")

trainLabel <- read.table("./dataset/train/y_train.txt")

trainSubject <- read.table("./dataset/train/subject_train.txt")

testData <- read.table("./dataset/test/X_test.txt")

testLabel <- read.table("./dataset/test/y_test.txt") 

testSubject <- read.table("./dataset/test/subject_test.txt")

##Merging the data

MergeData <- rbind(trainData, testData)

MergeLabel <- rbind(trainLabel, testLabel)

MergeSubject <- rbind(trainSubject, testSubject)


# Step2. Extracting measurements on the mean and standard deviation for each measurement. 

features <- read.table("./dataset/features.txt")

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

MergeData <- MergeData[, meanStdIndices]

names(MergeData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(MergeData) <- gsub("mean", "Mean", names(MergeData))          # capitalize M
names(MergeData) <- gsub("std", "Std", names(MergeData))            # capitalize S
names(MergeData) <- gsub("-", "", names(MergeData))                 # remove "-" in column names 

# Step3 of the Project:

activity <- read.table("./dataset/activity_labels.txt")

activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[MergeLabel[, 1], 2]
MergeLabel[, 1] <- activityLabel
names(MergeLabel) <- "activity"

# Step4 of the Project:

names(MergeSubject) <- "subject"
cleanedData <- cbind(MergeSubject, MergeLabel, MergeData)

# write out the 1st dataset
write.table(cleanedData, "merged_data.txt", row.names = FALSE) 

# Step5 of the Project: 

subjectLen <- length(table(MergeSubject)) 
activityLen <- dim(activity)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(MergeSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}

# write out the 2nd dataset with averages
write.table(result, "data_with_means.txt",row.names = FALSE) 

data <- read.table("data_with_means.txt")
