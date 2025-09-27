setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Control chart")

#load libraries
library(tidyverse)
library(qicharts2)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting month year from order date
superstore<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(week = week(Order.Date))

#computing sales by month year
super_cal<-superstore%>%group_by(week)%>%
  summarise(sales =sum(Sales))%>%
  mutate(mean = mean(sales),
            sd = sd(sales),
            ucl = mean(sales)+2*sd,
            lcl = mean(sales)-2*sd)

#create control chart
qc<-qic(sales,data = super_cal, chart="xbar")
qc

#formatting
qc +
  geom_hline(yintercept = super_cal$ucl, linetype = "dashed", color = "red") +
  geom_hline(yintercept = super_cal$lcl, linetype = "dashed", color = "blue") +
  geom_hline(yintercept = super_cal$mean,  linetype = "solid",  color = "black") +
  labs(title = "Control Chart with Manual Limits")

