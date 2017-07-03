# Getting-and-Cleaning-Data-Week-3
I first read in all the text files into separate data sets. Replace variable names of X_train and X_test with feature names.
I then use descriptive activity names to name the activities in the data set by replacing the numeric data in y_train and y_test with corresponding activity names.
Put together testing data sets and then put together trainsing data sets. And then merge the two data sets to create the final and gigantic dataset named "complete".
Extract only the measurements on the mean and standard deviation for each measurement and put the result in dataset "meanstdData".
Appropriately labels the data set with descriptive variable names and to make each variable name unique by adding axis indicator, X, Y, or Z.
Finally, createa a second, independent tidy data set named "newData" with the average of each variable for each activity and each subject.
# Code book
subject: representing number of the volunteer
activity: activity labels
