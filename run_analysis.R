# Load dependencies
library(plyr)
library(dplyr)

# Set parameters for acquiring the dataset
zip_filename <- "galaxy_s_data.zip"
folder_name <- "UCI HAR Dataset"
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download and unzip the dataset if it does not already exist
if (!file.exists(folder_name)){
        if (!file.exists(zip_filename)){
                download.file(data_url, zip_filename, method="curl")
        }
        unzip(zip_filename)
}

# Load the relevant information into distinct dataframes
feature_labels <- read.table(file.path(folder_name,"features.txt"), stringsAsFactors = FALSE)
activity_labels <- read.table(file.path(folder_name,"activity_labels.txt"), stringsAsFactors = FALSE)

X_train <- read.table(file.path(folder_name,"train","X_train.txt"))
Y_train <- read.table(file.path(folder_name,"train","y_train.txt"))
subject_train <- read.table(file.path(folder_name,"train","subject_train.txt"))

X_test <- read.table(file.path(folder_name,"test","X_test.txt"))
Y_test <- read.table(file.path(folder_name,"test","y_test.txt"))
subject_test <- read.table(file.path(folder_name,"test","subject_test.txt"))

# Extract only the measurements on the mean and standard deviation
# The values are filtered before merging the sets to optimize memory usage
std_cols <- grep("-std", feature_labels[,2], fixed=TRUE)
mean_cols <- grep("-mean", feature_labels[,2], fixed=TRUE)

relevant_cols <- sort(c(std_cols, mean_cols))

X_train <- select(X_train, relevant_cols)
X_test <- select(X_test, relevant_cols)

# Merge the training and the test sets to create one data set
train <- cbind(subject_train, X_train, Y_train)
test <- cbind(subject_test, X_test, Y_test)

data <- rbind(train,test)

# Label the data set with descriptive variable names
column_names <- feature_labels[relevant_cols,2]

# Make the default column names more descriptive
# Also, remove illegal chars and naming errors
replacements <- list(
        c("\\(\\)", ""),
        c("-", "_"),
        c("^t", "time_"),
        c("^f", "frequency_"),
        c("BodyBody", "Body"),
        c("Body", "body_"),
        c("meanFreq", "mean_frequency"),
        c("Gravity", "gravity_"),
        c("Acc", "acceleration"),
        c("Gyro", "angular_velocity"),
        c("Jerk", "_jerk"),
        c("Mag", "_magnitude")
        )

for (r in replacements){
        column_names <- gsub(r[1], r[2], column_names)
}

colnames(data) <- c("Subject", column_names, "Activity")

# Use descriptive activity names
activities <- sapply(data$Activity, function(x) activity_labels[x,2])
data$Activity <- activities

# Create a data set with the average of each variable 
# for each activity and each subject
summary_data <- ddply(data, .(Subject, Activity), colwise(mean))

# Write the resulting dataset to disk
write.table(summary_data, "result_dataset.txt", row.names = FALSE)
