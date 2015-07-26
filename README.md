##Preparations before executing run_analysis.R script

###Following files need to be unzipped to the working directory:
1. acitivity_labels.txt
2. features.txt
3. subject_test.txt
4. subject_train.txt
5. X_test.txt
6. X_train.txt
7. y_test.txt
8. y_train.txt

###Packages that need to be installed
1. plyr
2. reshape2

##Description of how the script works

###The function run_analysis.R does the following upon execution:
1. Reads in and combines test and training data for subjects
2. Reads in and combines test and training data for features
3. Creates a subset with only the features that are a measurement of mean or standard deviation
4. Reads in activity labels resulting in a data set of combined subject, features, and activity data
5. Melts and reshapes data
6. Finally, completes by outputting to a tidy cohesive data set

