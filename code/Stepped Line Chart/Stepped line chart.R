#load libraries
library(tidyverse)
library(zoo)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing sales by month
sales_summary<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))%>%
  group_by(my)%>%
  summarise(sales = round(sum(Sales),0))

#creating a stepped line chart
slc<-sales_summary%>%ggplot(aes(x = my, y = sales))+
  geom_step(color ="#bfb304", linewidth =1.1)+
  labs(title = "Revenue by Month",
       x = "Month", y = "Revenue", caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.3),
        axis.ticks = element_line(color = "gray30", linewidth = 0.3),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray25"),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        plot.title = element_text(family = "serif", face = "bold",size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = slc, filename = "stepped_line_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)
