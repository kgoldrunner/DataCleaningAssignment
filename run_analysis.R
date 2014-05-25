# Data Cleaning - Assignment 1
C:\Users\Kevin\Documents\myR\Assignments\DataCleaning\Assignment1\DataCleaningAssignment
setwd("C:/Users/Kevin/Documents/myR/Assignments/DataCleaning/Assignment1/DataCleaningAssignment/")

#1. Merge the training and the test sets to create one data set.

features<-read.csv("UCI HAR Dataset/features.txt", sep = " ")
xtest<-read.csv("UCI HAR Dataset/test/X_test.txt", sep = " ")
xtrain<-read.csv("UCI HAR Dataset/train/X_train.txt", sep = " ")
xmerge<-merge(xtest,xtrain,by.x="X",by.y="X")
xmelt<-melt(features,id=features[1,],measure.vars=xmerge)

#2. Extract only the measurements on the mean and standard deviation for each measurement. 
xmean<-dcast(xmelt, mean~variable)
xstd<-dcast(xmelt, std~variable)

#3. Use descriptive activity names to name the activities in the data set
xmsmelt<-melt(xmean,id=xmean[1,],measure.vars=xstd)

#4. Appropriately label the data set with descriptive activity names. 
xmsmelt #mean and std deviation

#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
xtestavg<-colMeans(is.na(xtest))
xtrainavg<-colMeans(is.na(xtest))
xfinal<-merge(xtestavg,xtrainavg,by.x="X",by.y="X")
write.csv(xfinal,"xfinal.txt")

