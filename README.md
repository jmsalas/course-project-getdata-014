# Course project for the "Getting and Cleaning Data" course

This repository contains the results of the course project for the "Getting and Cleaning Data Course". The assignment requires that a raw dataset is transformed into a tidy data dataset, that summarizes and filters the original data, by doing the following process:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The files contained in this project are:

- **README.md:** This file
- **code_book.md:** The code book that describes the structure of the data in the resulting dataset.
- **run_analysis.R:** An R script that transforms the original data into a tidy dataset that complies with the assignment requirements.

## Source material
The original data used in this project was extracted from the ["Human Activity Recognition Using Smartphones Dataset - Version 1.0"][1]. This dataset contains the results of an experiment carried out with a group of 30 volunteers, who were required to perform different activities wearing a smartphone on the waist. The smartphone was used to capture different motion data, which was organized to be used with machine learning algorithms.

## Dependencies
In order to run correctly, the analysis script requires that the "plyr" and "dplyr" packages are installed in the system.

## Implementation
The implementation strategy for the analysis script consisted in performing the following actions:

### Acquiring the original dataset
The script will check if the original data is already present in the current working directory. If it is not, it will download the data (if necessary) and unzip it.

```{r }
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
```

### Load the relevant information into distinct dataframes
After the data is correctly stored in the current working directory, the script will load each of the relevant files in the dataset into distinct dataframes using the `read.table` function. Note that the files that contain string data, has an additional parameter `stringsAsFactors = FALSE`, which prevents the conversion of the strings into factors, since it can cause problems in the following steps (e.g. when using this data to generate the column names).

```{r }
# Load the relevant information into distinct dataframes
feature_labels <- read.table(file.path(folder_name,"features.txt"), stringsAsFactors = FALSE)
activity_labels <- read.table(file.path(folder_name,"activity_labels.txt"), stringsAsFactors = FALSE)

X_train <- read.table(file.path(folder_name,"train","X_train.txt"))
Y_train <- read.table(file.path(folder_name,"train","y_train.txt"))
subject_train <- read.table(file.path(folder_name,"train","subject_train.txt"))

X_test <- read.table(file.path(folder_name,"test","X_test.txt"))
Y_test <- read.table(file.path(folder_name,"test","y_test.txt"))
subject_test <- read.table(file.path(folder_name,"test","subject_test.txt"))
```

### Extract only the measurements on the mean and standard deviation
In the original specification for the assignment, this step was performed after merging the training and test sets. However, since it was made clear in the Course Forum that the order of the steps was not relevant, I chose to do this step first in order to discard unnecesary data before manipulating the dataframe. This decision slightly improves the speed of the process and reduces memory consumption, while making the code more readable.

In order to extract the mean and standard deviation values, the grep function was used to filter the columns for which the name contains the "-std()" and "-mean()" substrings. This intentionally leaves out the `angle(*)` columns, since they represent an angle between the mean data vectors and not the mean itself. The grep function will return the positions of the columns and not the values themselves.

After extracting the relevant columns from the label vector for the standard deviation and mean values, the resulting vectors must be combined and re-sorted to get the correct column positions in the `X_train` and `X_test` dataframes, so the select function from the `dplyr` package can be used to subset the dataframes.

```{r }
# Extract only the measurements on the mean and standard deviation
# The values are filtered before merging the sets to optimize memory usage
std_cols <- grep("-std", feature_labels[,2], fixed=TRUE)
mean_cols <- grep("-mean", feature_labels[,2], fixed=TRUE)

relevant_cols <- sort(c(std_labels, mean_labels))

X_train <- select(X_train, relevant_cols)
X_test <- select(X_test, relevant_cols)
```

### Merge the training and the test sets to create one data set
In order to merge the subsetted `X_train` and `X_test` dataframes with the corresponding subjects and Y (activity prediction) values, a simple combination of cbind and rbind statements is used to merge the dataframes into the `data` variable.

```{r }
# Merge the training and the test sets to create one data set
train <- cbind(subject_train, X_train, Y_train)
test <- cbind(subject_test, X_test, Y_test)

data <- rbind(train,test)
```

### Label the data set with descriptive variable names
The original labels in the dataset are not very descriptive and have some issues (e.g. names that contain repeated words and characters that can cause problems when doing operations like '-' or '()'). In order to generate more explicit names for the columns without hardcoding the names in the script, I decided to generate a list of replacement vectors and then iterate over the list doing each replacement in the column name vector.

After generating the new names for the columns, the column names are set in the `data` dataframe, by concatenating these names with the "Subject" and "Activity" labels, that correspond to the previously merged dataframes.

```{r }
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
```

### Use descriptive activity names
In order to redefine the activity values into the original names, the script iterates using `sapply` on the `Activity` column of the `data` dataframe and looking up for each row the matching value from the `activity_labels` dataframe. This replaces the 1-6 numbers by the corresponding name of the activity, making the data more explicit. The original numbers are not kept, since they will not be used in the resulting dataset.

```{r }
# Use descriptive activity names
activities <- sapply(data$Activity, function(x) activity_labels[x,2])
data$Activity <- activities
```

### Create a data set with the average of each variable
Finally, the resulting dataset is created using the `ddply` function, grouping by the `Subject` and `Activity` columns and performing a `mean` calculation over each resulting column. The dataframe is then written to the "result_dataset.txt" file, using the option `row.names = FALSE` as per required by the assignment. 

The extension ".txt" is used in the filename to prevent it from being confused with a CSV file.

```{r }
# Create a data set with the average of each variable 
# for each activity and each subject
summary_data <- ddply(data, .(Subject, Activity), colwise(mean))

# Write the resulting dataset to disk
write.table(summary_data, "result_dataset.txt", row.names = FALSE)
```


## Reading the results file
It is recommended that the results file is read using the following command:

```{r }
result_dataset <- read.table("result_dataset.txt", header = TRUE)
```

## Known issues
I have experimented a problem on my MacBook Pro - Yosemite 10.10.3 using RStudio 0.98.1103 when downloading the zip file (RStudio crashes). If this occurrs to you as well, kill the RStudio and curl processes from the console: 

1. `ps aux`
2. Identify the process ids
3. `kill pid1 pid2`
4. Restart RStudio
5. Download the zip file manually and rename to `galaxy_s_data.zip` before running the script again. 

This should prevent the download and allow the script to work normally.


[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
