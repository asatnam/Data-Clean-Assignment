<h1>Overview</h1>

codebook.md describes the specific details of the 5 programs written for the assignment

The data set has been downloaded from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The file has been downloaed and unzipped in the "UCI HAR Dataset" folder.

We will be using below data files. Also, shall not be using any files in Inertial Signals folders

* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt

The supporting metadata files are 

* UCI HAR Dataset/features.txt
* UCI HAR Dataset/activity_labels.txt

<h2>Description of run_analysis.R</h2>

<h3>Program 1</h3>

This program reads all the files, appropriately provides column names and megres all data sets to create one large tidy data set.
When checked, it will shlow uniquie columns and rows.

<h3>Program 2</h3>

This program creates a subset of dataset to Extract only the measurements on the mean and standard deviation for each measurement.

<h3>Program 3</h3>

This is to put descriptive names to activities. . I have used two methods to achieve this.

<h3>Program 4</h3>

This is to rename columns with short names with full names

<h3>Program 5</h3>

This is to average of each columns grouped by activity and subject.
Finally, this dataset is written as secondary independent data set in the repo.


