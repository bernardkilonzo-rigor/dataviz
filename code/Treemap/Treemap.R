#load libraries
library(tidyverse)
library(treemapify)
library(paletteer)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#grouping sales by state
state_sales<-superstore%>%group_by(State)%>%
  summarise(sales = sum(Sales))

#creating a tree map
tmp<-state_sales%>%ggplot(aes(area = sales, fill = sales,label = State))+
  geom_treemap(color = "gray85", size =1)+
  scale_fill_paletteer_c("grDevices::RdYlBu")+
  labs(title = "Revenue by State",
       caption = "Viz by: Bernard Kilonzo", fill = "Sales")+
  theme(plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#save 100% stacked bar plot
ggsave(plot = tmp, filename = "Treemap.png",
       width = 8, height = 6, units = "in", dpi = 300) 
