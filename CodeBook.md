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


## Features (taken from `features_info.txt` and updated for transformations in run_analysis.R)

* subject - the subject id of type `integer`
* activity - the activity id of type `factor` with 6 levels *walking, walking_upstairs, walking_downstairs, sitting, standing, laying*

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAccXYZ and tGyroXYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAccXYZ and tGravityAccXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerkXYZ and tBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAccXYZ, fBodyAccJerkXYZ, fBodyGyroXYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAccXYZ
* tGravityAccXYZ
* tBodyAccJerkXYZ
* tBodyGyroXYZ
* tBodyGyroJerkXYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccXYZ
* fBodyAccJerkXYZ
* fBodyGyroXYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* Mean: Mean value
* Std: Standard deviation
* Avg: The Average of Mean and Std values for each subject and activity.
