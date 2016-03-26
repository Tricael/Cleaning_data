##cleaning
#setwd() #set your working directory
library(dplyr)
library(tidyr)
#For Test
test.test_subject<-tbl_df(read.table("UCI HAR Dataset\\test\\subject_test.txt"))
test.x_data<-tbl_df(read.table("UCI HAR Dataset\\test\\X_test.txt"))
test.activity<-tbl_df(read.table("UCI HAR Dataset\\test\\y_test.txt"))
test.activitylist<-tbl_df(read.table("UCI HAR Dataset\\activity_labels.txt",stringsAsFactors = FALSE))
test.features<-tbl_df(read.table("UCI HAR Dataset\\features.txt",stringsAsFactors = FALSE))
#For Train
train.test_subject<-tbl_df(read.table("UCI HAR Dataset\\train\\subject_train.txt"))
train.x_data<-tbl_df(read.table("UCI HAR Dataset\\train\\X_train.txt"))
train.activity<-tbl_df(read.table("UCI HAR Dataset\\train\\y_train.txt"))
train.activitylist<-tbl_df(read.table("UCI HAR Dataset\\activity_labels.txt",stringsAsFactors = FALSE))
train.features<-tbl_df(read.table("UCI HAR Dataset\\features.txt",stringsAsFactors = FALSE))

#merge datasets
all_dat<-bind_rows(test.x_data,train.x_data)

#recodes the activities from numbers to variables
all_subject<-bind_rows(test.test_subject,train.test_subject)
all_activity<-bind_rows(test.activity,train.activity)
all_activity<-transmute(all_activity,activity=unlist(test.activitylist[,2])[unlist(all_activity)])
all_dat<-bind_cols(all_subject,all_activity,all_dat)
#adds variable names,cleans up variable names, and indexes the 'mean' and 'std' variables.
test.colnames<-unlist(rbind("ID","activity",test.features[,2]))
test.colnames<-gsub("-|\\(|\\)","",test.colnames) #removes - and ()
test.colnames<-gsub("Mean","",test.colnames,ignore.case = FALSE) #removes Mean but not mean
colnames(all_dat)<-test.colnames
#extract variables with mean and std in them
selector<-sort(c(1,2,grep("mean",test.colnames),grep("std",test.colnames)))
all_dat<-all_dat[,selector]

grouped.all_dat<-group_by(all_dat,ID,activity)
summary.grouped_all_dat<-summarise_each(grouped.all_dat,funs(mean))

#write.table(summary.grouped_all_dat,file = "summary.grouped_all_dat.txt", row.names = FALSE)
#uncomment above if you want to output the dataset to a text for submission....
