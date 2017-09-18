library(dplyr)

## Read variables names from features 
## Считываем имена переменных
col_names <- read.table( "features.txt")

## Make syntactically valid names out of character vectors
## Делаем имена синтаксически правильными
col_names <- make.names(col_names[[2]], unique = TRUE)
col_names <- gsub("(\\.){2,5}", "", col_names)
col_names <- gsub("(\\.)$", "", col_names)


## load the data ## загружаем данные
train_data <- read.table( "train/X_train.txt")
colnames(train_data) <- col_names

## Select columns whose names contains the mean and standard deviation
train_data_filtered <- select( .data = train_data, contains("mean"), contains("std"))
rm(train_data)

## add info about activity and subject
activity <- read.table( "train/Y_train.txt", header = F ,col.names = c("ActivityID"), colClasses = c("factor"))
levels(activity$ActivityID) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
subj <- read.table( "train/subject_train.txt", header = F ,col.names = c("SubjectID"))
train_data_filtered <- cbind(activity, subj, train_data_filtered)

## repeat for test data set
test_data <- read.table( "test/X_test.txt")
colnames(test_data) <- col_names

test_data_filtered <- select( .data = test_data, contains("mean"), contains("std"))
rm(test_data)

activity <- read.table( "test/Y_test.txt", header = F ,col.names = c("ActivityID"), colClasses = c("factor"))
levels(activity$ActivityID) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
subj <- read.table( "test/subject_test.txt", header = F ,col.names = c("SubjectID"))

test_data_filtered <- cbind(activity, subj, test_data_filtered)

## Combine the two data frames 
data <- rbind(train_data_filtered, test_data_filtered )

## Group data.frame by ActivityID and SubjectID columns 
## and call mean function for all non-grouping variables
tidy_data <- data %>% group_by(ActivityID, SubjectID) %>% summarise_each(funs(mean))
 
write.table(tidy_data, file = "tiny_data.txt", row.name=FALSE)