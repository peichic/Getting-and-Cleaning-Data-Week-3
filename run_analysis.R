s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
names(X_train) <- features[,2]
names(X_test) <- features[,2]
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in 1:6) { y_train [y_train == i] <- as.character(activity_labels[activity_labels$V1 == i, 2]) }
for (i in 1:6) { y_test [y_test == i] <- as.character(activity_labels[activity_labels$V1 == i, 2]) }
complete_x <- cbind(s_test, X_test, y_test, body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)
complete_y <- cbind(s_train, X_train, y_train, body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)
complete <- rbind(complete_x, complete_y)
meanstdData <- complete[grep("Mean|mean|std", names(complete))]
colnames(complete)[1] <- "subject"
colnames(complete)[563] <- "activity"
for (i in 1:128) { colnames(complete)[i+563] <- paste ("body_acc_x_win", i, sep = ""); colnames(complete)[i+128+563] <- paste ("body_acc_y_win", i, sep = "");
colnames(complete)[i+128+128+563] <- paste ("body_acc_z_win", i, sep = ""); colnames(complete)[i+128+128+128+563] <- paste ("body_gyro_x_win", i, sep = ""); colnames(complete)[i+128+128+128+128+563] <- paste ("body_gyro_y_win", i, sep = ""); 
colnames(complete)[i+128+128+128+128+128+563] <- paste ("body_gyro_z_win", i, sep = ""); colnames(complete)[i+128+128+128+128+128+128+563] <- paste ("total_acc_x_win", i, sep = ""); colnames(complete)[i+128+128+128+128+128+128+128+563] <- paste ("total_acc_y_win", i, sep = "");
colnames(complete)[i+128+128+128+128+128+128+128+128+563] <- paste ("total_acc_z_win", i, sep = "")}
for (i in 1:14) { colnames(complete)[i+303] <- paste(colnames(complete)[i+303], "-X", sep=""); colnames(complete)[i+317] <- paste(colnames(complete)[i+317], "-Y", sep=""); colnames(complete)[i+331] <- paste(colnames(complete)[i+331], "-Z", sep="") }
for (i in 1:14) { colnames(complete)[i+382] <- paste(colnames(complete)[i+382], "-X", sep=""); colnames(complete)[i+396] <- paste(colnames(complete)[i+396], "-Y", sep=""); colnames(complete)[i+410] <- paste(colnames(complete)[i+410], "-Z", sep="") }
for (i in 1:14) { colnames(complete)[i+461] <- paste(colnames(complete)[i+461], "-X", sep=""); colnames(complete)[i+475] <- paste(colnames(complete)[i+475], "-Y", sep=""); colnames(complete)[i+489] <- paste(colnames(complete)[i+489], "-Z", sep="") }
library(dplyr)
newData <- complete %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(newData, file = "./UCI HAR Dataset/newData.txt", row.names  = FALSE)