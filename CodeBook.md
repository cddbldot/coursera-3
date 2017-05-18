# Code Book

## Data Source

The data used in run_analysis.R is taken from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,

extracted, and the contents from the *UCI HAR Dataset* moved to the working directory.

## Used Files

* *features.txt* - 561 headers for 561 variables in training and test data
* *activity_labels.txt* - 6 labels for the subject activities: *walking, walking_upstairs, walking_downstairs, sitting, standing, laying*
* *train/subject_train.txt* - 7352 subject ids to identify each row in the training set
* *train/X_train.txt* - 7352 rows of 561 measures in the training set
* *train/y_train.txt* - 7352 activity ids to identify the subject activities for each training set row
* *test/subject_test.txt* - 2947 subject ids to identify each row in the training set
* *test/X_test.txt* - 2947 rows of 561 measures in the training set
* *test/y_test.txt* - 2974 activity ids to identify the subject activities for each training set row

## Transformations in Step 1: Merge train and test data into one data set

* load all data (`fread` from `data.table` package makes it fast and easy)
* label the table columns
* combination of all data
  * `cbind` of subjects, activites and measures for both the training and the test set
  * `rbind` of the combined training and test sets - resulting in `data` object of type `data.table`
  
## Transformations in Step 2: Extract mean and standard deviation measurements

I subset the `data` object to retrieve only the columns with the headings `subject` and `activity` as well as all columns who have `mean` or `std` in the column name followed by a `(`.
