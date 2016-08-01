<h1>Overview</h1>

Below is the description of each program and variable used to solve 5 questions in the assignment.

<h2>Program 1</h2>

<h3>All the data from the provided zip files are read and stored in below variables.</h3>
subject_train
subject_test
x_train
x_test
Activity_train
Activity_test
data_feature
data_activity_labels

<h3>All the files are merged for traning and test categories.</h3>
all_subject
all_data
all_activity

<h3>final data frame is stored in below variable</h3>

<h2>Program 2</h2>

featureID - This contains the position id of rows with value 'mean' or 'std'
featurenames - this creates a vector of column names
subdata - this filters the dataset with the id identified above.

<h2>Program 3</h2>

<h3>Method 1</h3>
I have used merge method to put extra column with activity name.

<h3>Method 2</h3>
I have used loop to rename the activity number with corresponding activity name
Also, the resulting dataset is stored in "finaldata".

<h4>Program 4</h4>

Here, simple gsub function has been used to rename the short names with corresponding full names.

<h4>Program 5</h4>

And finally, we have used aggregate funciton to create average of all the fields grouped by activity and subject.
Also, this dataset is written as secondary independent data set in the repo.






