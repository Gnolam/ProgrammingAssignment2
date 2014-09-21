##########################################################################################################

## Coursera Getting and Cleaning Data Course Project
## Alex Skorokhod
## 2014-09-21

# run_analysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##########################################################################################################


## Step 0. Initialise working environment
#  Setup working folder

# Clean up workspace
rm(list=ls())

setwd("D:/Coursera/3. Getting and Cleaning Data (getdata-005)/Data")
getwd()

#  Check if the package is installed before requiring it
if (!require("data.table")) {
  install.packages("data.table")
}

require("data.table")


# Download and unpack the data before using it
# I had to remove CURL option in my Win8 environment
# You mind find it important to keep it in your case
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip")#, method = "curl")

# Unpack + preserve the folder structure
unzip("Dataset.zip")


## Step 1. Merges the training and the test sets to create one data set.
# Make load + cbind in the same step
# Control for dynamic change of the number of columns
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,ncol(training)+1] <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,ncol(training)+1] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)


testing <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,ncol(testing)+1] <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,ncol(testing)+1] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

all_data <- rbind(training,testing)




## Step 3. Uses descriptive activity names to name the activities in the data set
col_names = c(read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE,colClasses="character")[,2],"Activity", "Subject")
col_names_new <- gsub("-mean()","Mean",col_names,fixed=TRUE)
col_names_new <- gsub("-std()","Std",col_names,fixed=TRUE)
colnames(all_data) <- col_names_new

## Step 2. Uses descriptive activity names to name the activities in the data set
# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
col_filter_list <- grep(".*mean\\(\\)|.*std\\(\\)", col_names)

# Subset all_data table based on the col_filter_list to keep only the desired columns
final_data = all_data[,c(col_filter_list,ncol(all_data),ncol(all_data)-1)]


## Step 4. Appropriately labels the data set with descriptive variable names.
# Load labels <-> IDs dictionaries
activity_codes = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE,colClasses="character", col.names=c("Code","Label"))


# Replace text labels with codes
final_data$Activity <- factor(final_data$Activity,levels=activity_codes$Code,labels=activity_codes$Label)


## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DT <- data.table(final_data)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE)
