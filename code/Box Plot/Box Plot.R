setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Box Plot")
#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create a basic box plot
bp<-superstore%>%ggplot(aes(y = Sub.Category, x = Discount, fill =Sub.Category))+
  stat_boxplot(geom = "errorbar",width =0.5)+
  geom_boxplot()+
  labs(title = "Distribution of Discounts by Sub-Category",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.2),
        axis.ticks = element_line(color = "gray30", linewidth = 0.2),
        axis.title = element_text(family = "serif", size = 10,face = "bold", color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.position = "none",
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = bp, filename = "box_plot.png",
       width = 8, height = 6, dpi = 300)
