setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Stepped Line Chart")
#load libraries
library(tidyverse)
library(zoo)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing sales by month
sales_summary<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))%>%
  group_by(my)%>%
  summarise(sales = round(sum(Sales),0))

#creating a simple stepped line chart
sales_summary%>%ggplot(aes(x = my, y = sales))+
  geom_step(color ="steelblue", linewidth =1.1)
