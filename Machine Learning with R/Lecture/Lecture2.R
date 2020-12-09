# Training Dataset: The sample of data used to fit the model.The model learns from this data.

# Validation Dataset: The sample of data used to provide an unbiased evaluation of a model fit on the training dataset 
# while tuning model hyperparameters. 

# Test Dataset: The sample of data used to provide an unbiased evaluation of a final model fit on the training dataset.

train = read.csv("~/Dropbox/PhD/Year 6/Online Teaching/Movie/Data/train.csv",stringsAsFactors = F)

validation = read.csv("~/Dropbox/PhD/Year 6/Online Teaching/Movie/Data/validation.csv",stringsAsFactors = F)


train$gross_log=log(train$gross)
train$budget_log=log(train$budget)

validation$gross_log=log(validation$gross)
validation$budget_log=log(validation$budget)

reg1=lm(gross_log~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
          Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,data=train)
summary(reg1)
# results explanation

# R2 is a statistic that will give some information about the goodness of fit of a model. An R2 of 1 
# indicates that the regression predictions perfectly fit the data.

# adjusted R2: adjusts for the number of independent variables in a model relative to the number of data points.

# make sure variable names in validation are the same as in train

gross_pred=predict(reg1, validation)
gross_pred[1:10]
validation$gross_log[1:10]
# measurement metric

# mean squared error
# https://en.wikipedia.org/wiki/Mean_squared_error
mean((gross_pred-validation$gross_log)^2)


# Mean absolute error
# https://en.wikipedia.org/wiki/Mean_absolute_error

mean(abs(gross_pred-validation$gross_log))




# logistic regression
# categorical variables

gross_median=median(log(train$gross))

gross_median=quantile(log(train$gross),0.5)

train$gross_high=0
train$gross_high[log(train$gross)>gross_median]=1

validation$gross_high=0
validation$gross_high[validation$gross_log>gross_median]=1


reg_logistic=glm(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                   Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                 data=train,family = 'binomial')

summary(reg_logistic)

gross_pred=predict(reg_logistic, validation)
gross_pred[1:10]

prob_low=1/(1+exp(gross_pred))
prob_high=1-1/(1+exp(gross_pred))

gross_high_pred = prob_high>0.5

pred=as.numeric(gross_high_pred)

true=validation$gross_high

sum(pred == true)/length(true)

# (Null deviane - Residual Deviance) / Null Deviane

# interpretation is not straightforward


# entropy

# decision tree
#install.packages('rpart')
library('rpart')
fit = rpart(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
               Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="class",
             data=train,cp=0.005)



# cp is the "minimum benefit" that a split must add to the tree. 
# If the split doesn't yield at least that much benefit 
# the smaller cp is, the larger the tree is.
plot(fit)
text(fit, pretty=2)

# install.packages('rpart.plot')
library('rpart.plot')
rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)

validation_dt=validation[,c('budget_log','country_num','Sequel','TopActor','TopDirectors','competition','Drama','Crime','Thriller','Action','History','War','Western','Sci.Fi','Horror','BigSix','independent.film')]
# prediction
pred_dt = predict(fit, validation_dt, type = 'class')

# accuracy
sum(pred_dt==validation$gross_high)/length(validation$gross_high)


####################################################################################



fit <- rpart(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
               Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="class",
             data=train,cp=0.001)

rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)

pred_dt = predict(fit, validation_dt, type = 'class')
sum(pred_dt==validation$gross_high)/length(validation$gross_high)

# the smaller cp is, the more complicated the tree is.
attach(mtcars)
par(mfrow=c(1,2))
fit <- rpart(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
               Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="class",
             data=train,cp=0.01)

rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)


fit <- rpart(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
               Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="class",
             data=train,cp=0.005)
rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)


# pruning
fit <- rpart(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
               Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="class",
             data=train,cp=0.001)

fit2=prune(fit, cp=0.005)


rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)

rpart.plot(fit2, box.palette="RdBu", shadow.col="gray", nn=TRUE)

pred_dt = predict(fit, validation_dt, type = 'class')

sum(pred_dt==validation$gross_high)/length(validation$gross_high)



pred_dt = predict(fit2, validation_dt, type = 'class')

sum(pred_dt==validation$gross_high)/length(validation$gross_high)








# continuous case

fit <- rpart(gross_log~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
               Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,method="anova",
             data=train,cp=0.01)


rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)


pred_dt = predict(fit, validation_dt)


mean((pred_dt-validation$gross_log)^2)

# pruning

fit=prune(fit, cp= 0.1)


rpart.plot(fit, box.palette="RdBu", shadow.col="gray", nn=TRUE)


pred_dt = predict(fit, validation_dt)


mean((pred_dt-validation$gross_log)^2)




# random forest
# random sample and features
#install.packages('randomForest')
library(randomForest)
# set.seed
set.seed(1235436)
runif(10,0,1)

my_forest1 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                            Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                          data=train,importance=T)

importance(my_forest1,type=1)

p_forest=predict(my_forest1,validation_dt)

sum(p_forest==validation$gross_high)/length(validation$gross_high)

# Ntree: Number of trees to grow. 
# Mtry: Number of variables randomly sampled as candidates at each split.
# By default, number of trees is 500 and number of variables tried at each split is 2
set.seed(123)
my_forest1 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                            Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                          data=train,ntree=600,mtry=4,importance=T)

p_forest=predict(my_forest1,validation_dt)
sum(p_forest==validation$gross_high)/length(validation$gross_high)

# for loop
ntree_v=c(400,500,600)
mtry_v=c(2,3,4,5,6)
tree_accuracy=c()

for(i in ntree_v){
  for(j in mtry_v){
    set.seed(123)
    my_forest1 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                                Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                              data=train,ntree=i,mtry=j,importance=T)
    p_forest=predict(my_forest1,validation_dt)
    x=sum(p_forest==validation$gross_high)/length(validation$gross_high)
    tree_accuracy=c(tree_accuracy,x)
  }
}

which.max(tree_accuracy)


set.seed(123)

my_forest1 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                            Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                          data=train,ntree=600,mtry=5,importance=T)
p_forest=predict(my_forest1,validation_dt)

sum(p_forest==validation$gross_high)/length(validation$gross_high)

