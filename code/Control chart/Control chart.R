setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Control chart")

#load libraries
library(tidyverse)
library(zoo)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting month year from order date
superstore<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))

#computing sales by month year
super_cal<-superstore%>%group_by(my)%>%
  summarise(sales =sum(Sales))

#create control chart
superstore%>%ggplot(aes(x = my, y = Value)) +
  geom_point() + 
  geom_line() +
  stat_QC(method = "XmR", auto.label = TRUE, label.digits = 2, show.1n2.sigma = TRUE) +
  stat_QC(method = "mR") +
  scale_x_continuous(expand = expansion(mult = 0.15))