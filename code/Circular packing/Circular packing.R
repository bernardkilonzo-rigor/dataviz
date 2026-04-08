setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Circular packing")

#load libraries
library(tidyverse)
library(packcircles)

#load data set
superstore <-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing total sales by state
state_sales <- superstore %>%
 group_by(State)%>%
  summarise(sales =sum(Sales))

