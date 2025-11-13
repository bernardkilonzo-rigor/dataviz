#load libraries
library(tidyverse)
library(zoo)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting month year from order date
superstore<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))

#Creating area chart
ap<-superstore%>%ggplot(aes(x = my, y =Sales))+
  geom_area(stat = "summary", fun = sum, fill ="gray90",
            color ="gray28", linewidth = 0.7)+
  labs(title = "Total Revenue by Month",
       caption = "Viz by: Bernard Kilonzo",
       x = "Months", y = "Revenue")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray60"),
        axis.text = element_text(family = "serif", size = 8),
        axis.title = element_text(family = "serif", size = 10),
        plot.title = element_text(family = "serif", face = "bold",color = "gray28" ,size = 12),
        plot.caption = element_text(family = "serif", size = 8))

#save plot
ggsave(plot = ap, filename = "area_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#load plotly library
library(plotly)

#Getting the data ready
sample_data<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))%>%
  group_by(my)%>%
  summarise(sales = sum(Sales))

#creating area chart with plotly library
sample_data%>%plot_ly(x = ~my, y = ~sales, type = "scatter", mode = "lines",
                      fill = "tozeroy", line = list(color = "steelblue"))%>%
  layout(title = list(text = "<b>Revenue by Month Year</b>"),
         xaxis = list(title = "<b>Month Year</b>"),
         yaxis = list(title = "<b>Revenue</b>"))
