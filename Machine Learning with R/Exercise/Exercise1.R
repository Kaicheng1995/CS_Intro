# 1. order the dataset according to budget. Then plot log(budget) and log(gross) on the same figure
Data_example = read.csv(file=file.choose())

New_data = Data_example[order(Data_example$budget),] 

budget = log(New_data$budget)
gross = log(New_data$gross)

plot(budget,main="Budget and Gross",type="p",xlab="Numbers of Obeservations",ylab="",col="black")
par(new=TRUE)
plot(gross,main="Budget and Gross",type="p",xlab="Numbers of Obeservations",ylab="",col="red")
legend("bottomright",legend=c("Budget","Gross"),col=c("black","red"),bty="n",pch="o")


# 2. Make a plot using log(budget) on the x-axis and log(gross) on the y-axis. 
budget1 = log(Data_example$budget)
gross1 = log(Data_example$gross)

plot(budget1,gross1,main="Budget and Gross",type="p",xlab="Budget",ylab="Gross",col="black")

# 3. Scrape data (more than 100 observations) from any website (yIMDb,yelp, tripadvisor, Expedia, Basketball-Reference.com, etc). 
# Run a regression model to answer a question. (Linear regression, logistics regression, probit regression, etc)

# 爬取链家网上海已成交的二手房，研究房屋售价、面积对售出等待时长的影响。意义在于了解市场需求，优化投资决策，预防资金链断裂。
# 原本想爬电商数据，但遇到很多问题

library('rvest')
library('stringr')
library('dplyr')

names_total = c()
links_total = c()

for(i in 0:19)
{
  page_num = i + 1
  url = paste0('https://sh.lianjia.com/chengjiao/pg',page_num)

  real_estate = read_html(url)

  names = real_estate %>% html_nodes(".info .title a") %>% html_text()
  names_total = c(names_total,names)
  
  links = real_estate %>% html_nodes(".info .title a") %>% html_attr('href')
  links_total = c(links_total,links)
}


period_total = matrix(0,0,2)
price_total = matrix(0,0,2)
area_total = matrix(0,0,2)

for(i in 1:500)
{
  real_estate = read_html(links_total[i])
  
  period = real_estate %>% html_nodes("span:nth-child(2) label") %>% html_text()
  period = cbind(period,names_total[i])
  period_total = rbind(period_total,period)
  
  price = real_estate %>% html_nodes(".dealTotalPrice i") %>% html_text()
  price = cbind(price,names_total[i])
  price_total = rbind(price_total,price)
  
  area = real_estate %>% html_nodes(".base li:nth-child(3)") %>% html_text()
  area = cbind(area,names_total[i])
  area_total = rbind(area_total,area)
}

area_m2 = str_sub(area_total[1:500,1],5,-12)
period_day = period_total
price_w = price_total[1:500,1]

TOTAL = cbind(period_day,price_w,area_m2)

write.csv(TOTAL,'period_forecast.csv',row.names=F)

Data_example2 = read.csv(file=file.choose())
reg1 = lm(period ~ price_w + area_m2, data = Data_example2)
reg2 = lm(log(period) ~ log(price_w) + log(area_m2), data = Data_example2)

summary(reg1)
summary(reg2)

# 4. Output the results using 'stargazer'

stargazer(reg1,reg2,title="Results",align=TRUE,type="html",style="qje",out="Results.html")



