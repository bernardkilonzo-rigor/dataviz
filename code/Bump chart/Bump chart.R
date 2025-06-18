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

#Adding labels
Rank_data$label<-paste0(Rank_data$rank,"-",Rank_data$Region)

#creating bump chart
bc<-Rank_data%>%ggplot(aes(x = mon, y = rank, group =Region, color =Region))+
  geom_line(linewidth = 1.0)+
  geom_point(size =5)+
  scale_y_reverse()+
  geom_text(data = Rank_data%>%filter(mon=="Jan"), aes(label = label), hjust=0.5,vjust=-1, size =3.5)+
  geom_text(data = Rank_data%>%filter(mon=="Dec"), aes(label = label), hjust=0.5,vjust=-1, size =3.5)+
  scale_color_paletteer_d("PrettyCols::Autumn")+
  labs(title = "Ranking Sales Performance by Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "Months", y = "Rank")+
  theme(panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_text(family = "serif", size = 9, color = "gray35"),
        axis.text.x = element_text(family = "serif", size = 9, color = "gray35"),
        legend.position = "none",
        plot.title = element_text(family = "serif", face = "bold", size = 12, colour = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))


#Saving the plot
ggsave(plot = bc, filename = "Bump_chart.png",
       width = 8, height = 6, units = "in", dpi = 300) 
