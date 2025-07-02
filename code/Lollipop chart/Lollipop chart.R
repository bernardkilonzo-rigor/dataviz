#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#compute month values
superstore<-superstore%>%mutate(mon = month(Order.Date,TRUE))

#create a lollipop chart
superstore%>%group_by(mon)%>%
  summarise(sales = sum(Sales))%>%
  ggplot(aes(x = mon, y = sales))+
  geom_segment(aes(x = mon, xend =mon, y = 0, yend =sales))+
  geom_point()
