setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Heatmap calendar")
#load libraries
library(tidyverse)
library(calendar)
library(paletteer)
library(ggthemes)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")
view(superstore)
#convert order date to a date object
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#Computing required fields
superstore<-superstore%>%filter(year(Order.Date)==2020)%>%
  mutate(month = month(Order.Date, label = TRUE),
  weekday =wday(Order.Date, label = TRUE),
  week = isoweek(Order.Date))

#creating heatmap calendar
superstore%>%ggplot(aes(x = weekday, y = week, fill = Discount))+
  geom_tile(color = "white")+
  facet_wrap(~month,scales = "free", ncol = 3)+
  scale_fill_gradientn(colors = paletteer_c("grDevices::RdYlGn", 30))
  