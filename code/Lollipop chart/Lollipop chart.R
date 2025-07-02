#load libraries
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#compute month values
superstore<-superstore%>%mutate(mon = month(Order.Date,TRUE))

#create a lollipop chart
superstore%>%group_by(mon)%>%
  summarise(sales = sum(Sales))%>%
  ggplot(aes(y = mon, x = sales))+
  geom_segment(aes(x = 0, xend =sales, y = mon, yend =mon), color = "gray70", linewidth=1.5)+
  geom_point(size = 6, color = "brown")+
  scale_x_continuous(labels = comma)+
  labs(title = "Sales by Month",
       caption = "Viz by: Bernard Kilonzo",
       x = "Sales", y = "Month")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        axis.text = element_text(family = "serif", size = 10, color = "gray25"),
        plot.title = element_text(family = "serif", face = "bold", size = 14, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray50"))
  
