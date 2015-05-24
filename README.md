# TidyDataProject
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.
The data used was collected from the accelerometers of the Samsung Galaxy S smartphone. 
A full description is available at the site from where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Objectives of the project:
You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. 

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.

###Steps in the run_analysis.R file:

1.The "subject","X","Y" data sets of the test and train folders, "features" and "activity_labels" data sets were read.

2."X_test" and "X_train" were combined to form a single data set.

3.Columns from the above data set having mean and standard deviation measurements were extracted. Those columns were merged 
to form a new data set and the column names were renamed using "features" data set.

4.The subject and activity(Y) data sets of test and train were combined. The subject and activity(Y) data sets were merged 
with the above data set to form a new data set. The subject and activity columns were renamed.

5.Descriptive values were given to the data of the "Activity" column using the "activity_labels" data set.

6.The mean of the measurement columns for each unique pair of "Subject" and "Activity" values was calculated 
and then the data set was rearranged based on the "Subject" column.

7.The above created data set was written to a text file for submission.
