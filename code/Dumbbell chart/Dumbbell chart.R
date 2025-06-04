setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\Dumbbell")
#load libraries
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#Summarizing Sales and Profit by Sub.Category
superstore_v1<-superstore%>%group_by(Sub.Category)%>%
  summarise(sales = sum(Sales), profit = sum(Profit))

#creating the plot
ggplot(superstore_v1)+
  geom_segment(aes(x = profit, xend = sales, y = Sub.Category, yend =Sub.Category),color = "gray65")+
  geom_point(aes(x = profit, y = Sub.Category,color ="profit"), size =4)+
  geom_point(aes(x = sales, y = Sub.Category,color = "sales"), size = 4)+
  scale_color_manual(values = c("sales"="steelblue","profit"="brown"))+
  scale_x_continuous(labels = comma)+
labs(title = "Sales and Profit Comparison by Sub-Category",
       caption = "Viz by: Bernard Kilonzo",
       x = "value", y = "Sub-Category", color = "Metric")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45"),
        axis.ticks = element_line(color = "gray45"),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        axis.title = element_text(family = "serif", color = "gray25", size = 10),
        legend.text = element_text(family = "serif", color = "gray35", size = 9),
        legend.title = element_text(family = "serif", color = "gray25", size = 10),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray25"))


#Option II (using ggalt package)
install.packages("ggalt")
library(ggalt)

#creating the plot using ggalt package
superstore_v1%>%ggplot(aes(x = profit, xend = sales, y = Sub.Category))+
  geom_dumbbell(color = "gray", size =3,
                colour_x="brown", colour_xend ="steelblue")+
  scale_x_continuous(labels = comma)+
labs(title = "Sales and Profit Comparison by Sub-Category",
       x = "value", y = "Sub-Category", caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.3),
        axis.ticks = element_line(color = "gray45", linewidth = 0.3),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        axis.title = element_text(family = "serif", color = "gray25", size = 10),
        plot.title = element_text(family = "serif", face = "bold", size = 14, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#Dumbbell chart comparing more than two values

#summarizing sales, profit and quantity by Region
superstore_v2<-superstore%>%group_by(Region)%>%
  summarise(sales = sum(Sales), profit = sum(Profit), quantity = sum(Quantity))

#shaping the data through pivoting
superstore_v2<-superstore_v2%>%
  pivot_longer(sales:quantity, names_to = "group", values_to = "values")

#creating the plot
superstore_v2%>%ggplot(aes(x = values, y = Region, color = group))+
  geom_line(aes(group = Region), color = "gray")+
  geom_point(size = 5)+
  scale_color_manual(values = c("brown","#72874e","steelblue"))+
  scale_x_continuous(labels = comma)+
labs(title = "Profit vs. Sales vs. Quantity by Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "value", y = "Region", color ="Metrics")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.3),
        axis.ticks = element_line(color = "gray45"),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        axis.title = element_text(family = "serif",face = "bold",color = "gray35", size = 10),
        legend.text = element_text(family = "serif", color = "gray35", size = 9),
        legend.title = element_text(family = "serif", color = "gray35", size = 10),
        plot.title = element_text(family = "serif", face = "bold", color = "gray25", size = 14),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray35", size = 9))
  
