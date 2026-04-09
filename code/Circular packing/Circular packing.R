setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Circular packing")

#load libraries
library(tidyverse)
library(packcircles)

#load data set
superstore <-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#computing total sales by state
state_sales <- superstore %>%
 group_by(State)%>%
  summarise(sales =sum(Sales))

#generating a layout (assigning a center (x & y) and a radius proportional to the value)
packing <- circleProgressiveLayout(state_sales$sales, sizetype = "area")

#adding packing information to the initial data frame
state_sales <- cbind(state_sales,packing)

#converting circle packing layout into a data frame of polygon vertices that can be plottong with ggplot2
dat.gg <- circleLayoutVertices(packing, npoints = 50)

#creating the plot (circle packing plot)
cpp<- ggplot()+
  geom_polygon(data = dat.gg, aes(x, y, group = id, fill = as.factor(id)), color = "black", alpha =0.6)+
  scale_size_continuous(range = c(1,4))+
  geom_text(data = state_sales, aes(x,y, size =sales, label = State))+
  theme_void()+
  theme(legend.position = "none")+
  coord_equal()

#saving the plot
ggsave(plot = cpp, filename = "circular_packing.png", width = 8,
       height = 6, units = "in", dpi = 300)
