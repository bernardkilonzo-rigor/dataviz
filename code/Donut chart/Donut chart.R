#load libraries
library(tidyverse)
library(paletteer)
library(formattable)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing sales by product segment
sales_summ<-superstore%>%group_by(Segment)%>%
  summarise(sales =round(sum(Sales),0))

#creating a donut chart
donut<-sales_summ%>%ggplot(aes(x = 3, y = sales, fill =Segment))+
  geom_col(color ="white")+
  coord_polar(theta = "y")+
  xlim(c(0.2, 3+0.5))+
  geom_label(aes(label = sales),family ="serif",size =3.3,color = "gray15",position = position_stack(vjust = 0.5),
             show.legend = FALSE)+
  scale_fill_paletteer_d("wesanderson::Chevalier1")+
  labs(title = "Revenue by Product Segment",
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
ggsave(plot= donut, filename = "Donut_chart_1.png",
       width = 8, height = 6, units = "in", dpi = 300)

#100% donut chart
#computing percent of sales by product category
sales_per<-superstore%>%group_by(Category)%>%
  summarise(sales =sum(Sales))%>%
  mutate(sales_pro = round(sales/sum(sales),2))%>%
  mutate(sales_percent = formattable::percent(sales_pro))
sales_per

#creating 100% donut chart
donut_1<-sales_per%>%ggplot(aes(x = 3, y = sales_percent, fill =Category))+
  geom_col(color ="white")+
  coord_polar(theta = "y")+
  xlim(c(0.2, 3+0.5))+
  geom_label(aes(label = sales_percent),family ="serif",size =3.3,color = "gray15",position = position_stack(vjust = 0.5),
             show.legend = FALSE)+
  scale_fill_paletteer_d("ltc::trio2")+
  labs(title = "Percent of Revenue by Product Category",
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
ggsave(plot= donut_1, filename = "Donut_chart_2.png",
       width = 8, height = 6, units = "in", dpi = 300)

#loading plotly library
library(plotly)

#creating a donut chart with plotly library
plot_ly(sales_summ,
        labels = ~Segment,
        values = ~sales,
        type ="pie",
        hole = 0.5)
        
