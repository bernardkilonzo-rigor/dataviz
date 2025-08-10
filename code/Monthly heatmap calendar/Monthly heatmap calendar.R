setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Monthly heatmap calendar")
#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#convert Order Date into a date object
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#computing the required data
