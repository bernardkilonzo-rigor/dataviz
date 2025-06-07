#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#computing sales proportion by month
sales_prop<-superstore%>%mutate(mon = month(Order.Date, label = TRUE))%>%
  group_by(mon)%>%
  summarise(sales = sum(Sales))%>%
  mutate(sale_per =sales/sum(sales))%>%
  mutate(percent_sales = formattable::percent(sale_per))

#adding new column for labelling the visualization (merging months with percentages)
sales_prop<-sales_prop%>%
  mutate(label = paste0(sales_prop$mon,"-",sales_prop$percent_sales))

#ordering labels by percentages
sales_prop$label<-reorder(sales_prop$label, sales_prop$percent_sales)

#creating circular bar plot with ggplot2
sales_prop%>%ggplot(aes(x = label, y = percent_sales, fill = label))+
  geom_bar(width = 0.9, stat = "identity")+
  coord_polar(theta = "y")+
  xlab("")+ylab("")+ylim(c(0,1))+
  geom_text(data = sales_prop, hjust =1, size =2.5,color = "gray30",
            aes(x = label, y = 0, label = label))+
  scale_fill_paletteer_d("beyonce::X88")+
  labs(title = "Proportion of Sales by Month",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_line(colour = "#eeeeee", linewidth = 0.1),
        panel.grid.minor = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "none",
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray10"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))
  
