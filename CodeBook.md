# Code Book

# We must have the zip file already extracted in the active directory 
# Read the tree files associated to train
# Read the tree files associated to test
# Merge the subject tables in variable:**'subject'** , change colname to 'subject', and add it to variable **'pk'** 
# Merge the x tables in variable:**'xdata'** and change colnames using text indicated in file features.txt
# Merge the y tables associated to activity in variable:**'ydata'** , change colname to 'activity' , and add it to variable **'pk'**
# Combine 'subject', 'xdata' and 'ydata' in one variable dataset **'allData'** 
# Extract only the measurements on the mean and standard deviation for each measurement, from 'allData' to new variable: **'allData.meanstd'**, mantenining pk columns 
On dataset **'allData.meanstd'**,  substitute the code value activity by its text value, indicated in file 'activity_labels.txt'
On dataset **'allData.meanstd'**, associate a descriptive text to their columns, based on previous inspection of their values
Aggregate mean values of 'allData.meanstd' by subject,activity,  in a the new variable dataset: **'allData.meanstd.tidyData'** and send its values to file:'FinalFile.txt'

### Fields for every subject / activity
Field                       -  Description of field
______________________________________
TimeBodyAccelerometerMean()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerMean()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerMean()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerStd()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerStd()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerStd()-Z    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerMean()-X    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerMean()-Y    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerMean()-Z    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerStd()-X    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerStd()-Y    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerStd()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkMean()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkMean()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkMean()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkStd()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkStd()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkStd()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeMean()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeMean()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeMean()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeStd()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeStd()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeStd()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkMean()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkMean()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkMean()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkStd()-X    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkStd()-Y    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkStd()-Z    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
TimeGravityAccelerometerMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
TimeBodyAccelerometerJerkMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
TimeBodyGyroscopeJerkMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerMean()-X    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerMean()-Y    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerMean()-Z    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerStd()-X    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerStd()-Y    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerStd()-Z    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkMean()-X    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkMean()-Y    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkMean()-Z    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkStd()-X    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkStd()-Y    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkStd()-Z    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeMean()-X    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeMean()-Y    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeMean()-Z    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeStd()-X    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeStd()-Y    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeStd()-Z    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyAccelerometerJerkMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeJerkMagnitudeMean()    -  Mean value of this field for the subject/activity considered 
FrequencyBodyGyroscopeJerkMagnitudeStd()    -  Mean value of this field for the subject/activity considered 
