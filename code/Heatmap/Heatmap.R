setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Heatmap")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing profit by month and sub.category 
profit_summary<-superstore%>%mutate(mon = month(Order.Date, label=TRUE))%>%
  group_by(Sub.Category,mon)%>%
  summarise(profit = round(sum(Profit),0))

#creating heat map
profit_summary%>%ggplot(aes(x = mon, y = Sub.Category, fill = profit))+
  geom_tile(color = "white", lwd =0.1)+
  scale_fill_gradient2(low = "red", mid = "gray90", high = "green", midpoint = 0)
