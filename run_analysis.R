library(dplyr)

#prepare the files data directories
DataDir <- "./data/UCI HAR Dataset"


#Merges the training and the test sets to create one data set
mergeFunc <- function(testData, trainData,newName)
{
  #dtTestFile <- data.table(read.table(testData, header = FALSE))  # load the test data to a data table
  #dtTrainFile <- data.table(read.table(trainData, header = FALSE)) # load the train data to a data table
  mergedData <- rbind(testData, trainData)      # merge both data tables with repect to the rows
 
  return(mergedData)
  
}

#Merge all datasets and extracts only the measurements on the mean and standard deviation for each measurement

mergeAllData <- function(col1, col2)
{
  mergeAll<- cbind (mergeFunc(X_testData,X_trainData),mergeFunc(Y_testData,Y_trainData),
                    mergeFunc(Subject_testData,Subject_trainData)) %>%
                    select(matches("mean|std"), one_of(col1, col2))
  return(mergeAll)
}


#Uses descriptive activity names to name the activities in the data set

describeActivity <- function(ActivityDataFile) 
  {
  ActivityData <- data.table(read.table(ActivityDataFile, header = FALSE)) 
  features <- fread(file.path(DataDir, "features.txt"))
  col_names <- gsub("-", "_", features$V2)
  col_names <- gsub("[^a-zA-Z\\d_]", "", col_names)
  names(ActivityData) <- make.names(names = col_names, unique = TRUE, allow_ = TRUE)
  ActivityData
}
#Appropriately labels the data set with descriptive variable names
describeLabels <- function(LabelsDataFile) {
  LabelData <- data.table(read.table(LabelsDataFile, header = FALSE)) 
  activityLabel <- fread(file.path(DataDir, "activity_labels.txt"))
  names(LabelData) <- "Activity"  
  LabelData$Activity <- factor(LabelData$Activity, levels = activityLabel$V1, labels = activityLabel$V2)
  LabelData
}

describeSubject <- function(SubjectDataFile) {
  SubjectData <- data.table(read.table(SubjectDataFile, header = FALSE)) 
  names(SubjectData) <- "Subject"
  SubjectData
}


# creating a second, independent tidy data set with the average of each variable for each activity and each subject
CreateTidyDS <- function(Subj, Act, mrgdData)
{
 
  tidy_data <- melt(mrgdData, id = c(Subj, Act), measure.vars = setdiff(colnames(mrgdData), c(Subj, Act))) %>%
  dcast(Subject + Activity ~ variable, mean)
  
  write.table(tidy_data, file = "tidy_data.txt", sep = ",", row.names = FALSE)
}

# call the main function
main <- function()
{
  Subject_testData <- paste0(DataDir,"/test/subject_test.txt")  %>% describeSubject    #the path of the subject testing data file 
                                                 
  Subject_trainData <- paste0(DataDir,"/train/subject_train.txt") %>% describeSubject  #the path of the subject training data file 
  
  X_testData <- paste0(DataDir,"/test/X_test.txt")  %>%  describeActivity              #the path of the X testing data file
  
  X_trainData <- paste0(DataDir,"/train/X_train.txt") %>%  describeActivity            #the path of the X training data file
  
  Y_testData <- paste0(DataDir,"/test/Y_test.txt") %>% describeLabels                  #the path of the Y testing data file
  
  Y_trainData <- paste0(DataDir,"/train/Y_train.txt")  %>% describeLabels              #the path of the Y training data file
  
  
  mds <- mergeAllData("Subject","Activity")
  
  CreateTidyDS ("Subject","Activity",mds)
  
}
