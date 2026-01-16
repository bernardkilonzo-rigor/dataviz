#load libraries
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#compute month values
superstore<-superstore%>%mutate(mon = month(Order.Date,TRUE))

#create a lollipop chart
lp<-superstore%>%group_by(mon)%>%
  summarise(sales = sum(Sales))%>%
  ggplot(aes(y = mon, x = sales))+
  geom_segment(aes(x = 0, xend =sales, y = mon, yend =mon), color = "lightblue", linewidth=1.5)+
  geom_point(size = 6, color = "steelblue")+
  scale_x_continuous(labels = comma)+
  labs(title = "Sales by Month",
       caption = "Viz by: Bernard Kilonzo",
       x = "Sales", y = "Month")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        axis.text = element_text(family = "serif", size = 10, color = "gray25"),
        plot.title = element_text(family = "serif", face = "bold", size = 14, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray50"))

#saving the plot
ggsave(plot = lp, filename = "Lollipop_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#loading plotly library
library(plotly)

#Computing revenue by month
Revenue<-superstore%>%group_by(mon)%>%
  summarise(revenue = sum(Sales))

#creating a lollipop chart with plotly library
plot_ly(data = Revenue)%>%
  add_segments(x = ~revenue, xend = 0,
               y = ~mon, yend = ~mon,
               line =list(color = "gray", width = 3))%>%
  add_markers(x = ~revenue,
              y = ~mon,
              marker = list(size = 15, color = " brown"))
