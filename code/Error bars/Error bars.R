#load libraries
library(tidyverse)

#loading data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#preparing sample data set
computed_data<-superstore%>%
  group_by(Sub.Category)%>%
  summarise(mean = mean(Sales), se =sd(Sales)/sqrt(n()))

#creating error bars for grouped data
computed_data%>%ggplot(aes(y = Sub.Category, x = mean))+
  geom_bar(stat = "identity", fill = "gray70")+
  geom_errorbar(aes(xmin = mean-se, xmax = mean+se))+
  labs(title = "Error Bars Plot", x = "Mean", y = "Sub Category")+
  theme(
    panel.background = element_blank(),
    axis.ticks = element_line(color = "gray50", linewidth =0.1),
    axis.line = element_line(color = "gray50", linewidth =0.1)
  )
