setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Error bars")

#load libraries
library(tidyverse)

#loading data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#prepating sample dataset
computed_data<-superstore%>%
  group_by(Sub.Category)%>%
  summarise(mean = mean(Sales), se =sd(Sales))

#creating error bars for grouped data
superstore%>%ggplot(aes(y = Sub.Category, x = Sales))+
  geom_bar(stat = "summary", fun = mean)+
  geom_errorbar(aes(xmin = mean-se, xmax = mean+se))
