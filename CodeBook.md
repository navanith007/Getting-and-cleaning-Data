# Descrition of the data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.These time 
domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into
body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.The body linear 
acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag).
A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).

### Description of Abbrevation of Measurements

1) leading t or f based on time or frequency measurements
2) Body = related to body movement
3) Gravity = Acceleration due to gravity
4) Acc = Accelerometer measurement
5) Gyro = gyroscopic measurements
6) Jerk = Sudden movement accelertion
7) Mag = magnitude of movement
8) mean and SD are calculated for each subject for each activity for each mean and SD measurements.

The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.
They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.

1) tBodyAcc-XYZ
2) tGravityAcc-XYZ
3) tBodyAccJerk-XYZ
4) tBodyGyro-XYZ
5) tBodyGyroJerk-XYZ
6) tBodyAccMag
7) tGravityAccMag
8) tBodyAccJerkMag
9) tBodyGyroMag
10) tBodyGyroJerkMag
11) fBodyAcc-XYZ
12) fBodyAccJerk-XYZ
13) fBodyGyro-XYZ
14) fBodyAccMag
15) fBodyAccJerkMag
16) fBodyGyroMag
17) fBodyGyroJerkMag

### Data set information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six 
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the 
waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding 
windows. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### clean the data set using the 5 steps explained in readme.md

### Description of tidy data set:
 The tidy data set a set of variables for each activity and each subject. 10299 instances are split into 180 groups 
 (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 
 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + ActivityName
 +ActivityNum. The tidy data set’s first row is the header containing the names for each column.
