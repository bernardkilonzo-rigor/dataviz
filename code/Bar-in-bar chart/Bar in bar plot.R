#load libraries
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#Extract months as strings
superstore<-superstore%>%mutate(Order.Date =dmy(Order.Date))%>%
  mutate(mon = month(Order.Date, label = TRUE))

#Creating bar-in-bar chart comparing Sales and Profit
bbp<-superstore%>%ggplot(aes(x = mon))+
  geom_bar(aes(y = Sales), stat = "summary", fun =sum, fill = "#a4bed5", width = 0.6)+
  geom_bar(aes(y = Profit), stat = "summary", fun = sum, fill = "#476f84", width = 0.3)+
  guides(fill = guide_legend(title = "cate"))+
  scale_y_continuous(labels = comma)+
  labs(title = "Bar-in-Bar Chart Comparing Sales and Profit",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month", y = "Value")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray50"),
        axis.text = element_text(family = "serif",size = 10,color = "gray40"),
        axis.title = element_text(family = "serif", size = 10, color = "gray35"),
        plot.title = element_text(family = "serif", face = "bold", size = 14, color = "gray30"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray35"))

#save plot
ggsave(plot = bbp, filename = "bar_in_bar_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)
