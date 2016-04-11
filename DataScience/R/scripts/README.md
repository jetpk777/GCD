README

VARIABLES AND SOURCE FILES
==============================================================
The following variables were used in the run_analysis.R scipt:
features = 'features.txt': List of all features.
labels = 'activity_labels.txt': Links the class labels with their activity name.
all_train = 'train/X_train.txt': Training set.
all_train = 'train/y_train.txt': Training labels.
all_test = 'test/X_test.txt': Test set.
all_test = 'test/y_test.txt': Test labels.
n/a* = 'features_info.txt': Shows information about the variables used on the feature vector.

PROCESSING
==============================================================
all_train is composed of train data and train subjects
all_test is composed of test data and test subjects
features is composed of the list a variables (column headers)
all_data is composed of the combined traing and test data sets
tidy_data contains the final data set and produces tidy.txt

* informational; not used for processing the data