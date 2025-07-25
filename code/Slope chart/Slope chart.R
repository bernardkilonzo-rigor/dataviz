#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#computing years from order date
superstore<-superstore%>% mutate(Order.Date=dmy(Order.Date))%>%
  mutate(yr = year(Order.Date))

#computing ranks by yr & state in east region
Rank_data<-superstore%>%filter(yr>2018, Region=="East")%>%
  group_by(yr,State)%>%
  summarise(sales =round(sum(Sales),0))%>%
  mutate(rank =dense_rank(desc(sales)))

#computing labels
Rank_data$label<-paste0(Rank_data$rank,"-",Rank_data$State,"~",Rank_data$sales)

#creating slope chart
sc<-Rank_data%>%ggplot(aes(x = yr, y = rank, group =State, color =State))+
  geom_line(linewidth = 1.0)+
  geom_point(size =4)+
  scale_y_reverse()+
  scale_color_paletteer_d("palettetown::combusken")+
  geom_text(data = Rank_data%>%filter(yr==2019), aes(label = label), hjust =0.1, vjust=-0.7, size =3)+
  geom_text(data = Rank_data%>%filter(yr==2020), aes(label = label), hjust =0.8, vjust=-0.7, size =3)+
  labs(title = "Ranking Sales by State in East Region",
       caption = "Viz by: Bernard Kilonzo",
       x = "Year", y = "Rank")+
  theme(panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_text(family = "serif", color = "gray35", size = 9),
        axis.title.x = element_text(family = "serif", color = "gray20", size = 10),
        legend.position = "none",
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", color = "gray35", size = 9))

#Saving the plot
ggsave(plot = sc, filename = "Slope_chart.png",
       width = 8, height = 6, units = "in", dpi = 300) 
