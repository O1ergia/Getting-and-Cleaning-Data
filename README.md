# Getting-and-Cleaning-Data-Course-Project
My course work on the Coursera

### How run_analysis.R script works

1. Read variables names from features and make syntactically valid names
2. Read in the training data
3. Subset data by columns whose names contains the mean and standard 
deviation
4. Add info about activity and subject
5. Repeate steps 2-4 for the test data
6. Combine the two data frames
7. Group data by activity and subject, summarise each non-grouping variables
8. Write output to file
