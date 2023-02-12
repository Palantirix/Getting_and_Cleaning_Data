library(dplyr)

#1. Check if file exists and download/unzip if not
     URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     ZIP <- "UCI HAR Dataset.zip"
     if (!file.exists(ZIP)){download.file(URL,ZIP,mode="wb")}

     DSN1 <- "UCI HAR Dataset"
     if (!file.exists(DSN1)){unzip(ZIP)}

#2. Read in required data sets
     #a. Read in feature data set - will be used as variable names
     features       <- read.table(file.path(DSN1,"features.txt"), as.is=TRUE)

     #b. Read in Activity values and labels then define variable names
     activity_label <- read.table(file.path(DSN1,"activity_labels.txt"), as.is=TRUE)
     colnames(activity_label) <- c("Activity_ID","Activity_Label")

     #c. Read in all Training data sets [subject number, training set & labels]
     Subjects_train <- read.table(file.path(DSN1,"train","subject_train.txt"))
     Values_train   <- read.table(file.path(DSN1,"train","X_train.txt"))
     Activity_train <- read.table(file.path(DSN1,"train","y_train.txt"))

     #d. Read in all Test data sets [subject number, Test set & labels]
     Subjects_test  <- read.table(file.path(DSN1,"test","subject_test.txt"))
     Values_test    <- read.table(file.path(DSN1,"test","X_test.txt"))
     Activity_test  <- read.table(file.path(DSN1,"test","y_test.txt"))

#3. Merge data sets and set features as column labels
     #a. Bind test/training by columns
     Test_bind <- cbind(Subjects_test, Values_test, Activity_test)
     Train_bind<- cbind(Subjects_train,Values_train,Activity_train)
     #b. Bind Test to Training sets by rows
     Activity  <- rbind(Test_bind, Train_bind)
     #c. Can be done in one step:
          #Activity <- rbind(cbind(Subjects_test,Values_test,Activity_Test),
                            #cbind(Subjects_train,Values_train,Activity_train))
     
#4. Add 'features.txt' values as labels to Activity data.frame
     colnames(Activity) <- c("Subject_ID", features[,2], "Activity_ID")
     
#5. Retain only the measurements for Mean and SD for each activity and subject
     Retain <- grepl("Subject|Activity_ID|mean|std",colnames(Activity))
     Activity <- Activity[,Retain]
     
#6. Replace Activity_ID values with Labels
     Activity$Activity_ID <- factor(Activity$Activity_ID, levels=activity_label[,1], labels=activity_label[,2])
     
#7. Add descriptive Variable names
     #a. Extract all column names
     Activity_Colnames <- colnames(Activity)
     
     #b. Remove parantheses from end of each variable name
     Activity_Colnames <- gsub("[\\(\\)]","",Activity_Colnames)
     Activity_Colnames <- gsub("^t", "timeDomain_",Activity_Colnames)
     Activity_Colnames <- gsub("^f", "frequencyDomain_",Activity_Colnames)
     Activity_Colnames <- gsub("Acc","_Accelerometer",Activity_Colnames)
     Activity_Colnames <- gsub("Gyro","_Gyroscope",Activity_Colnames)
     Activity_Colnames <- gsub("Mag","_Magnitude",Activity_Colnames)
     Activity_Colnames <- gsub("mean","Mean",Activity_Colnames)
     Activity_Colnames <- gsub("std","Standard_Deviation",Activity_Colnames)
     Activity_Colnames <- gsub("Freq","_Frequency",Activity_Colnames)
     Activity_Colnames <- gsub("BodyBody","Body",Activity_Colnames)
     Activity_Colnames <- gsub("Jerk","_Jerk",Activity_Colnames)
     
     #c. Apply derived names to data.frame as column names
     colnames(Activity) <- Activity_Colnames
     
#8. Create a second independent data set with average for each activity and subject

     Activity_Means <- Activity %>% 
          group_by(Subject_ID, Activity_ID) %>% 
          #summarise(across(c(Subject_ID,Activity_ID),mean,na.rm=TRUE))
          summarise_each(funs(mean))
     
#9. Output the new data set
     write.table(Activity_Means, "Independent_Tidy.txt", quote = FALSE, row.names=FALSE)