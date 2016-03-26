##This detail how the scripts work.

##description of methods
1. calls are made to 'tidyr' and 'dplyr' packages.
2. data from the UCI HAR dataset is loaded. Descriptions of activities and feature names are loaded as strings rather than factors.
3. test and train datasets are merged.
4. activities are recoded as the actual names rather than by numbers.
5. 'ID' and 'activity' are added to the merged dataset and variable names added as column names.
6. the characters '-', '(', and ')' are removed from the variable names.
6a. 'Mean' is also removed from the variable names but may be included if necessary.
7. the variables that refer to 'mean' and 'std' are extracted and stored in another variable.
8. the tidied dataset is grouped by ID and activity and then the means of the values of each variable for each activity and subject is found and stored in a new variable.