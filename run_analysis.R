#1.0##download files from the web and check if the required directory exists

if(!file.exists("data")){
  dir.create("data")
}
     #1.1##download the Data set

fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", mode = 'wb')


      #1.2##unzip the downlaoded dataset
unzip(zipfile =  "./data/Dataset.zip", exdir = "./data")

      #1.3##create a file path to the dataset
data_path<- file.path("C:/Users/MARIERA.MOCHOGE/Documents/data/data/UCI HAR Dataset")

files <- list.files(data_path, recursive = TRUE)


    #1.4##read files  contained in the unzipped file
       #1.4.1##read test files
xtest<- read.table(file.path(data_path, "test","X_test.txt"),header = FALSE)
ytest<- read.table(file.path(data_path, "test","Y_test.txt"), header = FALSE)
subtest<- read.table(file.path(data_path,"test", "subject_test.txt" ), header = FALSE)

    #1.4.2##read train files
xtrain<- read.table(file.path(data_path, "train","X_train.txt"), header = FALSE)
ytrain<- read.table(file.path(data_path, "train","Y_train.txt"), header = FALSE)
subtrain<- read.table(file.path(data_path, "train","subject_train.txt"), header = FALSE)

    #1.4.3##read features and actuivity files
Features<- read.table(file.path(data_path, "features.txt"))
Activitylabels<- read.table(file.path(data_path,"activity_labels.txt"))

#1.5##create the correct tags for the dataset- column names

colnames(xtest)<- Features[,2]
colnames(ytest)<- "id_activity"
colnames(subtest)<- "id_subject"

colnames(xtrain)<- Features[,2]
colnames(ytrain)<- "id_activity"
colnames(subtrain)<- "id_subject"

colnames(Activitylabels)<- c("id_activity","ActivityType")

#2.0##merging all data sets into one

Train_merge <- cbind(xtrain,ytrain,subtrain)
Test_merge<- cbind(xtest, ytest, subtest)
Test_Train_merge<- rbind(Train_merge,Test_merge)

#3.0##Extracting only the measurements on mean
      ##and standard deviation for each measurement
       ##read column names of the merged data set
col_Names<- colnames(Test_Train_merge)
#3.1##subset all the mean and sd and
    ##their corresponding id_activity and id_subject
mean_sd<- as.numeric(grepl("id_activity", col_Names)|
          grepl("id_subject", col_Names)
          |grepl("mean..", col_Names)
          |grepl("std...", col_Names))
#4.0##subset what is needed

Data_mean_sd<- Test_Train_merge[ , mean_sd == TRUE]

#4.1##Use descriptive activity names to name the activities in the data set

Desc_activity_names<- merge(Data_mean_sd, Activitylabels,
                      by = "id_activity",
                      all.x = TRUE)
#4.2##create anew data set

Tidy_data <-aggregate(Desc_activity_names,
            by=list(Desc_activity_names$id_subject,
             Desc_activity_names$id_activity),FUN = mean)

Tidy_data<- Tidy_data[order(Tidy_data$id_subject,Tidy_data$id_activity),]

#5.0##write a new data set

write.table(Tidy_data, "Tidy_data.txt", row.names = FALSE)












              