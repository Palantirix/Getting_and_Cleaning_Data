---
title: "Codebook.MD"
author: "Jeremy Weeks"
date: "2023-02-12"
output: html_document
---
Independent_Tidy.txt is a space delimited flat file. 

Row 1 of the data set includes all 81 variable names. These variables are: 

Subject_ID: Integer in the range of 1 to 30 

Activity_ID: String with values derived from accelerometer and gyroscope: 

WALKING – Subject was walking  

WALKING_UPSTAIRS – Subject was walking up stairs 

WALKING_DOWNSTAIRS – Subject was walking down stairs 

STANDING – Subject was standing 

LAYING – Subject was laying down 

The remaining 79 variables are floating-point values of the average or standard 
deviation, normalized between [-1,1]. These variables fall into one of two 
domains: Time and Frequency. For reference, these two domains are identified in 
the variable names as ‘timeDomain’ and ‘frequencyDomain’. 

Each domain reports measure for: 

Body_Accelerometer [X,Y and Z axis] 

Gravity_Accelerometer [X,Y and Z axis] 

Body_Accelerometer_Jerk [X,Y and Z axis] 

Body_Gyroscope [X,Y and Z axis] 

Body_Gyroscope_Jerk [X,Y and Z axis] 

Body_Accelerometer_Magnitude 

Gravity_Accelerometer_Magnitude 

Body_Accelerometer_Jerk_Magnitude 

Body_Gyroscope_Magnitude 

Body_Gyroscope_Jerk_Magnitude 

	Additionally, each domain reports the Mean and Standard Deviation for each 
	measure. 

The process of moving from the origin data sets to the ‘Independent_Tidy.txt’ 
data set include: 

The two data sets [X_train, X_test] were merged into one comprehensive data set 

The Subject_ID, Activity_ID and measures of Mean and Standard Deviation were 
retained for each measurement. All other variables were removed. 

Variable names were extracted from the file ‘features.txt’ and applied as a 
header to the merged data set 

Variable names were cleaned using ‘gsub’ to make them more readable 

The raw data set was grouped by both Subject_ID and Activity_ID then summarized 
by Mean 

The new cleaned and summarized data set was output as ‘Independent_Tidy.txt’ 