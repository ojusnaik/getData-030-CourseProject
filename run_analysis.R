

#Read in reference files
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#Read in Training files X, Y, subject_train
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Read in Test files X, Y, subject_train
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Change Training Labels
names(x_train) <- features$V2
colnames(y_train)[1] <- "activity"
colnames(subject_train)[1] <- "subject"

#Change Test Labels
names(x_test) <- features$V2
colnames(y_test)[1] <- "activity"
colnames(subject_test)[1] <- "subject"

#Bind Column Data Sets Together
z_train <- cbind(subject_train, y_train, x_train)
z_test <- cbind(subject_test, y_test, x_test)

#Bind training and test data sets together
z_full <- rbind(z_train, z_test)

#Make column names unique on full dataset
unique_column_names <- make.unique(names=names(z_full), sep = ".")
names(z_full) <- unique_column_names

#Extract only measurements for mean and std from full data set
z_filtered <- select(z_full, matches("mean|std|subject|activity"))


#Convert Activity nums to activity labels
  #Rename variables in activity_labels file
colnames(activity_labels)[1] <- "activity"
colnames(activity_labels)[2] <- "activityName"

# join data sets to get activity names
z_joined  <- inner_join(z_filtered, activity_labels, by = "activity") 

#remove activity to avoid duplicate columns
z_joined <- select(z_joined, -activity)

#remove angle measurement columns
z_joined <- z_joined[, -grep("angle", colnames(z_joined))]

# move ActivityName Column after Subject
z_reordered <- select(z_joined, subject, activityName, everything())


#make descriptive variable names
z_cleanNames <- z_reordered

names(z_cleanNames) <- gsub("tBody","body", names(z_cleanNames))
names(z_cleanNames) <- gsub("tGravity","gravity", names(z_cleanNames))
names(z_cleanNames) <- gsub("fBody","freqBody", names(z_cleanNames))
names(z_cleanNames) <- gsub("Acc","Accel", names(z_cleanNames))
names(z_cleanNames) <- gsub("Gyro","Velo", names(z_cleanNames))
names(z_cleanNames) <- gsub("Mag","Magn", names(z_cleanNames))
names(z_cleanNames) <- gsub("\\(|\\)","", names(z_cleanNames))
names(z_cleanNames) <- gsub("mean","Mean", names(z_cleanNames))
names(z_cleanNames) <- gsub("std","StdDev", names(z_cleanNames))
names(z_cleanNames) <- gsub("meanFreq","MeanFreq", names(z_cleanNames))
names(z_cleanNames) <- gsub("angle","angle_", names(z_cleanNames))
names(z_cleanNames) <- gsub("\\,","_", names(z_cleanNames))
names(z_cleanNames) <- gsub("BodyBody","Body", names(z_cleanNames))

z_tidy <- z_cleanNames


#tidy data set with the average of each variable for each activity and each subject

z_final <- z_tidy %>% group_by(subject, activityName) %>% summarise_each(funs(mean)) %>% arrange(subject, activityName)

HAR_summary_mean <- z_final

#remove working tables
rm(z_final, z_tidy, z_cleanNames, z_reordered, z_joined, z_filtered, z_full, z_test, z_train, y_train, y_test, x_train, x_test, subject_train, subject_test, features, activity_labels, unique_column_names)

#Write text file out
write.table(HAR_summary_mean, file = "HAR_summary_mean.txt", row.names = FALSE)
