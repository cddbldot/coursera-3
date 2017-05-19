library(data.table)

##
## 1. Merge train and test data into one data set
##

# read features
features <- fread("./features.txt")

# read training data columns
subjectstrain <- fread("./train/subject_train.txt")
xtrain <- fread("./train/X_train.txt")
ytrain <- fread("./train/y_train.txt")

# rename training data
setnames(subjectstrain, "V1", "subject")
setnames(xtrain, names(xtrain), features$V2)
setnames(ytrain, "V1", "activity")

# read test data
subjectstest <- fread("./test/subject_test.txt")
xtest <- fread("./test/X_test.txt")
ytest <- fread("./test/y_test.txt")

# rename test data columns
setnames(subjectstest, "V1", "subject")
setnames(xtest, names(xtest), features$V2)
setnames(ytest, "V1", "activity")

# combine data
traindata <- cbind(subjectstrain, ytrain, xtrain)
testdata <- cbind(subjectstest, ytest, xtest)
data <- rbind(traindata, testdata)


##
## 2. Extract mean and standard deviation measurements
##
##    Those measurements have "mean(" or "std(" in their headers, so i filter
##    them.
##
##

extract <- data[, c("subject", "activity", grep("(mean|std)[(]{1}", names(data),
                                                value = TRUE)), with = FALSE]


##
## 3. Use descriptive activity names
##
##    Overwrite the activity id by a factor with activity labels
##

activities <- fread("./activity_labels.txt")
extract[, activity := factor(activity, activities, labels = activities$V2)]


##
## 4. Appropriately label the data set with descriptive variable names
##
##    I already renamed the data in section 1, so here I just remove
##    the ( ) - characters from the names. I explicitly don't want to have
##    them in lowercase because the capital letters give the variable
##    names structure.
##

setnames(extract, names(extract), gsub("[()-]", "", names(extract)))
setnames(extract, names(extract), sub("mean", "Mean", names(extract)))
setnames(extract, names(extract), sub("std", "Std", names(extract)))


##
## 5. create a tidy data set with the average of each variable for each activity
##    and each subject
##

# group the data by subject and activity (by = ...) and calculate the mean
# for every column (.SD gives all the columns and lapply iterates mean over
# them)
tidy <- extract[, lapply(.SD, mean), by = c("subject", "activity")]

# add "Avg" to each calculated variable name starting from column 3 (columns 1:2
# are for subjects and activities)
setnames(tidy, names(tidy)[3:NROW(names(tidy))],
         paste0(names(tidy)[3:NROW(names(tidy))], "Avg"))
