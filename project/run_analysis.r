library(plyr)

# 1. Merges the training and the test sets to create one data set.
trainLabel <- read.table("./data/train/y_train.txt")
trainData <- read.table("./data/train/X_train.txt")
trainSbj <- read.table("./data/train/subject_train.txt")

testLabel <- read.table("./data/test/y_test.txt")
testData <- read.table("./data/test/X_test.txt")
testSbj <- read.table("./data/test/subject_test.txt")

labels <- rbind(trainLabel, testLabel)
data <- rbind(trainData, testData)
subject <- rbind(trainSbj, testSbj)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table('./data/features.txt')
mean_and_std <- grep("(mean|std)", features[, 2])
data <- data[, mean_and_std]
names(data) <- features[mean_and_std, 2]

# 3. Uses descriptive activity names to name the activities in the data set

activ <- read.table('./data/activity_labels.txt')
labels[, 1] <- activ[labels[, 1], 2] # from activ get label with index of labels and write
names(labels) <- "activity" # set name for labels

# 4. Appropriately labels the data set with descriptive variable names.
names(subject) <- "subject"
full <- cbind(labels, subject, data)
str(full)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
meeans <- function(data) { colMeans(data[,-c(1,2)]) }
t <- ddply(full, .(subject, activity), meeans)

write.table(t, "tidytidy.txt", row.names = FALSE)


