setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Diverging barplot")
#load libraries
library(tidyverse)

#load data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#Summarizing performance by month for the two years
superstore%>%mutate(mon = month(Order.Date, label = TRUE))%>%
  group_by(mon)%>%
  summarise(sales_2019 =sum(ifelse(year(Order.Date)==2019, Sales,0)),
            sales_2020 =sum(ifelse(year(Order.Date)==2020, Sales,0)))
