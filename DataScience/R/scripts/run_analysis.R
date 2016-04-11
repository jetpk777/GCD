# Getting and Cleaning Data Course Project

# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
# 5 From the data set in step 4, creates a second, independent tidy data
#   set with the average of each variable for each activity and each subject.

# Download and unzip data set
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest <- "./dataset.zip"
download.file(url, dest)
unzip(dest, overwrite = TRUE, exdir = "./Samsung-HAR")

# Assign source data files to a variable
# set supplemental files
labels <- read.table("./Samsung-HAR/UCI HAR Dataset/activity_labels.txt",header=FALSE)
features <- read.table("./Samsung-HAR/UCI HAR Dataset/features.txt",header=FALSE)
# prepare test files
all_test <- read.table("./Samsung-HAR/UCI HAR Dataset/test/X_test.txt",header=FALSE)
all_test[,562] <- read.table("./Samsung-HAR/UCI HAR Dataset/test/y_test.txt",header=FALSE)
all_test[,563] <- read.table("./Samsung-HAR/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
# prepare train files
all_train <- read.table("./Samsung-HAR/UCI HAR Dataset/train/X_train.txt",header=FALSE)
all_train[,562] <- read.table("./Samsung-HAR/UCI HAR Dataset/train/y_train.txt",header=FALSE)
all_train[,563] <- read.table("./Samsung-HAR/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
# scrub "-" from mean and standard deviation descriptive variables (column headers) 
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
# scrub parentheses from variable descriptions (column headers)
features[,2] = gsub('[-()]', '', features[,2])
# combine test and train data sets
all_data <- rbind(all_test, all_train)
# capture only mean and standard deviation descriptive variables (column headers)
measures <- grep(".*Mean.*|.*Std.*", features[,2])
# restrict valriable list to desired variables
features <- features[measures,]
# add two columns
measures <- c(measures,562,563)
# restrict data set to desired variables
all_data <- all_data[,measures]
# aggregate the data set
tidy_data <- aggregate(all_data, by = list(partipicant = all_data[,88]), mean)
# export mean by participant in a pipe "|" delimited format
write.table(tidy_data, "tidy.txt", col.names = TRUE, sep = "|", row.names = FALSE)