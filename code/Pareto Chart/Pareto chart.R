setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Pareto Chart")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing sales by State
state_sales<-superstore%>%
  group_by(State)%>%
  summarise(sales =sum(Sales))

#Sorting and computing cumulative percentage
state_sales<-state_sales%>%
  arrange(desc(sales))%>%
  mutate(cum_sales =cumsum(sales),
         cum_perc = cum_sales/sum(sales)*100)

#creating pareto chart in ggplot2

