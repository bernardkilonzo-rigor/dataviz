#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#computing rankings
Rank_data<-superstore%>%
  mutate(mon = month(Order.Date, label = TRUE))%>%
  group_by(mon,Region)%>%
  summarise(sales =sum(Sales))%>%
  mutate(rank =dense_rank(desc(sales)))

#creating bump chart
bc<-Rank_data%>%ggplot(aes(x = mon, y = rank, group =Region, color =Region))+
  geom_line(linewidth = 1.0)+
  geom_point(size =5)+
  scale_y_reverse()+
  scale_color_paletteer_d("PrettyCols::Autumn")+
  labs(title = "Bump Chart",
       caption = "Viz by: Bernard Kilonzo",
       x = "Months", y = "Performance Rankings")+
  theme(panel.background = element_blank(),
        axis.ticks = element_line(colour = "gray45"),
        axis.title = element_text(family = "serif", size = 9, color = "gray35"),
        axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray35"),
        legend.position = "top",
        legend.title = element_blank(),
        plot.title = element_text(family = "serif", face = "bold", size = 12, colour = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#Saving the plot
ggsave(plot = bc, filename = "Bump_chart.png",
       width = 8, height = 6, units = "in", dpi = 300) 


