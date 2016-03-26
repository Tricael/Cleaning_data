##Codebook

##description of variables in the dataset:
ID: the ID describing the individual subjects of the experiment. Values range from [1:30]
activity: Describes the activity that the subject was engaged in and generated the data.
data variables/Features: The variables are as described in features_info.txt in the UCI HAR Dataset.

##description of data
data variables: The data used are as described in README.txt that comes with the UCI HAR Dataset.
grouped.all_dat: The tidied dataset. It extracts the measurements on the mean and standard deviation from the variables in the original dataset. 
summary.grouped_all_dat: Lists the means of the variables for each activity and each subject.

##description of methods
1. test and train datasets are merged.
2. activities are recoded as the actual names rather than by numbers.
3. 'ID' and 'activity' are added to the merged dataset and variable names added as column names.
4. the characters '-', '(', and ')' are removed from the variable names.
5. There exists variables named angle(...Mean). These are excluded from the dataset but may be included as needed.
6. the variables that refer to 'mean' and 'std' are extracted and stored in another variable.