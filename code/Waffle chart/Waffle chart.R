setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Waffle chart")
#load libraries
library(tidyverse)
library(waffle)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing sales proportions by shipping mode
sales_prop<-superstore%>%group_by(Ship.Mode)%>%
  summarise(sales = sum(Sales))%>%
  mutate(proprtion = sales/sum(sales))%>%
  mutate(percnt = round(proprtion*100,0))

#creating waffle chart
sales_prop%>%ggplot(aes(fill =Ship.Mode, values =percnt))+
  geom_waffle(n_rows = 10, color ="white")+
  scale_fill_paletteer_d("rockthemes::electric")+
  labs(title = "Waffle Chart - Proportion of Sales by Shipping Mode",
       caption = "Viz by: Bernard Kilonzo", fill ="Ship Mode")+
  theme_void()
