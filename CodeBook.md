Getting and Cleaning Data Project

Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

Source Data
A full description of the data used in this project can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Test and train data were loaded separately. The subject, X, and y files were loaded for both test and train. Headers for the X values were extracted from the features.txt file and applied to both test and train datasets

Next, test and train data sets were merged into one. For readability column names of Subject and Activity were added for the subject and y values respectivel.

The following columns were retainened
- containing mean: Mean value
- containing std: Standard deviation
- Subject and Activity

The following columns can be found in the output file:
Activity
2	Subject
3	tBodyAcc-mean()-X
4	tBodyAcc-mean()-Y
5	tBodyAcc-mean()-Z
6	tBodyAccStd-X
7	tBodyAccStd-Y
8	tBodyAccStd-Z
9	tGravityAcc-mean()-X
10	tGravityAcc-mean()-Y
11	tGravityAcc-mean()-Z
12	tGravityAccStd-X
13	tGravityAccStd-Y
14	tGravityAccStd-Z
15	tBodyAccJerk-mean()-X
16	tBodyAccJerk-mean()-Y
17	tBodyAccJerk-mean()-Z
18	tBodyAccJerkStd-X
19	tBodyAccJerkStd-Y
20	tBodyAccJerkStd-Z
21	tBodyGyro-mean()-X
22	tBodyGyro-mean()-Y
23	tBodyGyro-mean()-Z
24	tBodyGyroStd-X
25	tBodyGyroStd-Y
26	tBodyGyroStd-Z
27	tBodyGyroJerk-mean()-X
28	tBodyGyroJerk-mean()-Y
29	tBodyGyroJerk-mean()-Z
30	tBodyGyroJerkStd-X
31	tBodyGyroJerkStd-Y
32	tBodyGyroJerkStd-Z
33	tBodyAccMag-mean()
34	tBodyAccMagStd
35	tGravityAccMag-mean()
36	tGravityAccMagStd
37	tBodyAccJerkMag-mean()
38	tBodyAccJerkMagStd
39	tBodyGyroMag-mean()
40	tBodyGyroMagStd
41	tBodyGyroJerkMag-mean()
42	tBodyGyroJerkMagStd
43	fBodyAcc-mean()-X
44	fBodyAcc-mean()-Y
45	fBodyAcc-mean()-Z
46	fBodyAccStd-X
47	fBodyAccStd-Y
48	fBodyAccStd-Z
49	fBodyAccJerk-mean()-X
50	fBodyAccJerk-mean()-Y
51	fBodyAccJerk-mean()-Z
52	fBodyAccJerkStd-X
53	fBodyAccJerkStd-Y
54	fBodyAccJerkStd-Z
55	fBodyGyro-mean()-X
56	fBodyGyro-mean()-Y
57	fBodyGyro-mean()-Z
58	fBodyGyroStd-X
59	fBodyGyroStd-Y
60	fBodyGyroStd-Z
61	fBodyAccMag-mean()
62	fBodyAccMagStd
63	fBodyBodyAccJerkMag-mean()
64	fBodyBodyAccJerkMagStd
65	fBodyBodyGyroMag-mean()
66	fBodyBodyGyroMagStd
67	fBodyBodyGyroJerkMag-mean()
68	fBodyBodyGyroJerkMagStd
