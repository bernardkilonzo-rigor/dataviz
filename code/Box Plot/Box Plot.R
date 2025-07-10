setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Box Plot")
#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create a basic box plot
superstore%>%ggplot(aes(x = Sub.Category, y = Discount))+
  geom_boxplot()
