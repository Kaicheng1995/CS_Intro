# Scrape movie list
install.packages('rvest')
install.packages('stringr')
install.packages('dplyr')

library('rvest')
library('stringr')
library('dplyr')

# download page info
imdb = read_html('https://www.imdb.com/title/tt4154756/')

director = imdb %>%
  html_nodes(".summary_text+ .credit_summary_item a") %>%
  html_text()

budget = imdb %>%
  html_nodes("#titleDetails .txt-block:nth-child(12)") %>%
  html_text()

str_sub(budget,22,-34)
