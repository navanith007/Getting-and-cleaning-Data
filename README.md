# Getting-and-cleaning-Data
 The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. We've been given the raw data collected from the accelerometers from the Samsung Galaxy S smartphone.
 The following are the step by step process of data cleaning
 
 
 ### 1) Merging the traing  and test data set to one data set
 <!-->
alldataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
setnames(alldataSubject, names(alldataSubject), "subject")
alldataActivity <- rbind(dataActivityTrain, dataActivityTest)
setnames(alldataActivity, names(alldataActivity), "activityNum")
dataTable <- rbind(dataTrain,dataTest)
