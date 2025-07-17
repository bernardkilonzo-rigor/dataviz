#load libraries
library(tidyverse)
library(waffle)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing sales proportions by shipping mode
sales_prop<-superstore%>%group_by(Ship.Mode)%>%
  summarise(sales = sum(Sales))%>%
  mutate(proprtion = sales/sum(sales))%>%
  mutate(percnt = round(proprtion*100,0))

#creating waffle chart
wfc<-sales_prop%>%ggplot(aes(fill =Ship.Mode, values =percnt))+
  geom_waffle(n_rows = 10, color ="white")+
  scale_fill_paletteer_d("rockthemes::electric")+
  labs(title = "Waffle Chart - Proportion of Sales by Shipping Mode",
       caption = "Viz by: Bernard Kilonzo", fill ="Ship Mode")+
  theme(panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray30"),
        plot.caption = element_text(family = "serif", face = "italic",size = 9, color = "gray35"),
        legend.title = element_text(family = "serif",face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"))

#saving the plot
ggsave(plot = wfc, filename = "waffle_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)
