setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Histogram")

#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create a basic histogram graph
superstore%>%filter(Sales<500)%>%ggplot(aes(x = Sales))+
  geom_histogram(binwidth = 20, color="gray50",linewidth =0.1, fill ="white")+
  scale_x_continuous(limits = c(0,NA), expand = c(0,0))+
  scale_y_continuous(limits = c(0,NA), expand = c(0,0))+
  labs(title = "Histogram Graph", caption = "Viz by Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold",color = "gray30", size = 10),
        axis.text = element_text(family = "serif", color = "gray30", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray45"))
  
