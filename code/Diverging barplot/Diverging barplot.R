setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Diverging barplot")
#load libraries
library(tidyverse)

#load data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#computing profit by sub-category in the central region
profitability<-superstore%>%filter(Region=="Central")%>%
  group_by(Sub.Category)%>%
  summarise(profit =sum(Profit))

#classifying data set
profitability$type<-ifelse(profitability$profit >= 0, "Profitable", "Unprofitable")




#Summarizing performance by month for the two years
summary_metrics<-superstore%>%mutate(mon = month(Order.Date, label = TRUE))%>%
  group_by(mon)%>%
  summarise(sales_2019 =sum(ifelse(year(Order.Date)==2019, Sales,0)),
            sales_2020 =sum(ifelse(year(Order.Date)==2020, Sales,0)))