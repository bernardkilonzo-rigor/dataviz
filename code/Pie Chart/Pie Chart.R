setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Pie Chart")
#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing data
super_computed<-superstore%>%group_by(Region)%>%
  summarise(discount =round(mean(Discount),2))

#create pie chart
super_computed%>%ggplot(aes(x ="", y = discount, fill = Region))+
  geom_col()+
  geom_text(aes(label = discount), position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y")+
  scale_fill_paletteer_d("wesanderson::Chevalier1")+
  labs(title = "Order's Discount by Region",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks= element_blank(),
        legend.title = element_text(family = "serif",face = "bold",size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", color = "gray25", size =13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray40", size = 9))
