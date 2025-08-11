setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Monthly heatmap calendar")
#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#convert Order Date into a date object
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#computing the required data
calendar_data<-superstore%>%
  filter(year(Order.Date)==2020, month(Order.Date)==12)%>%
  mutate(month = month(Order.Date, label = TRUE),
  weekday =wday(Order.Date, label = TRUE),
  day = day(Order.Date),
  week = isoweek(Order.Date))

#creating monthly heatmap calendar
calendar_data%>%ggplot(aes(x = weekday, y = week, fill = Sales))+
  geom_tile(color = "white")+
  geom_text(aes(label = day), size =3, color = "black")+
  scale_fill_distiller(palette = "YlOrRd", direction = 1)

