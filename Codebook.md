# Codebook for the project

##source data
This is a Human Activity Recognition Using Smartphones Dataset.

experiments have been carried out with a group of 30volunteers within an age baracket of 19-48 years.Each person performed six activities that included; *WALKING*,*WALKING_UPSTAIRS*,*WALKING_DOWNSTAIRS*,*SITTING*,*STANDING* and *LAYING* while wearing a smartphone(samsung Galaxy) om their waist.
 a full description can be found on this site, [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] and the data for the project [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]


##The run_analysis.R script
#1.0.setting working directory and downloading the Data set
 a)determines if the intended directory is in place.
  #1.1...download the file from the link provided
  #1.2...unzip the downloaded dataset
  #1.3...create a file path to the dataset
  #1.4...read files  contained in the unzipped file
       #1.4.1...read test files
  #1.4.2...read train files
   #1.4.3...read features and activity files
   #1.5...create the correct tags for the dataset- column names
   
#2.0##merging all data sets into one

#3.0##Extracting only the measurements on mean
      and standard deviation for each measurement
       read column names of the merged data set
#3.1##subset all the mean and sd and
       their corresponding id_activity and id_subject.
#4.0##subset what is needed.

#4.1##Use descriptive activity names to name the activities in the data set.
#4.2##create anew data set.

#5.0##write a new data set.
  
  
  
  
  
  
  
  
  
