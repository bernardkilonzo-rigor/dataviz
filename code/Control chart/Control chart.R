setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Control chart")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")




#create control chart
superstore%>%ggplot(aes(x = , y = Value)) +
  geom_point() + 
  geom_line() +
  stat_QC(method = "XmR", auto.label = TRUE, label.digits = 2, show.1n2.sigma = TRUE) +
  stat_QC(method = "mR") +
  scale_x_continuous(expand = expansion(mult = 0.15))