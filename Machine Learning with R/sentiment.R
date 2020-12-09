# https://github.com/trinker/sentimentr

train <- read.csv("~/Dropbox/PhD/Year 6/Online Teaching/Movie/Data/train.csv",stringsAsFactors = F)
train <- read.csv("/Users/ares/Desktop/科研/Lecture 2/Lecture2 code/train.csv",stringsAsFactors = F)

#install.packages('sentimentr')
install.packages('sentimentr')
library(sentimentr)
#Sentiment at the sentence level
train$StoryLine[1:2]
x=sentiment(train$StoryLine)
x[1:10,]

# Aggregated sentiment by group
x=sentiment_by(train$StoryLine)
# word_count - The word count of the review
# sd - The standard deviation of the sentiment score of the sentences in the review
# ave_sentiment - The average sentiment score of the sentences in the review
x[1:10,]
x$word_count[1:10]
x$sd[1:10]
train$sentiment=x$ave_sentiment

plot(x)

reg=lm(RateScore~sentiment+budget+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
                   Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix, data=train)
summary(reg)

# emotion detection (16 different emotions)
# sentence level
x=emotion(train$StoryLine)
x[1:40,]
# group level
x=emotion_by(train$StoryLine)
x[1:20,]
# ave_emotion: A score of the percentage of emotion words of that emotion_type
plot(x)

emotions=matrix(x$ave_emotion,dim(train)[1],16,byrow = T)

colnames(emotions)=x$emotion_type[1:16]
train=cbind(train,emotions)


reg=lm(RateScore~budget+country_num+Sequel+TopActor+TopDirectors+competition+Drama+Crime+
         Thriller+Action+History+War+Western+Sci.Fi+Horror+BigSix+anger+anger_negated+anticipation+
         anticipation_negated+disgust+disgust_negated+fear+fear_negated+joy+joy_negated+sadness+
         sadness_negated+surprise+surprise_negated+trust+trust_negated, data=train)
summary(reg)
