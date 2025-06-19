#load libraries
library(tidyverse)
library(treemapify)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#grouping sales by state
state_sales<-superstore%>%group_by(State)%>%
  summarise(sales = sum(Sales))

#creating a tree map
state_sales%>%ggplot(aes(area = sales, fill = sales,label = State))+
  geom_treemap(color = "gray45")+
  scale_fill_gradient(low = "lightblue", high = "steelblue")+
  labs(title = "Revenue by State",
       caption = "Viz by: Bernard Kilonzo", fill = "Legend")
