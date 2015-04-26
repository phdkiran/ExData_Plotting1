library(dplyr)
#library(data.table)
#Read test and train data
x_test <- read.table("test/X_test.txt")
x_train <- read.table("train/X_train.txt")
y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")


#Part 1 - Merge the training and the test sets to create one data set
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

#Part2 Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
mean_std_cols<- filter(features, grepl("mean|col", V2))

#Use mean_std_cols on dataset x
x[, mean_std_cols[,1]]
#Part 3 Uses descriptive activity names to name the activities in the data set
colnames(y) <- c('activity')
activity_labels <- read.table("activity_labels.txt")
#Use inner join to match V1 and label
y<-inner_join(y, activity_labels, by.x="activity", by.y="V1")
y<-y[,2]

#Part 4 Appropriately labels the data set with descriptive variable names. 
x_lab <- cbind(y,x)
#Part 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- aggregate(x_lab, by = list(activity = y[,1], subject = subject[,1]), mean)
