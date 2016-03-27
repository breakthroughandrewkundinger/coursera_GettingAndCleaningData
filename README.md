Getting and Cleaning Data Assignment


Course Project Overview


The R script called run_analysis.R should do the following: 
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names.
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to work on this course project

1.	Download the data source and put the UCI HAR Dataset into your working directory location. (apply the getwd() command to see the path for your working directory)

2.	Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

3.	Copy  the code in the run_analysis.R file listed on this page and paste into a new script in R Studio. Select all (control + a) and then press run.  For the script, see: = https://github.com/breakthroughandrewkundinger/coursera_GettingAndCleaningData/blob/master/run_analysis.R

4.	After loading the file, the tidy_data.txt file will appear in your working directory location. 

Other Notes
1.	R Studio is recommended. 
2.	We are using data.table, dplyr and reshape2 packages. The run_analysis.R will download these.  The code was tested using r version 3.2.3. 

