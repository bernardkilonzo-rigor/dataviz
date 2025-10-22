setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marimekko Chart")

#load libraries
install.packages("ggmosaic")
library(ggmosaic)
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create marimekko chart
ggplot(superstore) +
  geom_mosaic(aes(x = product(Category, Region), fill = Category))+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Marimekko Chart",
       caption = "Viz By: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif",face = "bold", size = 10, color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.ticks = element_line(linewidth = 0.1),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray45"))
