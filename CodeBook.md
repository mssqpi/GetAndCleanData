## CodeBook

In this document we will explain  variables, the data, and  transformations of our work that we performed to clean up the data.

### Variables and Dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)wearing a smartphone (Samsung Galaxy S II) on the waist.
This dataset has been divided into two groups:

	- Training dataset, which contains all labeled data. 
	- Testing dataset that should be used later in the experiment.
both of these datasets are stored in text files format along with several helping documents such as: 

	- "features_info.txt": Shows information about the variables used on the feature vector.
	- "features.txt": List of all features.
	- "activity_labels.txt": Links the class labels with their activity name.

For each record it is provided:

	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.
All Variables for the new merged dataset:

	- mds <- mergeAllData("Subject","Activity")
	- names(mds)

[1] "tBodyAcc_mean_X"                   "tBodyAcc_mean_Y"                   "tBodyAcc_mean_Z"                   "tBodyAcc_std_X"                   
 [5] "tBodyAcc_std_Y"                    "tBodyAcc_std_Z"                    "tGravityAcc_mean_X"                "tGravityAcc_mean_Y"               
 [9] "tGravityAcc_mean_Z"                "tGravityAcc_std_X"                 "tGravityAcc_std_Y"                 "tGravityAcc_std_Z"                
[13] "tBodyAccJerk_mean_X"               "tBodyAccJerk_mean_Y"               "tBodyAccJerk_mean_Z"               "tBodyAccJerk_std_X"               
[17] "tBodyAccJerk_std_Y"                "tBodyAccJerk_std_Z"                "tBodyGyro_mean_X"                  "tBodyGyro_mean_Y"                 
[21] "tBodyGyro_mean_Z"                  "tBodyGyro_std_X"                   "tBodyGyro_std_Y"                   "tBodyGyro_std_Z"                  
[25] "tBodyGyroJerk_mean_X"              "tBodyGyroJerk_mean_Y"              "tBodyGyroJerk_mean_Z"              "tBodyGyroJerk_std_X"              
[29] "tBodyGyroJerk_std_Y"               "tBodyGyroJerk_std_Z"               "tBodyAccMag_mean"                  "tBodyAccMag_std"                  
[33] "tGravityAccMag_mean"               "tGravityAccMag_std"                "tBodyAccJerkMag_mean"              "tBodyAccJerkMag_std"              
[37] "tBodyGyroMag_mean"                 "tBodyGyroMag_std"                  "tBodyGyroJerkMag_mean"             "tBodyGyroJerkMag_std"             
[41] "fBodyAcc_mean_X"                   "fBodyAcc_mean_Y"                   "fBodyAcc_mean_Z"                   "fBodyAcc_std_X"                   
[45] "fBodyAcc_std_Y"                    "fBodyAcc_std_Z"                    "fBodyAcc_meanFreq_X"               "fBodyAcc_meanFreq_Y"              
[49] "fBodyAcc_meanFreq_Z"               "fBodyAccJerk_mean_X"               "fBodyAccJerk_mean_Y"               "fBodyAccJerk_mean_Z"              
[53] "fBodyAccJerk_std_X"                "fBodyAccJerk_std_Y"                "fBodyAccJerk_std_Z"                "fBodyAccJerk_meanFreq_X"          
[57] "fBodyAccJerk_meanFreq_Y"           "fBodyAccJerk_meanFreq_Z"           "fBodyGyro_mean_X"                  "fBodyGyro_mean_Y"                 
[61] "fBodyGyro_mean_Z"                  "fBodyGyro_std_X"                   "fBodyGyro_std_Y"                   "fBodyGyro_std_Z"                  
[65] "fBodyGyro_meanFreq_X"              "fBodyGyro_meanFreq_Y"              "fBodyGyro_meanFreq_Z"              "fBodyAccMag_mean"                 
[69] "fBodyAccMag_std"                   "fBodyAccMag_meanFreq"              "fBodyBodyAccJerkMag_mean"          "fBodyBodyAccJerkMag_std"          
[73] "fBodyBodyAccJerkMag_meanFreq"      "fBodyBodyGyroMag_mean"             "fBodyBodyGyroMag_std"              "fBodyBodyGyroMag_meanFreq"        
[77] "fBodyBodyGyroJerkMag_mean"         "fBodyBodyGyroJerkMag_std"          "fBodyBodyGyroJerkMag_meanFreq"     "angletBodyAccMeangravity"         
[81] "angletBodyAccJerkMeangravityMean"  "angletBodyGyroMeangravityMean"     "angletBodyGyroJerkMeangravityMean" "angleXgravityMean"                
[85] "angleYgravityMean"                 "angleZgravityMean"                 "Subject"                           "Activity"


### Transformations (Geting and Cleaning Up data): 
 1. first we start downloading the dataset as follows:
	url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	df <- "Dataset.zip"
	download.file(url, df)
 2. we unzip the dataset file using: unzip(df)
 
 3. we prepared the files data directories: DataDir <- "./data/UCI HAR Dataset" and we load each file into a datafile variable.
 4. we have go through the columns of each file and labled them, because the orginal files have no labels(headers).
 5. we build a merging function that take two variables (testData, trainData) and  return a merged dataset.
 6. Merge all datasets and extracts only the measurements on the mean and standard deviation for each measurement as required. The merge here was with respect to the columns since we are merging calsses with data
 7. we created a new dataset from the merged one. we called it tidy_data which take data with mean and Std features only.
 8. we dump the tidy_data into a text format file.
 
 
 
  
