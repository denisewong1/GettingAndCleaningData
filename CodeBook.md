## Data Source
The database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  Accelerometer readings from the Samsung Galaxy S smartphone was used to record the data.

The data was originally sourced from ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

Research is credited to : Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2). 1 - Smartlab - Non-Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain activityrecognition '@' smartlab.ws



## Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.



## Data and Variables
The dataset was extracted from a zipped file from UCI HAR.  Information about the features is detailed in features_info.txt. Analysis was performed on the following files.

|Filename           |Description  |
|:---|:---|
|features.txt       |feature id and description of each of 561 signals measured |
|activity_labels.txt|activity id and description of each of 6 activities |
|X_train.txt        |561 signals measured for each of 7352 observations in the training set|
|y_train.txt        |activity id of each of 7352 observations in the training set|
|subject_train.txt  |subject id of participant of each of 7352 observations in the training set |
|X_test.txt         |561 signals measured for each of 2947 observations in the test set|
|y_test.txt         |activity id of each of 2947 observations in the test set|
|subject_test.txt   |subject id of participant of each of 2947 observations in the test set |

The analysis did not use the raw signal data contained in the "Inertial Signals" folder.



## Processing steps
1. Reading files into data frames
   * Data from lookup files read into ``feature`` and ``activity``. 
   * Data from training and test files in that order read and merged into a single data set for each of ``subject``, ``label`` and ``signals``. There was no missing or NA data in any of the observations.  
2. Add appropriate header names
   * Header names ``id`` and ``desc`` assigned to data frames for ``feature`` and ``activity``.
   * Header name ``id`` assigned to data frames for ``subject`` and ``label``.
   * Header names for ``signals`` assigned via lookup to ``feature`` description.
3. Manipulating the data
   * Descriptive data from ``activity`` was added via lookup of the ``id`` of ``labels`` data frame.
   * List of ``feature`` descriptions that contained the exact strings "mean" or "std" in ``feature`` was extracted into ``useSignal``.
   * ``tidyData`` subset merges the subject, activity and mean and std dev signal for all observations.  
4. Calculate mean for subset of data
   * ``results`` summary of averages of all observations for each signal was calculated for each activity and each subject.
5. Write data frame to output file ``results.txt``.


## Variables
The variables in the output tidy data set have the following names, data class, and values.
 
 | Name | Class | Range of Values |
 |:---|:---|:---|
 | $ subject                       : | int  | 1 to 30| 
 | $ activity                      : | Factor | "LAYING","SITTING", "WALKING","WALKING_DOWNSTAIRS", "WALKING UPSTAIRS", "STANDING"| 
 | $ TimeBodyAccmeanX              : | num  | 0.289 0.278 0.28 0.279 0.277 ...| 
 | $ TimeBodyAccmeanY              : | num  | -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...| 
 | $ TimeBodyAccmeanZ              : | num  | -0.133 -0.124 -0.113 -0.123 -0.115 ...| 
 | $ TimeBodyAccstdX               : | num  | -0.995 -0.998 -0.995 -0.996 -0.998 ...| 
 | $ TimeBodyAccstdY               : | num  | -0.983 -0.975 -0.967 -0.983 -0.981 ...| 
 | $ TimeBodyAccstdZ               : | num  | -0.914 -0.96 -0.979 -0.991 -0.99 ...| 
 | $ TimeGravityAccmeanX           : | num  | 0.963 0.967 0.967 0.968 0.968 ...| 
 | $ TimeGravityAccmeanY           : | num  | -0.141 -0.142 -0.142 -0.144 -0.149 ...| 
 | $ TimeGravityAccmeanZ           : | num  | 0.1154 0.1094 0.1019 0.0999 0.0945 ...| 
 | $ TimeGravityAccstdX            : | num  | -0.985 -0.997 -1 -0.997 -0.998 ...| 
 | $ TimeGravityAccstdY            : | num  | -0.982 -0.989 -0.993 -0.981 -0.988 ...| 
 | $ TimeGravityAccstdZ            : | num  | -0.878 -0.932 -0.993 -0.978 -0.979 ...| 
 | $ TimeBodyAccJerkmeanX          : | num  | 0.078 0.074 0.0736 0.0773 0.0734 ...| 
 | $ TimeBodyAccJerkmeanY          : | num  | 0.005 0.00577 0.0031 0.02006 0.01912 ...| 
 | $ TimeBodyAccJerkmeanZ          : | num  | -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...| 
 | $ TimeBodyAccJerkstdX           : | num  | -0.994 -0.996 -0.991 -0.993 -0.996 ...| 
 | $ TimeBodyAccJerkstdY           : | num  | -0.988 -0.981 -0.981 -0.988 -0.988 ...| 
 | $ TimeBodyAccJerkstdZ           : | num  | -0.994 -0.992 -0.99 -0.993 -0.992 ...| 
 | $ TimeBodyGyromeanX             : | num  | -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...| 
 | $ TimeBodyGyromeanY             : | num  | -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...| 
 | $ TimeBodyGyromeanZ             : | num  | 0.1077 0.1006 0.0961 0.0855 0.0774 ...| 
 | $ TimeBodyGyrostdX              : | num  | -0.985 -0.983 -0.976 -0.991 -0.985 ...| 
 | $ TimeBodyGyrostdY              : | num  | -0.977 -0.989 -0.994 -0.992 -0.992 ...| 
 | $ TimeBodyGyrostdZ              : | num  | -0.992 -0.989 -0.986 -0.988 -0.987 ...| 
 | $ TimeBodyGyroJerkmeanX         : | num  | -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...| 
 | $ TimeBodyGyroJerkmeanY         : | num  | -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...| 
 | $ TimeBodyGyroJerkmeanZ         : | num  | -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...| 
 | $ TimeBodyGyroJerkstdX          : | num  | -0.992 -0.99 -0.988 -0.991 -0.991 ...| 
 | $ TimeBodyGyroJerkstdY          : | num  | -0.993 -0.997 -0.996 -0.997 -0.996 ...| 
 | $ TimeBodyGyroJerkstdZ          : | num  | -0.992 -0.994 -0.992 -0.993 -0.995 ...| 
 | $ TimeBodyAccMagmean            : | num  | -0.959 -0.979 -0.984 -0.987 -0.993 ...| 
 | $ TimeBodyAccMagstd             : | num  | -0.951 -0.976 -0.988 -0.986 -0.991 ...| 
 | $ TimeGravityAccMagmean         : | num  | -0.959 -0.979 -0.984 -0.987 -0.993 ...| 
 | $ TimeGravityAccMagstd          : | num  | -0.951 -0.976 -0.988 -0.986 -0.991 ...| 
 | $ TimeBodyAccJerkMagmean        : | num  | -0.993 -0.991 -0.989 -0.993 -0.993 ...| 
 | $ TimeBodyAccJerkMagstd         : | num  | -0.994 -0.992 -0.99 -0.993 -0.996 ...| 
 | $ TimeBodyGyroMagmean           : | num  | -0.969 -0.981 -0.976 -0.982 -0.985 ...| 
 | $ TimeBodyGyroMagstd            : | num  | -0.964 -0.984 -0.986 -0.987 -0.989 ...| 
 | $ TimeBodyGyroJerkMagmean       : | num  | -0.994 -0.995 -0.993 -0.996 -0.996 ...| 
 | $ TimeBodyGyroJerkMagstd        : | num  | -0.991 -0.996 -0.995 -0.995 -0.995 ...| 
 | $ FFTBodyAccmeanX               : | num  | -0.995 -0.997 -0.994 -0.995 -0.997 ...| 
 | $ FFTBodyAccmeanY               : | num  | -0.983 -0.977 -0.973 -0.984 -0.982 ...| 
 | $ FFTBodyAccmeanZ               : | num  | -0.939 -0.974 -0.983 -0.991 -0.988 ...| 
 | $ FFTBodyAccstdX                : | num  | -0.995 -0.999 -0.996 -0.996 -0.999 ...| 
 | $ FFTBodyAccstdY                : | num  | -0.983 -0.975 -0.966 -0.983 -0.98 ...| 
 | $ FFTBodyAccstdZ                : | num  | -0.906 -0.955 -0.977 -0.99 -0.992 ...| 
 | $ FFTBodyAccmeanFreqX           : | num  | 0.252 0.271 0.125 0.029 0.181 ...| 
 | $ FFTBodyAccmeanFreqY           : | num  | 0.1318 0.0429 -0.0646 0.0803 0.058 ...| 
 | $ FFTBodyAccmeanFreqZ           : | num  | -0.0521 -0.0143 0.0827 0.1857 0.5598 ...| 
 | $ FFTBodyAccJerkmeanX           : | num  | -0.992 -0.995 -0.991 -0.994 -0.996 ...| 
 | $ FFTBodyAccJerkmeanY           : | num  | -0.987 -0.981 -0.982 -0.989 -0.989 ...| 
 | $ FFTBodyAccJerkmeanZ           : | num  | -0.99 -0.99 -0.988 -0.991 -0.991 ...| 
 | $ FFTBodyAccJerkstdX            : | num  | -0.996 -0.997 -0.991 -0.991 -0.997 ...| 
 | $ FFTBodyAccJerkstdY            : | num  | -0.991 -0.982 -0.981 -0.987 -0.989 ...| 
 | $ FFTBodyAccJerkstdZ            : | num  | -0.997 -0.993 -0.99 -0.994 -0.993 ...| 
 | $ FFTBodyAccJerkmeanFreqX       : | num  | 0.8704 0.6085 0.1154 0.0358 0.2734 ...| 
 | $ FFTBodyAccJerkmeanFreqY       : | num  | 0.2107 -0.0537 -0.1934 -0.093 0.0791 ...| 
 | $ FFTBodyAccJerkmeanFreqZ       : | num  | 0.2637 0.0631 0.0383 0.1681 0.2924 ...| 
 | $ FFTBodyGyromeanX              : | num  | -0.987 -0.977 -0.975 -0.987 -0.982 ...| 
 | $ FFTBodyGyromeanY              : | num  | -0.982 -0.993 -0.994 -0.994 -0.993 ...| 
 | $ FFTBodyGyromeanZ              : | num  | -0.99 -0.99 -0.987 -0.987 -0.989 ...| 
 | $ FFTBodyGyrostdX               : | num  | -0.985 -0.985 -0.977 -0.993 -0.986 ...| 
 | $ FFTBodyGyrostdY               : | num  | -0.974 -0.987 -0.993 -0.992 -0.992 ...| 
 | $ FFTBodyGyrostdZ               : | num  | -0.994 -0.99 -0.987 -0.989 -0.988 ...| 
 | $ FFTBodyGyromeanFreqX          : | num  | -0.2575 -0.0482 -0.2167 0.2169 -0.1533 ...| 
 | $ FFTBodyGyromeanFreqY          : | num  | 0.0979 -0.4016 -0.0173 -0.1352 -0.0884 ...| 
 | $ FFTBodyGyromeanFreqZ          : | num  | 0.5472 -0.0682 -0.1107 -0.0497 -0.1622 ...| 
 | $ FFTBodyAccMagmean             : | num  | -0.952 -0.981 -0.988 -0.988 -0.994 ...| 
 | $ FFTBodyAccMagstd              : | num  | -0.956 -0.976 -0.989 -0.987 -0.99 ...| 
 | $ FFTBodyAccMagmeanFreq         : | num  | -0.0884 -0.0441 0.2579 0.0736 0.3943 ...| 
 | $ FFTBodyBodyAccJerkMagmean     : | num  | -0.994 -0.99 -0.989 -0.993 -0.996 ...| 
 | $ FFTBodyBodyAccJerkMagstd      : | num  | -0.994 -0.992 -0.991 -0.992 -0.994 ...| 
 | $ FFTBodyBodyAccJerkMagmeanFreq : | num  | 0.347 0.532 0.661 0.679 0.559 ...| 
 | $ FFTBodyBodyGyroMagmean        : | num  | -0.98 -0.988 -0.989 -0.989 -0.991 ...| 
 | $ FFTBodyBodyGyroMagstd         : | num  | -0.961 -0.983 -0.986 -0.988 -0.989 ...| 
 | $ FFTBodyBodyGyroMagmeanFreq    : | num  | -0.129 -0.272 -0.2127 -0.0357 -0.2736 ...| 
 | $ FFTBodyBodyGyroJerkMagmean    : | num  | -0.992 -0.996 -0.995 -0.995 -0.995 ...| 
 | $ FFTBodyBodyGyroJerkMagstd     : | num  | -0.991 -0.996 -0.995 -0.995 -0.995 ...| 
 | $ FFTBodyBodyGyroJerkMagmeanFreq: | num  | -0.0743 0.1581 0.4145 0.4046 0.0878 ...| 
