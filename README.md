## Coursera JHU Programming Assignment - Getting And Cleaning Data


You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
   each variable for each activity and each subject.


Merged Data Sizes
activity - 6 rows x 2 columns, first column is id
features - 561 rows x 3 columns (make this into 4 columns)
rawData - 10299 rows x 561 columns (where the columns correspond to the rows in features table) observations
labelData - 10299 rows x 1 column (where the labels correspond to activity id)
subjectData - 10299 rows x 1 column (where the labels correspond to activity id)

Cleaning the data sets

2. Features - 561 rows x 4 columns (id, signal, calcType, axis)
