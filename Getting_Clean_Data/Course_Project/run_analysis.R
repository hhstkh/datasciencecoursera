
# Get and clean data


function run_analysis() {
  # Read features.txt
  features <- read.table("features.txt")
  # Convert to name
  listOfNames <- make.names(features[,2], unique = T)
  # Find element contain mean or std
  measurements <- grep("mean[^Freq]|std", listOfNames)
  # Read train data
  trainXData <- read.table("train/X_train.txt")
  trainXData <- trainXData[, measurements]
  trainYData <- read.table("train/y_train.txt")
  subjectTrainData <- read.table("train/subject_train.txt")
  # Merge train data into one
  trainData <- cbind(subjectTrainData, trainYData, trainXData)
  # Read test data
  testXData <- read.table("test/X_test.txt")
  testXData <- testXData[, measurements]
  testYData <- read.table("test/y_test.txt")
  subjectTestData <- read.table("test/subject_test.txt")
  # Merge test data into one
  testData <- cbind(subjectTestData, testYData, testXData)
  # Merge train and test into XYData
  XYData <- rbind(trainData, testData)
  # set names for XYData
  names(XYData) <- c("subject", "activity", listOfNames[measurements])
  # Read activity
  label_activity <- read.table("activity_labels.txt")
  # set names for activity
  names(label_activity) <- c("activity", "description")
  # Merge XYData and activity to know relation XYData and activity clearly
  finalData <- merge(label_activity, XYData, by = "activity")
  # Remove redundant activity column, because this column is numberic is not meaningful
  finalData <- finalData[, 2:69]
  
  finalData <- aggregate(.~ subject + description, finalData, mean)
}




