## Assignment 1

# Read all the files
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", header = FALSE)
Activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", header = FALSE)
Activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"", header = FALSE)
data_feature <- read.table("./UCI HAR Dataset/features.txt", quote="\"", header = FALSE)
data_activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"", header = FALSE)

# Merge all the files
all_subject <- rbind(subject_train,subject_test)
all_data <- rbind(x_train,x_test)
all_activity <- rbind(Activity_train,Activity_test)

# Rename columns
names(all_subject) <- c("subject_num")
names(all_activity) <- c("activity_num")
names(all_data) <- data_feature$V2
names(data_activity_labels) <- c("activity_num", "activity_name")

# Create final data frame
finaldata <- cbind(all_subject, all_activity, all_data)

## Assignment 2
# find position of all rows having word 'mean' or 'std'
featureID <- grep("mean\\(\\)|std\\(\\)", data_feature$V2)
featurenames <-data_feature$V2[featureID]
# subset the dataset with above value
subdata <- subset(finaldata, select = c(as.character(featurenames), "subject_num", "activity_num"))

## Assignment 3
#Method 1. This will however create an extra column
finaldata <- merge(data_activity_labels, finaldata , by="activity_num", all.x=TRUE)

#Method 2. This will take little long but will not create extra column
finaldata$activity_num <- as.character(finaldata$activity_num)
for (i in 1:6){
  finaldata$activity_num[finaldata$activity_num == i] <- as.character(data_activity_labels[i,2])
}
# you have to convert value as factor
finaldata$activity_num <- as.factor(finaldata$activity_num)

## Assignment 4

names(finaldata) <- gsub("^t", "time", names(finaldata))
names(finaldata) <- gsub("^f", "freqeuncy", names(finaldata))
names(finaldata) <- gsub("Gyro", "Gyroscope", names(finaldata))
names(finaldata) <- gsub("Mag", "Magnitude", names(finaldata))
names(finaldata) <- gsub("Acc", "Accelerometer", names(finaldata))
names(finaldata) <- gsub("std()", "SD", names(finaldata))
names(finaldata) <- gsub("mean()", "MEAN", names(finaldata))
names(finaldata) <- gsub("BodyBody", "Body", names(finaldata))
names(finaldata) <- gsub("tBody", "TimeBody", names(finaldata))
names(finaldata) <- gsub("gravity", "Gravity", names(finaldata))

## Assignment 5
# here you have to pass all variable, in below formula as (.) and then aggregate based on subject_num+activity_num (two variables). 
# The columns to be aggregated are all before '~'.
ans5<-aggregate(.~subject_num+activity_num, finaldata, mean)
ans5<-ans5[order(ans5$subject_num,ans5$activity_num)]
write.table(ans5, file = "Tidy.txt", row.names = FALSE)

## remove variables
rm(ans5)
rm(finaldata)
rm(subdata)
rm(featurenames)
rm(featureID)
rm(all_subject)
rm(all_data)
rm(all_activity)
rm(subject_train)
rm(subject_test)
rm(x_train)
rm(x_test)
rm(Activity_train)
rm(Activity_test)
rm(data_feature)
rm(data_activity_labels)