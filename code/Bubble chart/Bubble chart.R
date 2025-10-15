setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Bubble chart")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating bubble chart
superstore%>%ggplot(aes(x = Sales, y = Profit, size = Discount, color = Profit))+
  geom_point(alpha = 0.5)+
  labs(title = "Bubble Plot")
