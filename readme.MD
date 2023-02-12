---
title: "Readme.MD"
author: "Jeremy Weeks"
date: "2023-02-12"
output: html_document
---
Getting and Cleaning Data Course Project 

The purpose of this Readme file is to detail the contents of the ‘Getting and 
Cleaning Data Course Project’. Specifically the source of the data used in this 
project and the output created from it.  

The GitHub repository contains: 

Readme.md - A file detailing how the file ‘tidy_data.txt’ was created.  

Run_Analysis.R - The program source file used to create the output data set 

Independent_Tidy.txt - the output tidy data set created from the source data 
sets 

Codebook.md - A codebook describing the variables in the output data set and 
the required transformations to move from the source material to the final 
product. 

Data for this project was taken from the ‘Human Activity Recognition Using 
Smartphones’ project. As per the source data documentation, this project 
collects data from experiments ‘carried out with a group of 30 volunteers within
an age bracket of 19-48 years’. The project collects data from smartphones for 
numerous activities including:  

WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING.  

This data was recorded using ‘3-axxial linear acceleration and 3-axial angular 
velocity’. Further details on the methodology of the experiment are available 
with the data sets at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The tidy data set [Independent_Tidy.txt] has been generated via the 
Run_Analysis.R program. This program will download the source data sets, perform
iterative transformations on the included variables and produce the output data 
set. These steps include: 

Download of the source data if the data is not currently available in the 
working directory. 

Read in raw data sets 

Merge data sets [training, test] into one comprehensive data frame.  

Apply labels to variables based on the ‘Features’ file contained in the 
experiment files 

Subset the data, retaining Subject_ID, Activity, Standard Deviation measures and
Mean measures 

Clean up variable names and apply labels to Activities 

Create a secondary data set of Activities by Subject 

Output the secondary data set [Independent_Tidy.txt] 

The program run_analysis.R was created in RStudio 2022.12.0 Build 353 and 
requires the use of the dplyr package [version 1.0.10 was used]. 