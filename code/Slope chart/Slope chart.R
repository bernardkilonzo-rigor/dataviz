#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#computing years from order date
superstore<-superstore%>%mutate(Order.Date=dmy(Order.Date))%>%
  mutate(yr = year(Order.Date))

#computing ranks by yr & state
Rank_data<-superstore%>%filter(yr>2018)%>%
  group_by(yr,Sub.Category)%>%
  summarise(sales =sum(Sales))%>%
  mutate(rank =dense_rank(desc(sales)))

#computing labels
Rank_data$label<-paste0(Rank_data$rank,"-",Rank_data$Sub.Category)

#creating slope chart
Rank_data%>%ggplot(aes(x = yr, y = rank, group =Sub.Category, color =Sub.Category))+
  geom_line(linewidth = 1.0)+
  geom_point(size =5)+
  scale_y_reverse()+
  labs(title = "Bump Chart",
       caption = "Viz by: Bernard Kilonzo",
       x = "Year", y = "Rank")
