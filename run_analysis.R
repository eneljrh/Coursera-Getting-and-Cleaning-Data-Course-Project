
## Activate directory
setwd("C://....put your directory")

##We must have the zip file already extracted in the active directory 

##Init variables and codebook
pk <- c()
codebookFichero <- "./CodeBook.md"
if (file.exists(codebookFichero )){
  file.remove(codebookFichero )
}

##Prepare a function for codebook


escribir <- function(...){
  cat(..., "\n",file=codebookFichero ,append=TRUE, sep="")
}



escribir("# Code Book")
escribir("")  


##PUNTO 1
# Merges the training and the test sets to create one data set.

escribir("# We must have the zip file already extracted in the active directory ")


##We read the tables associated to train
escribir("# Read the tree files associated to train in variables 'subjectTrain','xTrain' and 'yTrain'  respectively.")
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)


##We read the tables associated to test
escribir("# Read the tree files associated to test in variables 'subjectTest','xTest', 'yTest'  respectively.")
subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

##Merge  subjects tables and add an appropiated col name
escribir("# Merge the subject tables in variable:**'subject'** , change colname to 'subject', and add it to variable **'pk'** ")
subject <- rbind(subjectTest, subjectTrain)
names(subject) <- c("subject")
pk <- union(pk , names(subject))

##Merge  train tables and add an appropiated col name using the list of features 
escribir("# Merge the x tables in variable:**'xdata'** and change colnames using text indicated in file features.txt")
xdata <- rbind(xTest , xTrain)
features = read.table('./features.txt')
featuresColumns <- features$V2
names(xdata) <- featuresColumns 

  

##Merge activities tables and add an appropiated col name
escribir("# Merge the y tables associated to activity in variable:**'ydata'** , change colname to 'activity' , and add it to variable **'pk'**")
ydata <- rbind(yTest , yTrain)
names(ydata ) <- c("activity")
pk <- union(pk , names(ydata))

##Combine all 3 tables in 1
escribir("# Combine 'subject', 'xdata' and 'ydata' in one variable dataset **'allData'** ")

allData <- cbind(subject , ydata)
allData <- cbind(allData, xdata)


##PUNTO 2
#Extract only the measurements on the mean and standard deviation for each measurement. 

escribir("# Extract only the measurements on the mean and standard deviation for each measurement, from 'allData' to new variable: **'allData.meanstd'**, mantenining pk columns ")



##Find features columns associated with mean and std
meanStdColumns <- featuresColumns[grepl("(mean|std)\\(\\)",featuresColumns)]
##complete with the primary key of the global table
subSetColumns <- union(pk, meanStdColumns)
##Subset the global table only with pk and mean/std columns
allData.meanstd <- allData[,subSetColumns]


##PUNTO 3
#Uses descriptive activity names to name the activities in the data set 

##Read activities texts
activityTexts = read.table('./activity_labels.txt', header = FALSE)

##Assign a text instead of an activity code

escribir("# On dataset **'allData.meanstd'**,  substitute the code value activity by its text value, indicated in file 'activity_labels.txt'")



allData.meanstd$activity  <- as.character(allData.meanstd$activity)
for (i in 1:6){
allData.meanstd$activity[allData.meanstd$activity == i] <- as.character(activityTexts[i,2])
}

##create a new associated factor to the activity  
allData.meanstd$activity <- as.factor(allData.meanstd$activity)

##PUNTO 4
#Appropriately labels the data set with descriptive variable names. 


##Associate descriptive name to the columns, by an abbreviature substitution

escribir("# On dataset **'allData.meanstd'**, associate a descriptive text to their columns, based on previous inspection of their values")




names(allData.meanstd)<-gsub("BodyBody","Body", names(allData.meanstd))
names(allData.meanstd)<-gsub("^t", "Time",names(allData.meanstd))
names(allData.meanstd)<-gsub("^f","Frequency", names(allData.meanstd))
names(allData.meanstd)<-gsub("tBody","TimeBody", names(allData.meanstd))
names(allData.meanstd)<-gsub("-mean()", "Mean", names(allData.meanstd), ignore.case = TRUE)
names(allData.meanstd)<-gsub("-std()", "Std", names(allData.meanstd), ignore.case = TRUE)
names(allData.meanstd)<-gsub("-freq()", "Frequency", names(allData.meanstd), ignore.case = TRUE)
names(allData.meanstd)<-gsub("angle","Angle", names(allData.meanstd))
names(allData.meanstd)<-gsub("gravity", "Gravity", names(allData.meanstd))
names(allData.meanstd)<-gsub("Mag", "Magnitude", names(allData.meanstd))
names(allData.meanstd)<-gsub("Gyro", "Gyroscope", names(allData.meanstd))
names(allData.meanstd)<-gsub("Acc", "Accelerometer", names(allData.meanstd))

##PUNTO 5
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


allData.meanstd$subject <- as.factor(allData.meanstd$subject)

escribir("# Aggregate mean values of 'allData.meanstd' by subject,activity,  in a the new variable dataset: **'allData.meanstd.tidyData'** and send its values to file:'FinalFile.txt'")

##Aggregate by subject / activity with function mean
allData.meanstd.tidyData <- aggregate(. ~subject + activity, allData.meanstd, mean)

##We ensure that we order dataset by subject and activity
allData.meanstd.tidyData<- allData.meanstd.tidyData[order(allData.meanstd.tidyData$subject,allData.meanstd.tidyData$activity),]

##Send to a file
write.table(allData.meanstd.tidyData, file = "FinalFile.txt", row.names = FALSE)

##Explanation of the fields of the final dataset
escribir("")
escribir("")
escribir("")
escribir("")
escribir("")
escribir("")

escribir("### Fields for every subject / activity")
escribir("# Field                       -  Description of field")
escribir("______________________________________")
Fields <- names(allData.meanstd.tidyData)[3:68]
for(tdc in Fields ){
  escribir(paste("# ", tdc,"   -  Mean value of this field for the subject/activity considered "))
}
