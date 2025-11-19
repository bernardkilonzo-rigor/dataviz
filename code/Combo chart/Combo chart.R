#load libraries
library(tidyverse)
library(scales)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#extracting the month from Order.Date
superstore<-superstore%>%mutate(Order.Date=dmy(Order.Date))%>%
  mutate(mon = month(Order.Date, label = TRUE))

#creating a combo chart (line + column chart)
lcc<-superstore%>%ggplot(aes(x = mon))+
  geom_bar(aes(y = Sales, fill = "Sales"), stat = "summary", fun = sum, width = 0.5)+
  geom_line(aes(y = Profit, color = "Profit",group = 1), stat = "summary", fun = sum, linewidth = 1)+
  scale_color_manual(values = c("Profit"="steelblue"))+
  scale_fill_manual(values = c("Sales"="lightblue"))+
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

#save line + column chart
ggsave(plot = lcc, filename = "Line_column_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)

#create a combo chart (Line + stacked columns)
lsc<-superstore%>%ggplot(aes(x = mon))+
  geom_bar(aes(y = Sales, fill = Category), stat = "summary", fun = sum,position = "stack", width = 0.5, alpha = 0.8)+
  geom_line(aes(y = Profit, color = "Profit",group = 1), stat = "summary", fun = sum, linewidth = 1.1)+
  scale_color_manual(values = c("Profit"="steelblue"))+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  scale_y_continuous(labels = comma)+
  labs(title = "Tracking Sales and Profit",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month", y = "Value", fill = "Category", color = NULL)+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.title = element_text(family = "serif", size = 10, color = "gray25"),
        plot.title = element_text(family = "serif", face = "bold",size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))

#save line + stacked columns
ggsave(plot = lsc, filename = "Line_stacked_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating a combo chart (line + clustered columns)
lccc<-superstore%>%ggplot(aes(x = Region))+
  geom_bar(aes(y = Sales, fill = Category), stat = "summary", fun = sum,position = "dodge", width = 0.5, alpha = 0.8)+
  geom_line(aes(y = Profit, color = "Profit",group = 1), stat = "summary", fun = sum, linewidth = 1.5)+
  scale_color_manual(values = c("Profit"="steelblue"))+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  scale_y_continuous(labels = comma)+
  labs(title = "Tracking Sales and Profit",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month", y = "Value", fill = "Category", color = NULL)+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.title = element_text(family = "serif", size = 10, color = "gray25"),
        plot.title = element_text(family = "serif", face = "bold",size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))

#save line + clustered columns
ggsave(plot = lccc, filename = "Line_clustered_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating a combo chart (area + column chart)
acc<-superstore%>%ggplot(aes(x = mon))+
  geom_area(aes(y = Profit, fill = "Profit",group = 1), stat = "summary", fun = sum)+
  geom_bar(aes(y = Sales, fill = "Sales"), stat = "summary", fun = sum, width = 0.5)+
  scale_fill_manual(values = c("Sales"="steelblue","Profit"="lightblue"))+
  scale_y_continuous(labels = comma)+
  labs(title = "Tracking Sales and Profit",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month", y = "Value", fill = NULL, color = NULL)+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold",size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))

#save area + column chart
ggsave(plot = acc, filename = "Area_column_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating a combo chart (line + area chart)
lac<-superstore%>%ggplot(aes(x = mon))+
  geom_area(aes(y = Sales, fill = "Sales", group = 1), stat = "summary", fun = sum)+
  geom_line(aes(y = Profit, color = "Profit",group = 1), stat = "summary", fun = sum, linewidth = 1.2)+
  scale_fill_manual(values = c("Sales"="lightblue"))+
  scale_color_manual(values = c("Profit"="steelblue"))+
  scale_y_continuous(labels = comma)+
  labs(title = "Tracking Sales and Profit",
       caption = "Viz by: Bernard Kilonzo",
       x = "Month", y = "Value", fill = NULL, color = NULL)+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold",size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", size = 9, color = "gray30"))


#save line + area chart
ggsave(plot = lac, filename = "Line_area_chart.png",
       width = 8, height = 6, units = "in", dpi = 300) 

#load plotly library
library(plotly)

#preparing sample dataset
sample_data<-superstore%>%mutate(Order.Date=dmy(Order.Date))%>%
  mutate(mon = month(Order.Date, label = TRUE))%>%
  group_by(mon)%>%
  summarise(sales = sum(Sales), profit = sum(Profit))

#creating combo chart (bar+line) in plotly
sample_data%>%plot_ly()%>%
  add_bars(x = ~sample_data$mon, y = ~sample_data$sales, name = "Sales")%>%
  add_lines(x = ~sample_data$mon, y = ~sample_data$profit, name = "Profit")
