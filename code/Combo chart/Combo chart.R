#load libraries
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#extracting the month from Order.Date
superstore<-superstore%>%mutate(Order.Date=dmy(Order.Date))%>%
  mutate(mon = month(Order.Date, label = TRUE))

#creating a combo chart (line + columns chart)
superstore%>%ggplot(aes(x = mon))+
  geom_bar(aes(y = Sales, fill = "Sales"), stat = "summary", fun = sum, width = 0.5)+
  geom_line(aes(y = Profit, color = "Profit",group = 1), stat = "summary", fun = sum, linewidth = 1)+
  scale_color_manual(values = c("Profit"="brown"))+
  scale_fill_manual(values = c("Sales"="steelblue"))+
  scale_y_continuous(labels = comma)+
  labs(title = "Sales and Profit Performance by Month",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month", y = "Value", fill = NULL, color = NULL)+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold",size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))
