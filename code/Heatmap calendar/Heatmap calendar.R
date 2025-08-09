setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Heatmap calendar")
#load libraries
library(tidyverse)
library(calendar)
library(paletteer)
library(ggthemes)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#convert order date to a date object
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#Computing the required fields
superstore<-superstore%>%filter(year(Order.Date)==2020)%>%
  mutate(month = month(Order.Date, label = TRUE),
  weekday =wday(Order.Date, label = TRUE),
  week = isoweek(Order.Date))

#creating heat map calendar
superstore%>%ggplot(aes(x = weekday, y = week, fill = Discount))+
  geom_tile(color = "white")+
  facet_wrap(~month,scales = "free", ncol = 3)+
  scale_fill_gradientn(colors = paletteer_c("ggthemes::Temperature Diverging", 30))+
  labs(title = "Heatmap Calendar",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title = element_blank(),
        axis.text.x.bottom = element_text(family = "serif", size = 8, color = "gray30"),
        axis.ticks.x = element_line(linewidth = 0.2, color = "gray35"),
        axis.ticks.length.x = unit(0.05,"cm"),
        legend.title = element_text(family = "serif", face="bold", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", color = "gray20", size = 13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray35", size = 9))
  