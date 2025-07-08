setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Donut chart")
#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing sales by product segment
sales_summ<-superstore%>%group_by(Segment)%>%
  summarise(sales =round(sum(Sales),0))

#creating a donut chart
sales_summ%>%ggplot(aes(x = 3, y = sales, fill =Segment))+
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
