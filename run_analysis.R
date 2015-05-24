##read the activity labels and features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt",colClasses="character")

##read the subject, X and Y files of the test dataset
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

##read the subject, X and Y files of the train dataset
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

##row binding the X_test dataset and Y_test dataset
temp_data <- rbind(X_test,X_train)

##extracting the columns from the above data frame i.e.temp_data having
##mean and standard deviation measurements.Column binding the required
##columns into a new data frame i.e.temp_X and renaming the column names
##from "features" data set
c <- 1
temp_X <- data.frame(1:nrow(temp_data))
for(i in 1:nrow(features)){
  if(grepl("mean",features[i,2]) || grepl("std",features[i,2])){
    temp_X <- cbind(temp_X,temp_data[[i]])
    colnames(temp_X)[c+1] <- features[i,2]
    c <- c+1
  }
}

##Row binding the subject and activity(Y) data sets of test and train.
##Adding the subject and activity(Y) data sets to the previously created
##"temp_X' data set to form a new data set "data"
temp_X <- temp_X[,-1]
temp_Y <- rbind(Y_test,Y_train)
temp_subject <- rbind(subject_test,subject_train)
data <- cbind(temp_subject,temp_Y,temp_X)

##Renaming column names of the subject and activity columns
colnames(data)[1] <- "Subject"
colnames(data)[2] <- "Activity"

##Giving descriptive values to the values of the "Activity" column from the
##"activity_labels" data set
for(j in 1:nrow(data)){
  for(k in 1:nrow(activity_labels)){
    if(data[j,2]==activity_labels[k,1])
      data[j,2] <- activity_labels[k,2]
  }
}

##calculating the mean of the measurement columns for each unique pair of
##"Subject" and "Activity" values and then rearranging the data set based
##on the "Subject" column
tidy_data<-aggregate(data[,3:ncol(data)],by=list(Subject = data[[1]],Activity = data[[2]]),mean)
tidy_data <- arrange(tidy_data,Subject)

##writing the above created data set to a text file for submission
write.table(tidy_data,file="tidy_data.txt",row.names=F,col.names=T)