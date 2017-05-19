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

## Transformations in Step 3: Use descriptive activity names

Activities are logged by their ids. To get descriptive activity names I read the respective labels from *activity_labels.txt* and factorized the `activity` column.

## Transformations in Step 4: Appropriately label the data set with descriptive variable names

The variables are already descriptive because they were labeled in Step 2. Here I just removed the characters `()-` from the variable names so they are easier to read. The first letters of the substrings `mean` and `std` needed to be capitalized.

I explicitly don't want to have the variable names in lowercase (as the course materials suggested) because the capital letters give structure to the variable names. They are much easier to read this way.

## Transformations in Step 5: create a tidy data set with the average of each variable for each activity and each subject

For the `tidy` data set I needed to group the data by subject and activity, which for a `data.table` object can easily be achieved with `by = c("subject", "activity)`. Then I have to iterate over each column and calculate the mean for the stored data. `.SD` is a `data.table` containing the subset of data for each group, so I can simply call `lapply(.SD, mean)`.

I still have the "old" variable names. To clarify I calculated the average over the original data I also added `Avg` to all headers starting from column 3.

I chose a *wide* format for the tidy data set. There is no missing data, so there is also no benefit in converting the data to a *long* format.

## Result

The result of all transformations is a tidy data set with the following columns.

* subject - the subject id of type `integer`
* activity - the activity id of type `factor` with 6 levels *walking, walking_upstairs, walking_downstairs, sitting, standing, laying*

The averages of mean and standard deviation measures from the studies of type `numeric`:

* tBodyAccMeanXAvg
* tBodyAccMeanYAvg
* tBodyAccMeanZAvg
* tBodyAccStdXAvg
* tBodyAccStdYAvg
* tBodyAccStdZAvg
* tGravityAccMeanXAvg
* tGravityAccMeanYAvg
* tGravityAccMeanZAvg
* tGravityAccStdXAvg
* tGravityAccStdYAvg
* tGravityAccStdZAvg
* tBodyAccJerkMeanXAvg
* tBodyAccJerkMeanYAvg
* tBodyAccJerkMeanZAvg
* tBodyAccJerkStdXAvg
* tBodyAccJerkStdYAvg
* tBodyAccJerkStdZAvg
* tBodyGyroMeanXAvg
* tBodyGyroMeanYAvg
* tBodyGyroMeanZAvg
* tBodyGyroStdXAvg
* tBodyGyroStdYAvg           
* tBodyGyroStdZAvg
* tBodyGyroJerkMeanXAvg
* tBodyGyroJerkMeanYAvg
* tBodyGyroJerkMeanZAvg
* tBodyGyroJerkStdXAvg       
* tBodyGyroJerkStdYAvg
* tBodyGyroJerkStdZAvg
* tBodyAccMagMeanAvg
* tBodyAccMagStdAvg
* tGravityAccMagMeanAvg
* tGravityAccMagStdAvg
* tBodyAccJerkMagMeanAvg
* tBodyAccJerkMagStdAvg
* tBodyGyroMagMeanAvg
* tBodyGyroMagStdAvg
* tBodyGyroJerkMagMeanAvg
* tBodyGyroJerkMagStdAvg
* fBodyAccMeanXAvg
* fBodyAccMeanYAvg
* fBodyAccMeanZAvg           
* fBodyAccStdXAvg
* fBodyAccStdYAvg
* fBodyAccStdZAvg
* fBodyAccJerkMeanXAvg
* fBodyAccJerkMeanYAvg       
* fBodyAccJerkMeanZAvg
* fBodyAccJerkStdXAvg
* fBodyAccJerkStdYAvg
* fBodyAccJerkStdZAvg
* fBodyGyroMeanXAvg
* fBodyGyroMeanYAvg
* fBodyGyroMeanZAvg
* fBodyGyroStdXAvg
* fBodyGyroStdYAvg
* fBodyGyroStdZAvg
* fBodyAccMagMeanAvg
* fBodyAccMagStdAvg
* fBodyBodyAccJerkMagMeanAvg
* fBodyBodyAccJerkMagStdAvg
* fBodyBodyGyroMagMeanAvg
* fBodyBodyGyroMagStdAvg
* fBodyBodyGyroJerkMagMeanAvg
* fBodyBodyGyroJerkMagStdAvg
