#load libraries
library(tidyverse)
library(paletteer)
library(formattable)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing data
super_computed<-superstore%>%group_by(Region)%>%
  summarise(discount =round(mean(Discount),2))

#create pie chart
pie<-super_computed%>%ggplot(aes(x ="", y = discount, fill = Region))+
  geom_col(color ="white")+
  geom_text(aes(label = discount),family ="serif",size =3.3,color = "gray15",position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y")+
  scale_fill_paletteer_d("wesanderson::Chevalier1")+
  labs(title = "Average Order's Discount by Region",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks= element_blank(),
        legend.title = element_text(family = "serif",face = "bold",size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", color = "gray25", size =13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray40", size = 9))

#saving the plot
ggsave(plot= pie, filename = "Pie_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)

#100% Pie chart
#computing percent of sales by product category
sales_per<-superstore%>%group_by(Category)%>%
  summarise(sales =sum(Sales))%>%
  mutate(sales_pro = round(sales/sum(sales),2))%>%
  mutate(sales_percent = formattable::percent(sales_pro))

#creating 100% pie chart
pie_1<-sales_per%>%ggplot(aes(x ="", y = sales_percent, fill = Category))+
  geom_col(color ="white")+
  geom_label(aes(label = sales_percent),family ="serif",size =3.3,color = "gray15",position = position_stack(vjust = 0.5),
             show.legend = FALSE)+
  coord_polar(theta = "y")+
  scale_fill_paletteer_d("ltc::trio2")+
  labs(title = "Sales Proportion by Product Category",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks= element_blank(),
        legend.title = element_text(family = "serif",face = "bold",size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", color = "gray25", size =13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray40", size = 9))

#saving the plot
ggsave(plot= pie_1, filename = "Pie_chart_2.png",
       width = 8, height = 6, units = "in", dpi = 300)

#loading plotly library
library(plotly)

#creating pie chart with plotly library
plot_ly(data = super_computed,
        labels = ~Region,
        values = ~discount,
        type = "pie",
        textinfo = "label+percent",
        marker = list(colors = c("steelblue", "pink", "brown", "yellow")))%>%
  layout(title = "Average Discount by Region")
