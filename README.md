# Getting_Cleaning_Data_Project
This is the course Project for "Getting and Cleaning Data". It contains the scripts "run_analysis" that require to clean and answer the questions associated with the project.

1. Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unzip the files. Also set the working directory to point to the folder that contain all unzip file.
2. Read and load the training and test data.
3. Read and Load the features and activity info data.
4. Merge the two testing and training data sets.
5. Convert "subject" and "activity" as factors variables.
7. Store the result in a "tidy.txt" file that contains mean value of each variable for each subject and activity pair.