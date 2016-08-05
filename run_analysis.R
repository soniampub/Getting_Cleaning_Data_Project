X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

minStd_Ind <- grep(".*mean.*|.*std.*", features[,2])
minStd_Ind.names <- features[minStd_Ind,2]
minStd_Ind.names = gsub("-mean", "Mean", minStd_Ind.names)
minStd_Ind.names = gsub("-std", "Std", minStd_Ind.names)
minStd_Ind.names = gsub("\\(\\)", "", minStd_Ind.names)

trainData <- cbind(X_train[minStd_Ind], Y_train, subject_train)
testData <- cbind(X_test[minStd_Ind], Y_test, subject_test)

MergeData <- rbind(trainData, testData)
colnames(MergeData) <- c("subject", "activity", minStd_Ind.names)

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[,2] = as.character(activity[,2])

MergeData$activity <- factor(MergeData$activity, labels=activity[,2], levels=activity[,1])
MergeData$subject <- as.factor(MergeData$subject)

MergeData.melt <- melt(MergeData, id=c("subject", "activity") )
MergeData.mean <- dcast(MergeData.melt, subject + activity ~ variable, mean)
write.table(MergeData.mean, "tidy.txt", quote=FALSE, row.names=FALSE)


