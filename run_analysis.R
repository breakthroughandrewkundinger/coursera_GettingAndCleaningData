
# highlight code from START line to END line and press run in r studio. 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    # assumes that above UCI HAR Dataset is extracted to working directory location. 

###### START #########

library(data.table)
library(dplyr) 
library(reshape2)  


    # Load: activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
    # Load: data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
    # Extract: Measurements on mean and standard deviation for each measurement.
get_feature_set <- grepl("mean|std", features)


    # Load/process X_test & y_test data and subject test data set. 
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(x_test) = features

    # Extract only the measurements on the mean and standard deviation for each measurement.by subsetting columns on get_feature_set
x_test = x_test[,get_feature_set]

    # Apply activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

  # Bind y and x test data
test_data <- cbind(as.data.table(subject_test), y_test, x_test)

  # Load and process X_train & y_train data.
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(x_train) = features

  # Extract only the measurements on the mean and standard deviation for each measurement.
x_train = x_train[,get_feature_set]

  # Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

  # Combine y_train and x_train with cbind
train_data_df <- cbind(as.data.table(subject_train), y_train, x_train)

  # Combine test and train data
data_df = rbind(test_data, train_data_df)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data_df      = melt(data_df, id = id_labels, measure.vars = data_labels)

  # obtain the mean function by employing 'dcast'  sortying with arrange function. 
tidy_data_df   = dcast(melt_data_df, subject + Activity_Label ~ variable, mean)
tidy_data_df_sorted_by_subject_ID <- arrange(tidy_data_df, subject, Activity_Label)

write.table(tidy_data_df_sorted_by_subject_ID, file = "./tidy_data.txt", row.name=FALSE)

########## END ##############
