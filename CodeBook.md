##CodeBook

In this document we will explain  variables, the data, and  transformations of our work that we performed to clean up the data.

##Variables and Dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)wearing a smartphone (Samsung Galaxy S II) on the waist.
This dataset has been divided into two groups:
	1- Training dataset, which contains all labeled data. 
	2- Testing dataset that should be used later in the experiment.
both of these datasets are stored in text files format along with several helping documents such as: 
	1- "features_info.txt": Shows information about the variables used on the feature vector.
	2- "features.txt": List of all features.
	3- "activity_labels.txt": Links the class labels with their activity name.
 
 
##Geting and Cleaning Up: 
 1- first we start downloading the dataset as follows:
	url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	df <- "Dataset.zip"
	download.file(url, df)
 2- we unzip the dataset file using: unzip(df)
 
 3- we prepared the files data directories: DataDir <- "./data/UCI HAR Dataset" and we load each file into a datafile variable.
 4- we have go through the columns of each file and labled them, because the orginal files have no labels(headers).
 5- we build a merging function that take two variables (testData, trainData) and  return a merged dataset.
 6- Merge all datasets and extracts only the measurements on the mean and standard deviation for each measurement as required. The merge here was with respect to the columns since we are merging calsses with data
 7- we created a new dataset from the merged one. we called it tidy_data which take data with mean and Std features only.
 8- we dump the tidy_data into a text format file.
 
 
 
  
