setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Waterfall chart")
#load libraries
library(waterfalls)
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing profit by Sub_category
profit_summary<-superstore%>%group_by(Sub.Category)%>%
  summarise(profit = round(sum(Profit),0))

#creating waterfall chart
waterfall(profit_summary, calc_total = TRUE)

