setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Balloon plot")

#loading libraries
library(tidyverse)

#loading data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#preparing data set
computed_dat<-superstore%>%
  group_by(Region, Sub.Category)%>%
  summarise(sales = sum(Sales))
