train = read.csv("~/Dropbox/PhD/Year 6/Online Teaching/Movie/Data/train.csv",stringsAsFactors = F)

validation = read.csv("~/Dropbox/PhD/Year 6/Online Teaching/Movie/Data/validation.csv",stringsAsFactors = F)

train$gross_log=log(train$gross)
train$budget_log=log(train$budget)

validation$gross_log=log(validation$gross)
validation$budget_log=log(validation$budget)


gross_median=quantile(log(train$gross),0.5)

train$gross_high=0

train$gross_high[log(train$gross)>gross_median]=1
validation$gross_high=0
validation$gross_high[validation$gross_log>gross_median]=1





# random forest
# random sample and features
install.packages('randomForest')
library(randomForest)
# set.seed
set.seed(123)

my_forest1 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                            Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                              data=train,importance=T)
validation_dt=validation[,c('budget_log','country_num','Sequel','TopActor','TopDirectors','competition','Drama','Crime','Thriller','Action','History','War','Western','Sci.Fi','Horror','BigSix','independent.film')]

importance(my_forest1,type=1)

p_forest=predict(my_forest1,validation_dt)

sum(p_forest==validation$gross_high)/length(validation$gross_high)

# Ntree: Number of trees to grow. 
# Mtry: Number of variables randomly sampled as candidates at each split.
# By default, number of trees is 500 and number of variables tried at each split is 2
set.seed(123)
my_forest2 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                            Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                          data=train,ntree=1000,mtry=4,importance=T)

p_forest=predict(my_forest2,validation_dt)
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

tree_accuracy[2]

set.seed(123)

my_forest1 = randomForest(as.factor(gross_high)~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                            Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+independent.film,
                          data=train,ntree=400,mtry=3,importance=T)
p_forest=predict(my_forest1,validation_dt)

sum(p_forest==validation$gross_high)/length(validation$gross_high)



##########
# Neural Network

#install.packages("neuralnet")
library('neuralnet')
set.seed(123)
nn=neuralnet(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+
               Drama+Crime+Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+
               independent.film,data=train, hidden=3,act.fct = "logistic",linear.output = FALSE)


set.seed(123)

nn=neuralnet(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+
               Drama+Crime+Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+
               independent.film,data=train, hidden=3,act.fct = "logistic",linear.output = FALSE,stepmax=1e6)



# hidden=n: represents single layer with 3 neurons respectively.
# act.fct = "tanh" used for smoothing the output result.
# linear.ouput=FALSE: set FALSE for apply act.fct otherwise TRUE

plot(nn)
Predict=compute(nn,validation_dt)
Predict$net.result
nn_pred=as.numeric(Predict$net.result>0.5)

sum(nn_pred==validation$gross_high)/length(validation$gross_high)


set.seed(123)

nn=neuralnet(gross_high~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+
               Drama+Crime+Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+
               independent.film,data=train, hidden=c(2,3),act.fct = "logistic",linear.output = FALSE,
             stepmax=1e6)

plot(nn)

# continuous case
set.seed(123)

nn1=neuralnet(gross_log~budget_log+country_num+Sequel+TopActor+TopDirectors+competition+
               Drama+Crime+Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+
               independent.film,data=train, hidden=4,stepmax=1e6)

Predict=compute(nn1,validation_dt)
Predict$net.result[1:10]

mean(Predict$net.result-validation$gross_log)^2

# dataset
Loans = read.csv("~/Downloads/Prosper/LoanData/Loans_20130101to20140101.csv",stringsAsFactors = F)
View(Loans)

