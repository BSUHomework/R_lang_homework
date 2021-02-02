# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)
library(anytime)
library(scales)
# Load dataset from github
data <- read.csv("https://raw.githubusercontent.com/BSUHomework/R_lang_homework/main/Rlang_study/data-QWWky_format.csv", header=T)
data$Jahr2=paste(data$Jahr, "-01-01", sep="")
data$date <- as.Date(data$Jahr2,'%Y')
# Usual area chart
p <- data %>%
  ggplot( aes(x=date, y=stimmberechtigt/100)) +
  geom_area(fill="#02B7E6", alpha=0.5) +
  geom_line(color="blue")  +
  theme_ipsum()+
  scale_x_date(breaks=date_breaks("10 years"),labels=date_format("%Y"),limits = as.Date(c("1870-01-01","2020-01-01")))+
  scale_y_continuous(labels = percent,breaks = seq(0, 2, by = 0.1),limits = c(0,1) )+
  annotate("segment", x = anydate("1968-01-01"), xend = anydate("1966-01-01"), y = 0.59, yend = 0.61,col="blue",size=0.5,arrow = arrow())+
  annotate("text",x=anydate("1947-01-01") ,y=0.65,label="Rights to vote: \n women and people on welfare ")+
  annotate("segment", x = anydate("1977-01-01"), xend = anydate("1977-01-01"), y = 0.51, yend = 0.55,col="blue",size=0.5,arrow=arrow())+
  annotate("text",x=anydate("1997-01-01") ,y=0.52,label="Right to vote Swiss abroad ")+
  annotate("segment", x = anydate("1991-01-01"), xend = anydate("1991-01-01"), y = 0.77, yend = 0.73,col="blue",size=0.5,arrow=arrow())+
  annotate("text",x=anydate("1997-01-01") ,y=0.80,label="Right to vote 18 ")
# Turn it interactive with ggplotly
p <- ggplotly(p) 

p



