setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\100% Stacked Bar Chart")
#load libraries
library(tidyverse)
library(paletteer)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#modify the data
#add a column that computes month as a string
superstore<-superstore%>%mutate(month=month(Order.Date, label =TRUE))

#compute sales proportion by region and month
Prtions<-superstore%>%group_by(month, Region)%>%
  summarise(sales = sum(Sales))%>%
  mutate(pr=sales/sum(sales))%>%
  mutate(percent=formattable::percent(pr))

#create 100% stacked bar chart
stck<-Prtions%>%ggplot(aes(x =month, y = percent, fill =Region))+
  geom_bar(stat = "identity", position = "stack")+
  scale_y_continuous(labels = percent_format())+
    scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Sales Breakdown by Region",
       caption = "Visualization by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray50"),
        axis.ticks = element_line(color = "gray50"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.position = "top",
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray30"),
        plot.caption = element_text(family = "serif", face = "italic", size = 8),
  )

#save 100% stacked bar plot
ggsave(plot = stck, filename = "Rplot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#load plotly library
library(plotly)

#create 100% bar chart with plotly
superstore%>%mutate(month=month(Order.Date, label =TRUE))%>%
  group_by(month, Region)%>%
  summarise(sales = sum(Sales))%>%
  mutate(pr=sales/sum(sales)*100)%>%
  plot_ly(x = ~month, y= ~pr, color = ~Region, type = "bar")%>%
  layout(barmode = "stack",
         title = "100% Stacked Bar Plot",
         xaxis = list(title = "Months"),
         yaxis = list(title = "Percent"))
