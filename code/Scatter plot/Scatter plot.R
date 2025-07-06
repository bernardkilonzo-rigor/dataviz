#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#creating scatter plot
superstore%>%ggplot(aes(x = Sales, y =Profit, size = Discount, color =Profit))+
  geom_point(alpha =0.5)+
  scale_color_paletteer_c("ggthemes::Red-Green-Gold Diverging")+
  labs(title = "Sales vs. Profit vs. Discount",
       caption = "Viz by: Bernard Kilonzo",)+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.4),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        axis.title = element_text(family = "serif", color = "gray25", size = 10),
        legend.text = element_text(family = "serif", color = "gray30", size = 8),
        legend.title = element_text(family = "serif", color = "gray25", size = 9),
        plot.title = element_text(family = "serif", face = "bold", color = "gray25", size = 13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray45", size = 9))
