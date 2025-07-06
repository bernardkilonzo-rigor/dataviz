#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#creating scatter plot
superstore%>%ggplot(aes(x = Sales, y =Profit, size = Discount, color =Profit))+
  geom_point()
