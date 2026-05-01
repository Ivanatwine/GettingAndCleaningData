## Week 4 assignement.
setwd("C:/Users/user/Downloads/getdata_projecfiles_UCI HAR Dataset/UCI HAR Dataset")
#Read activity labels and features
activity_labels<- read.table("activity_labels.txt")
features<- read.table("features.txt")
activity_labels
features
#Read training data
x_train<- read.table("train/X_train.txt")
y_train<- read.table("train/y_train.txt")
subject_train<- read.table("train/subject_train.txt")

#Read test data
x_test<- read.table("test/X_test.txt")
y_test<- read.table("test/y_test.txt")
subject_test<- read.table("test/subject_test.txt")

##Task 1 id to merge training set and test set.
x_all<- rbind(x_train, x_test)
y_all<- rbind(y_train, y_test)
subject_all<- rbind(subject_train, subject_test)
#assign column names
colnames(x_all)<- features$V2
colnames(y_all)<- "activity"
colnames(subject_all)<- "subject"
#merge into one dataset
merged_data<- cbind(subject_all, y_all, x_all)
#Extract only the measurements on the mean and standard deviation for each measurement
#we use the grep function
mean_std_cols<- grep("mean\\(\\)|std\\(\\)", names(merged_data))
extracted_data<- merged_data[, c(1, 2, mean_std_cols)]
dim(extracted_data)

#Using descriptive activity names to name activities in the dataset
head(extracted_data)
tail(extracted_data)

##Appropriately label the dataset with descriptive variable names
# clean up column names
names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data) <- gsub("-mean\\(\\)", "Mean", names(extracted_data))
names(extracted_data) <- gsub("-std\\(\\)", "STD", names(extracted_data))
names(extracted_data) <- gsub("-", "", names(extracted_data))

# check the new names
names(extracted_data)

##create a tidy dataset with the average of each variable for each activity and each sybject
tidy_data<- extracted_data%>% group_by(subject, activity) %>% summarise_all(mean)
dim(tidy_data)
#SAVE THE NEW DATASET
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)