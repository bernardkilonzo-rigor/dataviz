setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Violin Plot")
#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating violin plot
vp<-superstore%>%ggplot(aes(x = Region, y = Discount))+
  geom_violin()+
  labs(title = "Discount Distribution by Region",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.2))

#saving the plot
ggsave(plot = vp, filename = "Violin_plot.png",
       width = 8, height = 3, dpi = 300)
