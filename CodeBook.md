---
title: "CodeBook"
author: "Ojustwin Naik"
date: "July 26, 2015"
output: md_document
---
#STUDY DESIGN

The tidy data set included in this study is derived from data files provided by another study called 'Human Activity Recognition Using Smartphones Dataset Version 1.0' conducted by: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

For more info on original study please see:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Following is excerpt from readme file included with original study data.
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

#CODE BOOK

The dataset from original study was merged and tidied and then only the measurements on the mean and standard deviation for each record were extracted. Since the angle measurements are computed from other variables already included in the data set, variables with angle() in their name were omitted regardless of if they contained 'mean' in their name. 

With this extracted data an independent tidy dataset was created which summarizes the mean of each continuous variable grouped by each subject and each activity.  Finally the tidy data set was ordered by subject and activity name.

This tidy dataset includes 180 rows and 81 columns. The dataset variables include two categorical variables and 79 continuous variables. The continuous variables can have negative values since the features are normalized and bounded within [-1,1]

The units for Angular Velocity measurements below are radians/second.

#DATA DICTIONARY

subject
	Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
	
activityName
	Activity performed by subject. This Factor has six levels:
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

bodyAccel-Mean-X
bodyAccel-Mean-Y
bodyAccel-Mean-Z
	Body Linear Acceleration Mean. This is the time domain measure of the mean of body acceleration signal (from accelerometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The acceleration signal was separated into body acceleration signal using low pass Butterworth filter with a corner frequency of 0.3 Hz.

bodyAccel-StdDev-X
bodyAccel-StdDev-Y
bodyAccel-StdDev-Z
	Body Linear Acceleration Standard Deviation. This is the time domain measure of the standard deviation of body acceleration signal (from accelerometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The acceleration signal was separated into body acceleration signal using low pass Butterworth filter with a corner frequency of 0.3 Hz.

gravityAccel-Mean-X
gravityAccel-Mean-Y
gravityAccel-Mean-Z
	Gravity Acceleration Standard Mean. This is the time domain measure of the mean of gravity acceleration signal (from accelrometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The acceleration signal was separated into gravity acceleration signal using low pass Butterworth filter with a corner frequency of 0.3 Hz.

gravityAccel-StdDev-X
gravityAccel-StdDev-Y
gravityAccel-StdDev-Z
	Gravity Acceleration Standard Deviation. This is the time domain measure of the standard deviation of gravity acceleration signal (from accelrometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The acceleration signal was separated into gravity acceleration signal using low pass Butterworth filter with a corner frequency of 0.3 Hz.

bodyAccelJerk-Mean-X
bodyAccelJerk-Mean-Y
bodyAccelJerk-Mean-Z
	Body Linear Acceleration Jerk Mean. This is time domain measure of the mean of body linear acceleration (from accelerometer) derived in time to obtain Jerk signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

bodyAccelJerk-StdDev-X
bodyAccelJerk-StdDev-Y
bodyAccelJerk-StdDev-Z
	Body Linear Acceleration Jerk Standard Deviation. This is time domain measure of the standard deviation of body linear acceleration (from accelerometer) derived in time to obtain Jerk signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

bodyVelo-Mean-X
bodyVelo-Mean-Y
bodyVelo-Mean-Z
	Body Angular Velocity Mean. This is the time domain measure of the mean of body angular velocity signal (from gyroscope). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

bodyVelo-StdDev-X
bodyVelo-StdDev-Y
bodyVelo-StdDev-Z
	Body Angular Velocity Standard Deviation. This is the time domain measure of the standard deviation of body angular velocity signal (from gyroscope). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

bodyVeloJerk-Mean-X
bodyVeloJerk-Mean-Y
bodyVeloJerk-Mean-Z
	Body Angular Velocity Jerk Mean. This is the time domain measure of the mean of body angular velocity (from gyroscope) derived in time to obtain Jerk signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

bodyVeloJerk-StdDev-X
bodyVeloJerk-StdDev-Y
bodyVeloJerk-StdDev-Z
	Body Angular Velocity Jerk Standard Deviation. This is the time domain measure of the standard deviation of body angular velocity (from gyroscope) derived in time to obtain Jerk signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


bodyAccelMagn-Mean
	Mean of Body Linear Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

bodyAccelMagn-StdDev
	Standard Deviation of Body Linear Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

gravityAccelMagn-Mean
	Mean of Gravity Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

gravityAccelMagn-StdDev
	Standard Deviation of Gravity Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

bodyAccelJerkMagn-Mean
	Mean of Body Linear Acceleration Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

bodyAccelJerkMagn-StdDev
	Standard Deviation of Body Linear Acceleration Jerk Magnitude. The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

bodyVeloMagn-Mean
	Mean of Body Angular Velocity Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

bodyVeloMagn-StdDev
	Standard Deviation of Body Angular Velocity Magnitude. The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

bodyVeloJerkMagn-Mean
	Mean of Body Angular Velocity Jerk Magnitude. The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

bodyVeloJerkMagn-StdDev
	Standard Deviation of Body Angular Velocity Jerk Magnitude. The magnitude of these three-dimensional signals were calculated using the Euclidean norm.


freqBodyAccel-Mean-X
freqBodyAccel-Mean-Y
freqBodyAccel-Mean-Z
	Frequency Body Linear Acceleration Mean. This is frequency domain measure of the mean of Body Linear Acceleration, derived by applying a Fast Fourier Transform (FFT) to the signal (from accelerometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyAccel-StdDev-X
freqBodyAccel-StdDev-Y
freqBodyAccel-StdDev-Z
	Frequency Body Linear Acceleration Standard Deviation. This is frequency domain measure of the standard deviation of Body Linear Acceleration, derived by applying a Fast Fourier Transform (FFT) to the signal (from accelerometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyAccel-MeanFreq-X
freqBodyAccel-MeanFreq-Y
freqBodyAccel-MeanFreq-Z
	Frequency Body Linear Acceleration Mean Frequency. This frequency domain measure of mean frequency was obtained by taking a weighted average of the frequency components. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyAccelJerk-Mean-X
freqBodyAccelJerk-Mean-Y
freqBodyAccelJerk-Mean-Z
	Frequency Body Linear Acceleration Jerk Mean. This is frequency domain measure of the mean of Body Linear Acceleration Jerk, derived by applying a Fast Fourier Transform (FFT) to the signal (from accelerometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyAccelJerk-StdDev-X
freqBodyAccelJerk-StdDev-Y
freqBodyAccelJerk-StdDev-Z
	Frequency Body Linear Acceleration Jerk Standard Deviation. This is frequency domain measure of the standard deviation of Body Linear Acceleration Jerk, derived by applying a Fast Fourier Transform (FFT) to the signal (from accelerometer). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyAccelJerk-MeanFreq-X
freqBodyAccelJerk-MeanFreq-Y
freqBodyAccelJerk-MeanFreq-Z
	Frequency Body Linear Acceleration Jerk Mean Frequency. This frequency domain measure of mean frequency was obtained by taking a weighted average of the frequency components. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyVelo-Mean-X
freqBodyVelo-Mean-Y
freqBodyVelo-Mean-Z
	Frequency Body Angular Velocity Mean. This is frequency domain measure of the mean of Body Angular Velocity, derived by applying a Fast Fourier Transform (FFT) to the signal (from Gyroscope). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyVelo-StdDev-X
freqBodyVelo-StdDev-Y
freqBodyVelo-StdDev-Z
	Frequency Body Angular Velocity Standard Deviation. This is frequency domain measure of the standard deviation of Body Angular Velocity, derived by applying a Fast Fourier Transform (FFT) to the signal (from Gyroscope). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

freqBodyVelo-MeanFreq-X
freqBodyVelo-MeanFreq-Y
freqBodyVelo-MeanFreq-Z
	Frequency Body Angular Velocity Mean Frequency. This frequency domain measure of mean frequency was obtained by taking a weighted average of the frequency components.

freqBodyAccelMagn-Mean
	Mean of Frequency Body Linear Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyAccelMagn-StdDev
	Standard Deviation of Frequency Body Linear Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyAccelMagn-MeanFreq
	Mean Frequency of Frequency Body Linear Acceleration Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyAccelJerkMagn-Mean
	Mean of Frequency Body Linear Acceleration Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyAccelJerkMagn-StdDev
	Standard Deviation of Frequency Body Linear Acceleration Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyAccelJerkMagn-MeanFreq
	Mean Frequency of Frequency Body Linear Acceleration Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyVeloMagn-Mean
	Mean of Frequency Body Angular Velocity Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyVeloMagn-StdDev
	Standard Deviation of Frequency Body Angular Velocity Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyVeloMagn-MeanFreq
	Mean Frequency of Frequency Body Angular Velocity Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyVeloJerkMagn-Mean
	Mean of Frequency Body Angular Velocity Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyVeloJerkMagn-StdDev
	Standard Deviation of Frequency Body Angular Velocity Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.

freqBodyVeloJerkMagn-MeanFreq
	Mean Frequency of Frequency Body Angular Velocity Jerk Magnitude. The magnitude of the three-dimensional signals were calculated using the Euclidean norm.