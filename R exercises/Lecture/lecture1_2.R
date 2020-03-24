
library('rvest')
library('stringr')
library('dplyr')


#1 提取一个页面上的movies和URL
imdb = read_html('https://www.imdb.com/search/title/?title_type=feature&year=2018-01-01,2018-12-31&sort=num_votes,desc')

names = imdb %>% html_nodes(".lister-item-header a") %>% html_text()
links = imdb %>% html_nodes(".lister-item-header a") %>% html_attr('href')

paste0('http://www.imdb.com',links[1])

#2 提取前10页上的movies和URL
#2.1 首先设置数据存储的仓库，这里用向量c()
names_total = c()
links_total = c()

for(i in 0:9)
{
  page_num = i*50 + 1
  url = paste0('https://www.imdb.com/search/title/?title_type=feature&year=2018-01-01,2018-12-31&sort=num_votes,desc&start=',page_num,'&ref_=adv_nxt')

  imdb = read_html(url)

  names = imdb %>% html_nodes(".lister-item-header a") %>% html_text()
  names_total = c(names_total,names)

  links = imdb %>% html_nodes(".lister-item-header a") %>% html_attr('href')
  links_total = c(links_total,links)
}

length(names_total)
length(links_total)

links_total = paste0('http://www.imdb.com',links_total)


#3 提取每个URL上的director、budget数据
#3.1 设置数据仓库，这里用matrix（）,要根据自己需求选择，我用info做一点改变.这里运行所有500个
director_total = matrix(0,0,2)
budget_total = matrix(0,0,2)

for(i in 1:50)
{
  imdb = read_html(links_total[i])
  
  directors = imdb %>% html_nodes(".summary_text+ .credit_summary_item a") %>% html_text()
  
  director_number = length(directors)
  movie_name = rep(names_total[i],director_number)   #一一对应关系
  
  directors = cbind(directors,movie_name)
  director_total = rbind(director_total,directors)    #不断叠加
  
  
  budget = imdb %>% html_nodes("#titleDetails .txt-block:nth-child(12)") %>% html_text()
  if(identical(budget,character(0)))
  {
    budget = NA
  }
  budget = cbind(budget, names_total[i])
  budget_total = rbind(budget_total, budget)
}

str_sub(budget_total[1:50,1],22,-34)

write.csv(director_total,'Directors.csv',row.names=F)
write.csv(budget_total,'Budget.csv',row.names=F)

