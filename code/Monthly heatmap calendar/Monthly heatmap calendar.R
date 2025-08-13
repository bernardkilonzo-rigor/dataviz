#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#convert Order Date into a date object
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#computing the required data (period of interest is December 2020)
calendar_data<-superstore%>%
  filter(year(Order.Date)==2020, month(Order.Date)==12)%>%
  mutate(month = month(Order.Date, label = TRUE),
  weekday =wday(Order.Date, label = TRUE),
  day = day(Order.Date),
  week = floor_date(Order.Date, unit = "week", week_start = 7))
  
#computing total sales by order date 
calendar_grouped<-calendar_data%>%select(Order.Date,month,week,weekday,day,Sales)%>%
  group_by(Order.Date, month,week,weekday,day)%>%
  summarise(total_sales = sum(Sales))

#creating monthly heat map calendar
mhmc<-calendar_grouped%>%ggplot(aes(x = weekday, y = week, fill = total_sales))+
  geom_tile(color = "white")+
  geom_text(aes(label = day), size =3, color = "black")+
  scale_fill_distiller(palette = "YlOrRd", direction = 1)+
  labs(title = "Monthly Heatmap Calendar",
       caption = "Viz by: Bernard Kilonzo", fill ="Sales",
       x = "Weekday", y = "Week")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray35"),
        axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        axis.ticks = element_line(color = "gray35"),
        legend.title = element_text(family = "serif",face ="bold", size = 10, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray35"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray50"))

#saving the plot
ggsave(plot = mhmc, filename = "monthly_heatmap_calendar.png",
       width = 8, height = 6, units = "in", dpi = 300)
