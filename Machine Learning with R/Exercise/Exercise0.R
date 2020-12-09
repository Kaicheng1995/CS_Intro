# 3. Put the dataset I send you in the working directory and import the data into RStudio.
Data_example = read.csv("~/Dropbox/PhD/Year 6/Online Teaching/Movie/Data/Data_example.csv",stringsAsFactors = F)
getwd()
# 4. Calculate Mean, Variance, SD, Max, Min, Median of the variable Rating

mean(Data_example$Rating)
var(Data_example$Rating)
sd(Data_example$Rating)
max(Data_example$Rating)
min(Data_example$Rating)
median(Data_example$Rating)

# 5. For the first 10 values of Rating, do logarithm, exponential, divide the vector by a number,multiplication by a number
x=Data_example$Rating[1:10]
x=Data_example$Rating[c(1,7,77)]

log(x)
exp(x)
x/3
x*3


# 6. vector, matrix, entries in a matrix, multiplication of vectors, matrice. 

# define three 4*1 vectors
v1=c(1,2,3,4)
v2=c(6,2,8,4)
v3=c(9,3,6,1)

# operations of vectors
# add 3 to a v1
v1+3
# add v1 to v2
v1+v2

# product of v1 and v2
v1*v2
v1%*%v2

# create a matrix, using v1,v2,v3 as the columns
m=cbind(v1,v2,v3)

# use v1,v2,v3 as rows
m=cbind(v1,v2,v3)
# print certain elements of a matrix
# the element in row 1 and columns 1
m[1,1]
# the element in row 1 and columns 3
m[1,3]
# the first two elements in row 1
m[1,1:2]
# the first three elements in row 1
m[1,1:3]
# the elements in the first row
m[1,]
# the elements in the first column
m[,1]

# 1st and 3rd the elements in the first row
m[1,c(1,3)]

# 6. Make a plot using the variable Rating.

# compare the differences between the different commands

plot(Data_example$Rating)

plot(Data_example$Rating,type='l')

plot(Data_example$Rating,type='o')

plot(Data_example$Rating,type='o',ylab='Rating',xlab='')

plot(Data_example$Rating,type='o',ylab='Rating',xlab='',col='brown')

plot(Data_example$Rating,type='o',ylab='Rating',xlab='',col='red',pch=100)



# 7. linear regression and show the results.
# use BoxOffice as dependent varible; Budget and Rating as independent variables to run the regression. 

reg1=lm(log(BoxOffice) ~ log(Budget)+Rating,data=Data_example)

summary(reg1)

reg2=lm(log(BoxOffice) ~ log(Budget)+log(Rating),data=Data_example)

summary(reg2)
# 8. install a package: stargazar
install.packages('stargazer')
library(stargazer)

# 9. use functions from this pacakge to output the regression results
stargazer(reg1, title="Excercise Results", align=TRUE,type = "html",style = "qje", out="Excercise Results.html")
stargazer(reg1,reg2, title="Excercise Results", align=TRUE,type = "html",style = "aer", out="Excercise Results aer.html")

# LaTex
stargazer(reg1, title="Results", align=TRUE,style = "qje",omit=c('State','Month','Year'))



