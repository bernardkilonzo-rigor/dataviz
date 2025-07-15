setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Histogram")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create a basic histogram graph
superstore%>%filter(Sales<500)%>%ggplot(aes(x = Sales))+
  geom_histogram(binwidth = 20, color=1,linewidth =0.1, fill ="white")
   
