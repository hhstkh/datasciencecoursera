
features <- read.table("features.txt")

listOfNames <- make.names(features[,2], unique = T)

measurements <- grep("mean[^Freq]|std", listOfNames)

trainXData <- read.table("train/X_train.txt")

trainXData <- trainXData[, measurements]

trainYData <- read.table("train/y_train.txt")

subjectTrainData <- read.table("train/subject_train.txt")

trainData <- cbind(subjectTrainData, trainYData, trainXData)

testXData <- read.table("test/X_test.txt")

testXData <- testXData[, measurements]

testYData <- read.table("test/y_test.txt")

subjectTestData <- read.table("test/subject_test.txt")

testData <- cbind(subjectTestData, testYData, testXData)

allData <- rbind(trainData, testData)

names(allData) <- c("subject", "activity", listOfNames[measurements])

label_activity <- read.table("activity_labels.txt")

names(label_activity) <- c("activity", "description")

finalData <- merge(label_activity, allData, by = "activity")

finalData <- finalData[, 2:69]

finalData <- aggregate(.~ subject + description, finalData, mean)

