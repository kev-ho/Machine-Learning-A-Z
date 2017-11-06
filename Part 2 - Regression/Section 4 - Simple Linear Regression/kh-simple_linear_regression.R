# Simple Linear Regression

setwd(dir = '../Part 2 - Regression/Section 4 - Simple Linear Regression/')

# Importing the dataset
dataset = read.csv('Salary_Data.csv')


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Make a model
salary_pred_model = lm(Salary ~ YearsExperience,
                  training_set)

#Make a prediction
y_pred = predict(object = salary_pred_model, newdata = test_set)

#Visualise the result

library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(salary_pred_model, training_set)),
            color = 'blue') +
  ggtitle("Salary vs Experience (Training Set)") +
  xlab("Years Experience") +
  ylab("Salary")

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(salary_pred_model, training_set)),
            color = 'blue') +
  ggtitle("Salary vs Experience (Test Set)") +
  xlab("Years Experience") +
  ylab("Salary")
