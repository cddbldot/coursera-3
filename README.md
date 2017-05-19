# README
This repo contains the programming assignment for the Getting and Cleaning Data course from the Data Science Specialization by Johns Hopkins University on coursera.org.

# run_analysis.R
The R program to solve the assignment. For the code to work you need to download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and move the contents of the *UCI HAR Dataset* directory into your working directory.

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

# CodeBook.md
The codebook to explain the variables and the data.
