# Getting-and-Cleaning-Data-Course-Project
My course work on the Coursera

### How run_analysis.R script works

1. Read in the training data
2. Subset data by columns whose names contains the mean and standard 
deviation
3. Add info about activity and subject
4. Group data by activity and subject
5. Repeate steps 1-4 for the test data
6. Combine the two data frames by using "bind_rows" function from 
"dplyr" package
7. Add descriptive variable names to the final data frame
8. Write output to file
