# Exercise 2

# Q1. # Use the data set called "Q1data.csv". This data set describes one consumer's purchase history of buying a certain good. It contains three variables.
# choice = 0 means no purchase; choice = 1 means buy.
# price ($)
# inventory
# Use this data set to estimate the logit model. 
# Use choice as the dependent variable. price and inventory as the indenpendent variable. 
# Report the estimation results.


Q1data <- read.csv("/Users/ares/Desktop/科研/Lecture 2/Lecture2 HW/Q1data.csv",stringsAsFactors = F)

install.packages("caret")
library("caret")

datasplit = createDataPartition(y=Q1data$choice,p=0.6,list=FALSE)
train = Q1data[datasplit, ]

split2 = Q1data[-datasplit, ]
datasplit2 = createDataPartition(y=split2$choice,p=0.5,list=FALSE)
validation = split2[datasplit2, ]

reg_logistic=glm(choice ~ price + inventory,data = train,family = 'binomial')

choice_pred = predict(reg_logistic, validation)

prob_nopurchase = 1/(1+exp(choice_pred))
prob_buy = 1-1/(1+exp(choice_pred))

buy_pred = prob_buy > 0.5
pred = as.numeric(buy_pred)
true=validation$choice

sum(pred == true)/length(true)
  
  
# Q2 Based on your parameter estimates, compute the choice probability of choosing to buy when 
# price = 20 and inventory equals mean inventory. [Note that we do not observe price = 20 in the data. 
# The estimated model allows us to predict what will happen if we set price at some values that we have 
# not tried before.]
summary(reg_logistic)

inventory = mean(Q1data$inventory)
price = 20

index =  20*(-0.25420) + inventory*(-0.09539) + 6.99567

possibility = 1-1/(1+exp(index))

# Q3 Use the train.csv data set to train a decision tree. The dependent variable and the independent 
# variables are as what I give you in the lecture code. 
# try to train the decision tree using different cp values and report the prediction accuracy for the 
# validation set. 

train1 = read.csv("/Users/ares/Desktop/科研/Lecture 2/Lecture2 code/train.csv",stringsAsFactors = F)
validation1 = read.csv("/Users/ares/Desktop/科研/Lecture 2/Lecture2 code/validation.csv",stringsAsFactors = F)

library("rpart")

gross_median=median(log(train1$gross))     #设定判断基准

train1$gross_log=log(train1$gross)          #数据转换为log（包括train和validation
train1$budget_log=log(train1$budget)
validation1$gross_log=log(validation1$gross)
validation1$budget_log=log(validation1$budget)

train1$gross_high=0                                      #设置binary category的0/1变量
train1$gross_high[log(train1$gross)>gross_median]=1     
validation1$gross_high=0
validation1$gross_high[validation1$gross_log>gross_median]=1

fit = rpart(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
              Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="class",
            data=train1,cp=0.005)                   #run decision tree

#特别注意需要选择validation的变量，而不是直接代入predict（）
validation_dt=validation1[,c('budget_log','country_num','Sequel','TopActor','TopDirectors','competition','Drama','Crime','Thriller','Action','History','War','Western','Sci.Fi','Horror','BigSix','independent.film')]

pred_dt = predict(fit, validation_dt, type = 'class')
sum(pred_dt==validation1$gross_high)/length(validation1$gross_high)


fit2=prune(fit, cp=0.01)
fit3=prune(fit, cp=0.1)
fit4=prune(fit, cp=0.5)

pred_dt = predict(fit2, validation_dt, type = 'class')
sum(pred_dt==validation1$gross_high)/length(validation1$gross_high)

pred_dt = predict(fit3, validation_dt, type = 'class')
sum(pred_dt==validation1$gross_high)/length(validation1$gross_high)

pred_dt = predict(fit4, validation_dt, type = 'class')
sum(pred_dt==validation1$gross_high)/length(validation1$gross_high)


# Q4 Choose the decision tree with the best prediction performance and plot the decision tree using rpart.plot

library("rpart.plot")

rpart.plot(fit4, box.palette="RdBu", shadow.col="gray", nn=TRUE)



