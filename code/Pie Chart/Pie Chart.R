setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Pie Chart")
#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing data
super_computed<-superstore%>%group_by(Region)%>%
  summarise(discount =round(mean(Discount),2))

#create pie chart
super_computed%>%ggplot(aes(x ="", y = discount, fill = Region))+
  geom_col()+
  coord_polar(theta = "y")
