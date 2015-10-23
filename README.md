#Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

1. Unzip the data from given link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "dataset".
Make sure the folder "dataset" and the run_analysis.R script are both in the current working directory.

2. Use source("run_analysis.R") command in RStudio.

3. You will find two output files are generated in the current working directory:
  (i)  "merged_data.txt": it contains a data frame called cleanedData.
  (ii) "data_with_means.txt": it contains a data frame called result with 

4. Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.