setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Jitter Box Plots")

#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating jitter box plot
superstore%>%filter(Region=="East")%>%ggplot(aes(y = State, x = Quantity, color = State))+
  stat_boxplot(geom = "errorbar",width =0.4)+
  geom_boxplot(outlier.color = NA)+#removing the outliers
  geom_jitter(size =0.7)
