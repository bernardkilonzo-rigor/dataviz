#load libraries
library(tidyverse)
library(paletteer)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting months as integers from order date
superstore<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(month = month(Order.Date))

#Stacked area chart
sp<-superstore%>%ggplot(aes(x = month, y = Sales, fill = Region))+
  geom_area(stat = "summary", fun =sum, position = "stack", alpha = 0.8)+
  scale_y_continuous(labels = comma)+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Monthly Sales by Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45"),
        axis.title = element_text(family = "serif", size = 10, color = "gray40"),
        axis.text = element_text(family = "serif", size = 9, color = "gray40"),
        legend.title = element_text(family = "serif", size = 10, color = "gray40"),
        legend.text = element_text(family = "serif", size = 10, color = "gray40"),
        plot.title = element_text(family = "serif",face = "bold", size = 12, color = "gray35"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))

#saving the plot
ggsave(plot = sp, filename = "stacked_area_plot.png",
       width = 8, height = 6, units = "in", dpi = 300) 

#Unstacked area chart
uap<-superstore%>%ggplot(aes(x = month, y = Sales, fill = Region))+
  geom_area(stat = "summary", fun =sum, position = "dodge", alpha = 0.3)+#assigned position as "dodge"
  scale_y_continuous(labels = comma)+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Monthly Sales by Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45"),
        axis.title = element_text(family = "serif", size = 10, color = "gray40"),
        axis.text = element_text(family = "serif", size = 9, color = "gray40"),
        legend.title = element_text(family = "serif", size = 10, color = "gray40"),
        legend.text = element_text(family = "serif", size = 10, color = "gray40"),
        plot.title = element_text(family = "serif",face = "bold", size = 12, color = "gray35"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))

#saving the plot
ggsave(plot = uap, filename = "unstacked_area_plot.png",
       width = 8, height = 6, units = "in", dpi = 300) 

#100% stacked area chart
#computing the proportions
data_cal<-superstore%>%group_by(month, Region)%>%
  summarise(sales = sum(Sales))%>%
  mutate(prnt = sales/sum(sales))%>%
  mutate(percent = formattable::percent(prnt))

#creating the plot
sap<-data_cal%>%ggplot(aes(x = month, y = percent, fill = Region))+
  geom_area(stat = "identity", position = "stack", alpha =0.8)+
  scale_y_continuous(labels = percent_format())+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Proportion of Sales by Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45"),
        axis.title = element_text(family = "serif", size = 10, color = "gray40"),
        axis.text = element_text(family = "serif", size = 9, color = "gray40"),
        legend.title = element_text(family = "serif", size = 10, color = "gray40"),
        legend.text = element_text(family = "serif", size = 10, color = "gray40"),
        plot.title = element_text(family = "serif",face = "bold", size = 12, color = "gray35"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))

#saving the plot
ggsave(plot = sap, filename = "100%_stacked_area_plot.png",
       width = 8, height = 6, units = "in", dpi = 300) 

