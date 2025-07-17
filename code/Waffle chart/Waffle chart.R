setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Waffle chart")
#load libraries
library(tidyverse)
library(waffle)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")
view(superstore)
#Compute sales proportions by product category
sales_prop<-superstore%>%group_by(Ship.Mode)%>%
  summarise(sales = sum(Sales))%>%
  mutate(proprtion = sales/sum(sales))%>%
  mutate(percnt = round(proprtion*100,0))

#creating waffle chart
sales_prop%>%ggplot(aes(fill =Ship.Mode, values =percnt))+
  geom_waffle(n_rows = 10)
