library(datasets)
data(iris)
head(iris)
summary(iris)

#Q1
s <- split(iris, iris$Species)
v <- s$virginica[,"Sepal.Length"]
mean(v)

#Q2
apply(iris[, 1:4], 2, mean)

#Q3  calculate the average miles per gallon (mpg) by number of cylinders
#    in the car (cyl)
library(datasets)
data(mtcars)
?mtcars
with(mtcars, tapply(mpg, cyl, mean))
# same results using
tapply(mtcars$mpg, mtcars$cyl, mean)

# Q4 what is the absolute difference between the average horsepower of
#    4-cylinder cars and the average horsepower of 8-cylinder cars?
s <- with(mtcars, tapply(hp, cyl, mean))
s["8"] - s["4"]
