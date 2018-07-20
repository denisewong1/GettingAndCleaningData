library(dplyr)


## Read activity labels and features
feature = read.csv("features.txt",sep="", header=FALSE)        
activity = read.csv("activity_labels.txt",sep="",header=FALSE)
        
## Read/merge signal measurements
dataTest <- read.csv("test/X_test.txt",sep="",header=FALSE)
dataTrain <- read.csv("train/X_train.txt",sep="",header=FALSE)
signals <- rbind(dataTrain, dataTest)

## Read/merge labels
labelTest <- read.csv("test/Y_test.txt",sep="",header=FALSE)
labelTrain <- read.csv("train/Y_train.txt",sep="",header=FALSE)
label <- rbind(labelTrain, labelTest) 
        
## Read/merge subject id
subjectTest <- read.csv("test/subject_test.txt",sep="",header=FALSE)
subjectTrain <- read.csv("train/subject_train.txt",sep="",header=FALSE)
subject <- rbind(subjectTrain, subjectTest)        
        
## Add descriptive headers for data frames
names(feature) <- c("id","desc")
names(activity) <- c("id","desc")
names(signals) <- feature$desc
names(label) <- "id"
names(subject) <- "id"
        
## Look up descriptive names for activity
label <- mutate(label, desc = activity$desc[match(label$id,activity$id)])

## Extracts column names for mean and std dev
useSignal = grepl("std|mean",feature$desc)
tidyData <- cbind(subject$id, label$desc, signals[useSignal])
        
## Add descriptive names for tidyData
names(tidyData) <- c("subject","activity",names(signals[useSignal]))

## Summarise results by subject and activity
results <- tidyData %>%
        group_by(subject, activity) %>%
        summarize_all(funs(mean)) 
        
## Write output data to a file
write.table(results,"results.txt", row.names = FALSE)
