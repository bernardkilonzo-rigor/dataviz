setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Sparkline chart")
#load libraries
library(tidyverse)
library(sparkline) #an html widget for creating sparklines
library(zoo)
library(htmlwidgets)

#load data set
superstore <-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing sales by month
sales_sum <- superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))%>%
  group_by(my)%>%
  summarise(sales = sum(Sales))
  
#1. producing an inline sparkline that works inside Shiny, DT Tables, & HTML Reports
sp<- sparkline(sales_sum$sales,
          type = "line",
          lineColor = "#2C7BE5",
          fillColor = "rgba(44,123,229,0.2)",
          spotColor = "#d9534f",
          minSpotColor = "#5cb85c",
          maxSpotColor = "#f0ad4e")                

#saving the chart
saveWidget(sp, "sparkline.html", selfcontained = TRUE)

#2. create a sparkline chart using ggplot2
sales_sum%>%ggplot(aes(x = my, y = sales))+
  geom_line(color = "#2C7BE5", linewidth =0.7)+
  geom_point(size = 1.5, color = "darkblue")+
  theme_void()

#3. create a sparkline inside a table (DT + Sparkline)