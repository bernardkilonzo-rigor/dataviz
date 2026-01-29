setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Balloon plot")

#loading libraries
library(tidyverse)

#loading data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#preparing data set
computed_dat<-superstore%>%
  group_by(Region, Sub.Category)%>%
  summarise(sales = sum(Sales))

#creating a balloon plot with ggplot2
bp<-computed_dat%>%ggplot(aes(x = Region, y = Sub.Category))+
  geom_point(aes(size = sales, fill = sales), shape = 21, color = "black")+
  scale_size(range = c(2,8))+
  scale_fill_viridis_c() +
  theme_minimal()+
  labs(title = "Balloon Plot",
       x = "Region",
       y = "Sub-Category")

#saving the plot
ggsave(plot = bp, filename = "Balloon_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

