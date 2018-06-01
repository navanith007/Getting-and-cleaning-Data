# Getting-and-cleaning-Data
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. We've been given the raw data collected from the accelerometers from the Samsung Galaxy S smartphone.
The following are the step by step process of data cleaning
 
 
 ### 1) Merging the traing  and test data set to one data set
 <!-- -->
 
    alldataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
    setnames(alldataSubject, names(alldataSubject), "subject")
    alldataActivity <- rbind(dataActivityTrain, dataActivityTest)
    setnames(alldataActivity, names(alldataActivity), "activityNum")
    dataTable <- rbind(dataTrain,dataTest)
    
    datafeatures <- tbl_df(read.table(file.path(filespath, "features.txt")))
    setnames(datafeatures, names(datafeatures), c("featureNum", "featureName"))
    colnames(dataTable) <- datafeatures$featureName
    activityLabels <- tbl_df(read.table(file.path(filespath,"activity_labels.txt")))
    setnames(activityLabels, names(activityLabels), c("activityNum", "activityName"))
    alldataSubjAct <- cbind(alldataSubject, alldataActivity)
    dataTable <- cbind(alldataSubjAct, dataTable)
data Table contains the merging of traing and test data

### 2) extracts only the measurements on mean and sd for each measurement
    datafeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)", datafeatures$featureName, value = TRUE)
    datafeaturesMeanStd <- union(c("subject", "activityNum"), datafeaturesMeanStd)
    dataTable <- subset(dataTable, select = datafeaturesMeanStd)
data Table contains the data containg only the measurements on mean and sd

### 3) uses descriptive activity names to name the activities in the data set
    dataTable <- merge(activityLabels, dataTable, by = "activityNum", all.x = TRUE)
    dataTable$activityName <- as.character(dataTable$activityName)
    dataAggr <- aggregate(. ~ subject - activityName, data = dataTable, mean)
    dataTable <- tbl_df(arrange(dataAggr, subject, activityName))
data Table contains the descriptive activity names.

### 4) Appropritly labels the data set with descriptive variable names
    names(dataTable) <- gsub("std()", "SD", names(dataTable))
    names(dataTable) <- gsub("mean()", "MEAN", names(dataTable))
    names(dataTable) <- gsub("^t", "time", names(dataTable))
    names(dataTable) <- gsub("^f", "frequency", names(dataTable))
    names(dataTable) <- gsub("Acc", "Accelerometer", names(dataTable))
    names(dataTable) <- gsub("Gyro", "Gyroscope", names(dataTable))
    names(dataTable) <- gsub("Mag", "Magnitude", names(dataTable))
    names(dataTable) <- gsub("BodyBody", "Body", names(dataTable))
 
### 5) creating independent tidy data set
    write.table(dataTable, "TidyData.txt", row.name = FALSE)
