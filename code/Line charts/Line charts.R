#load libraries
library(tidyverse)
library(paletteer)
library(zoo)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting month year from order date
superstore<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))

#creating a basic line chart
lp<-superstore%>%ggplot(aes(x = my, y = Sales))+
  geom_line(stat = "summary", fun = sum, linewidth =1.0, color = "brown")+
  labs(title = "Revenue by Month",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month")+
  theme(panel.background = element_blank(),
        panel.grid.major.y = element_line(color = "gray90", linewidth = 0.1),
        axis.line = element_line(color = "gray20", linewidth =0.1),
        axis.title = element_text(family = "serif", size = 10),
        axis.text = element_text(family = "serif", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 12),
        plot.caption = element_text(family = "serif", face = "italic", size = 8))

#save line plot
ggsave(plot = lp, filename = "basic_line_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating multiple line plot
mlp<-superstore%>%ggplot(aes(x = my, y = Sales, color =Region))+
  geom_line(stat = "summary", fun = sum, linewidth =0.8, alpha =0.9)+
  scale_color_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Monthly Revenue by Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month")+
  theme(panel.background = element_blank(),
        panel.grid.major.y = element_line(color = "gray90", linewidth = 0.1),
        axis.line = element_line(color = "gray20", linewidth =0.1),
        axis.title = element_text(family = "serif", size = 10),
        axis.text = element_text(family = "serif", size = 9),
        legend.title = element_text(family = "serif", size = 10),
        legend.text = element_text(family = "serif", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 12),
        plot.caption = element_text(family = "serif", face = "italic", size = 8))

#save multiple line plot
ggsave(plot = mlp, filename = "multiple_line_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#load plotly library
library(plotly)

#Get the data ready
Sample_data<-superstore%>%mutate(Order.Date = dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))%>%
  group_by(my)%>%
  summarise(sales =sum(Sales))


