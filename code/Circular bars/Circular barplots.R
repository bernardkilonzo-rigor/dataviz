#Load libraries
library(tidyverse)
library(zoo)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#extracting Month-Year as strings
superstore<-superstore%>%mutate(Order.Date =dmy(Order.Date))%>%
  mutate(my = as.yearmon(Order.Date))

#grouping data, calculating labels and id
superstore_cal<-superstore%>%group_by(my)%>%
  summarise(sales = round(sum(Sales),0))%>%
  mutate(label = paste0(my," - ",sales))%>%
  mutate(id = seq(1:48))

#preparing data for labels
#calculating angles for labels
superstore_cal$angle<- 90-360*(superstore_cal$id - 0.5)/nrow(superstore_cal)
#calculating alignment of labels: right or left
superstore_cal$hjust<- ifelse(superstore_cal$angle < -90,1,0)
#flipping angles to make them readable
superstore_cal$angle<-ifelse(superstore_cal$angle < -90,superstore_cal$angle+180,superstore_cal$angle)

#creating a circular bar plot
superstore_cal%>%ggplot(aes(x = id, y = sales))+
  geom_bar(stat = "identity", fill=alpha("#72874e",0.9))+
  ylim(-30000,120000)+
  coord_polar(start = 0)+
  geom_text(aes(x = id, y=sales+10,label = label, angle = angle,
                hjust =hjust),color = "black",fontface="bold",
            alpha =0.6,size =2.0, angle=superstore_cal$angle,
            inherit.aes = FALSE)+
  theme_void()

