---
title: "README"
author: "Ojustwin Naik"
date: "July 26, 2015"
output: md_document
---

#BACKGROUND

This file describes how the the script run_analysis.R can be used consume the data files provided by a separate wearable computing study ('Human Activity Recognition Using Smartphones Dataset Version 1.0' by: Jorge L. Reyes-Ortiz, et al.) as input and generate an independent tidy data set which summarizes the average of only mean and standard deviation variables for each activity and each subject. The sumarized data text file output meets the principles of tidy data.  For more on principles of tidy data used, please see: <https://github.com/jtleek/datasharing> and <https://class.coursera.org/getdata-030/forum/thread?thread_id=107>.   

For data dictionary please see codebook.txt.

#ENVIRONMENT

System Requirements

It should be possible to use the script on multiple system configurations but it was only tested (built) on one configuration.

Script was built with the following system configuration:
Lenovo Thinkpad Windows 7 64 bit OS
RStudio Version 0.99.463
R x64 3.2.1

#USING THE SCRIPT

##INPUT DATA
The input data can be downloaded from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Input Data files are included in the data folder named 'UCI HAR Dataset'.

The input data files operated upon by the script include
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The following Input Files though included in the original study data files are **NOT** Used by the script in generating the final tidy dataset.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##INVOKING SCRIPT:
*Place the script in the same parent folder as where the input data folder 'UCI HAR Dataset' resides.
*Set the working directory in R to be the same parent folder as where the input data folder 'UCI HAR Dataset' resides.
*Ensure that the following package is loaded in R : 'dplyr'.

Invoke the script in R by using command:
```{r}
source('run_analysis.r')
```
##OUTPUT DATA
The script creates a tidy dataset named HAR_summary_mean which is also written out as a text file "HAR_summary_mean.txt".

#SCRIPT PROCESS LOGIC

1.Read in reference files
2.Read in Training files X, Y, subject_train
3.Read in Test files X, Y, subject_train
4.Change Training Labels
5.Change Test Labels
6.Bind Column Data Sets Together
7.Bind training and test data sets together
8.Make column names unique on full dataset
9.Extract only measurements for mean and std from full data set
10.Convert Activity nums to activity labels
11.Rename variables in activity_labels file
12.Join full data set with activity_names data set to get activity names
13.Remove activity column to avoid duplicate columns
14.Remove anglular measurement columns
15.Move ActivityName Column after Subject
16.Make descriptive variable names
17.Tidy data set created with the average of each variable for each activity and each subject
18.Remove working tables
19.Write text file out
