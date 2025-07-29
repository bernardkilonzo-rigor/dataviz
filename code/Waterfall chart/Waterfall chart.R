setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Waterfall chart")
#load libraries
library(waterfalls)
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing values
superstore%>%group_by(Sub.Category)%>%
  summarise(profit = sum(Profit))
