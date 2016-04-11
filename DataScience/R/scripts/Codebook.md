CODE BOOK

Getting and Cleaning Data Course Project
1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement.
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names.
5 From the data set in step 4, creates a second, independent tidy data
  set with the average of each variable for each activity and each subject.

The run_analysis.R scripts completes the following tasks:
- download and unzip data set
- assign source data files to a variable
- set supplemental files
- prepare test files
- prepare train files
- scrub "-" from mean and standard deviation descriptive variables (column headers) 
- scrub parentheses from variable descriptions (column headers)
- combine test and train data sets
- capture only mean and standard deviation descriptive variables (column headers)
- restrict valriable list to desired variables
- add two columns
- restrict data set to desired variables
- aggregate the data set
- export mean by participant in a pipe "|" delimited format