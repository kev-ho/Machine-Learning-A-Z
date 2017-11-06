# Data Preprocessing Template

setwd("Data_Preprocessing/")

# Importing the dataset
dataset = read.csv('Data.csv')

# dataset = dataset[, 2:3]

#Taking care of missing data. Mean imputation
# dataset$Age = ifelse(is.na(dataset$Age), 
#                      mean(dataset$Age, na.rm = TRUE), 
#                      dataset$Age)
# COURSE IMPLEMENTATION. WHY make a function???
# dataset$Age = ifelse(is.na(dataset$Age), 
#                      ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
#                      dataset$Age)
#
# 
# dataset$Salary = ifelse(is.na(dataset$Salary), 
#                         mean(dataset$Salary, 
#                              na.rm = TRUE), dataset$Salary)


# # Encoding categorical data
# dataset$Country = factor(dataset$Country,
#                          levels = c('France', 'Spain', 'Germany'),
#                          labels = c(1,2,3))
# 
# dataset$Purchased = factor(dataset$Purchased,
#                          levels = c('No', 'Yes'),
#                          labels = c(0,1))

#Splitting the dataset into the Training set and Test Set
library(caTools)

set.seed(123)

split_ref = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split_ref)
test_set = subset(dataset, !split_ref)

#feature scaling
# training_set[2:3] = scale(training_set[2:3])
# test_set[2:3] = scale(test_set[2:3])






