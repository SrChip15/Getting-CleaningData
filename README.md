## Pre-run Preparations

### Unzip the following files to working directory:
1. acitivity_labels.txt
2. features.txt
3. subject_test.txt
4. subject_train.txt
5. X_test.txt
6. X_train.txt
7. y_test.txt
8. y_train.txt

### Dependencies
1. plyr
2. reshape2

## Description
1. Read input and combine test and training data for subjects
2. Reads input and combine test and training data for features
3. Create a subset with only the features that are a measurement of mean or standard deviation
4. Read in activity labels resulting in a data set of combined subject, features, and activity data
5. Melt and reshape data
6. Output to a tidy cohesive data set
