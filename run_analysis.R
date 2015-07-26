run_analysis <- function () {
	
##Read all subject IDs for train and test dataset
	subject_test <- read.table("subject_test.txt", col.names=c("Subject"))
	subject_train <- read.table("subject_train.txt", col.names=c("Subject"))
	
##Combines train and test datasets into a single data frame
	subject_all <- rbind(subject_train, subject_test)
	
##Read features dataset for both train and test
	features_test <- read.table("X_test.txt")
	features_train <- read.table("X_train.txt")
	
##Combine train and test data for features into a single data frame
	features_data <- rbind(features_test, features_train)
	
##Read the features list - list of features names and labels 
	feature_list <- read.table("features.txt", col.names=c("index", "feature_labels"))
	
##Create one dimensional character vector containing feature labels from features_list data frame
	feature_labels <- feature_list$feature_labels
	
##Create logical vector indicating columns that have mean() and std() in their name
	features_subset <- grepl('mean\\(\\)|std\\(\\)',feature_labels)
	
##Create a character vector of only features with mean and standard deviation in their name
	feature_list <- as.character(feature_labels[features_subset])
	
##Renaming columns in features_data so that names match after subsetting mean and stddev
	colnames(features_data) <- feature_labels
	
##Extract only mean() and std() columns from features_data using the logical vector "features_subset"
	features_data <- features_data[,features_subset]
	
##Read activities for train and test
	activities_test <- read.table("Y_test.txt")
	activities_train <- read.table("Y_train.txt")
	
##Combine training and test activities into single data frame and rename column to "activity" from "V1"
	activities_all <- rbind(activities_test, activities_train)
	colnames(activities_all) <- "activityLabel"
	
##Recode activity values as descriptive names using the "activity_labels.txt" file
	activity_labels<-read.table("activity_labels.txt",sep=" ",col.names=c("activityLabel","Activity"))
	activities_all<-join(activities_all,activity_labels,by="activityLabel",type="left")
	
##Drop activity numbers
	activities_all$activityLabel <- NULL
	
##Combine Actitivies, Subjects and Features all into one data frame
	all_df <- cbind(features_data, activities_all, subject_all)
	
##Melt data frame before reshaping into a tidy dataset
	tdf <- melt(all_df, id=c("Subject", "Activity"), measure.vars=feature_list)
	
##Reshape into tidy data frame by mean using the reshape2 package
	tdf <- dcast(tdf, Activity + Subject ~ variable, mean)
	
##Reordering by Subject then Activity
	tdf <- tdf[order(tdf$Subject, tdf$Activity),]
	
##Indexing Rows and move Subject to Column 1
	rownames(tdf) <- 1:nrow(tdf)
	tdf <- tdf[,c(2,1,3:68)]
	
##Output file
	write.table(tdf, file="tidy_dataset.txt", row.name = F)
}