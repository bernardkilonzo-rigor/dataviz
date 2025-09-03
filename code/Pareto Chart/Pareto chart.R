setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Pareto Chart")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing sales by State
state_sales<-superstore%>%
  group_by(State)%>%
  summarise(sales =sum(Sales))
