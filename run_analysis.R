setwd("F:/DS/Getting and Cleaning Data")
library("dplyr")
library("tidyr")
library("data.table")
filespath <- "F:/DS/Getting and Cleaning Data/UCI HAR Dataset"

#reading subject trin and subject test
dataSubjectTrain <- tbl_df(read.table(file.path(filespath, "train", "subject_train.txt")))
dataSubjectTest <- tbl_df(read.table(file.path(filespath, "test", "subject_test.txt")))

#reading data files
dataTrain <- tbl_df(read.table(file.path(filespath, "train", "X_train.txt")))
dataTest <- tbl_df(read.table(file.path(filespath, "test", "X_test.txt")))

#reading activity files
dataActivityTrain <- tbl_df(read.table(file.path(filespath, "train", "Y_train.txt")))
dataActivityTest <- tbl_df(read.table(file.path(filespath, "test", "Y_test.txt")))


#           1) merging the train set and data set to create one data set 
alldataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
setnames(alldataSubject, names(alldataSubject), "subject")
alldataActivity <- rbind(dataActivityTrain, dataActivityTest)
setnames(alldataActivity, names(alldataActivity), "activityNum")
dataTable <- rbind(dataTrain,dataTest)

# changing the names of data table using features.txt
datafeatures <- tbl_df(read.table(file.path(filespath, "features.txt")))
setnames(datafeatures, names(datafeatures), c("featureNum", "featureName"))
colnames(dataTable) <- datafeatures$featureName

activityLabels <- tbl_df(read.table(file.path(filespath,"activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum", "activityName"))

alldataSubjAct <- cbind(alldataSubject, alldataActivity)
dataTable <- cbind(alldataSubjAct, dataTable)


#           2) extracts only the mesurements on mean and sd for each mesurement
datafeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)", datafeatures$featureName, value = TRUE)
datafeaturesMeanStd <- union(c("subject", "activityNum"), datafeaturesMeanStd)
dataTable <- subset(dataTable, select = datafeaturesMeanStd)


#           3) uses descriptive activity names to name the activities in the data set
dataTable <- merge(activityLabels, dataTable, by = "activityNum", all.x = TRUE)
dataTable$activityName <- as.character(dataTable$activityName)
dataAggr <- aggregate(. ~ subject - activityName, data = dataTable, mean)
dataTable <- tbl_df(arrange(dataAggr, subject, activityName))


#           4)Appropritly labels the data set with descriptive variable names
names(dataTable) <- gsub("std()", "SD", names(dataTable))
names(dataTable) <- gsub("mean()", "MEAN", names(dataTable))
names(dataTable) <- gsub("^t", "time", names(dataTable))
names(dataTable) <- gsub("^f", "frequency", names(dataTable))
names(dataTable) <- gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable) <- gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable) <- gsub("Mag", "Magnitude", names(dataTable))
names(dataTable) <- gsub("BodyBody", "Body", names(dataTable))


#           5)creating independent tidy data set
write.table(dataTable, "TidyData.txt", row.name = FALSE)