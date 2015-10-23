#Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

The data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####The run_analysis.R script performs the following steps to clean the data:

1. Read X_train.txt, y_train.txt and subject_train.txt from the "./dataset/train" folder in working directory and store them in trainData, trainLabel and trainSubject variables respectively.

2. Read X_test.txt, y_test.txt and subject_test.txt from the "./dataset/test" folder in working directory and store them in testData, testLabel and testsubject variables respectively.

3. Concatenate testData to trainData to generate a data frame, MergeData; concatenate testLabel to trainLabel to generate a data frame, MergeLabel; concatenate testSubject to trainSubject to generate a data frame, MergeSubject.

4. Read the features.txt file from the "/dataset" folder in working directory and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of MergeData with the 66 corresponding columns.

5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
Read the activity_labels.txt file from the "./dataset" folder in working directory and store the data in a variable called activity.

6. Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.

7. Transform the values of MergeLabel according to the activity data frame.

8. Combine the MergeSubject, MergeLabel and MergeData by column to get a new cleaned data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

9. Write the cleanedData out to "merged_data.txt" file in current working directory.

10. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.

11. Write the result out to "data_with_means.txt" file in current working directory.

12. Read the data from "data_with_means.txt" in data variable.