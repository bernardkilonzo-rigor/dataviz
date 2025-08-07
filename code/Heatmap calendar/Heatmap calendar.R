setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Heatmap calendar")
#load libraries
library(tidyverse)
library(calendar)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")
view(superstore)
#convert order date to a date object
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#Computing required fields
superstore<-superstore%>%mutate(
  month = month(Order.Date, label = TRUE),
  weekday =wday(Order.Date, label = TRUE),
  week = isoweek(Order.Date))

#creating the plot
superstore%>%ggplot(aes(x = weekday, y = week, fill = Sales))+
  geom_tile(color = "white")+
  facet_wrap(~month, ncol = 3)
  