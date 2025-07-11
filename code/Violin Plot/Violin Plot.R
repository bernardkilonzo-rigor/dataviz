#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating violin plot
vp<-superstore%>%ggplot(aes(x = Region, y = Discount))+
  geom_violin()+
  stat_summary(fun = "mean",
               geom = "point",
               aes(color = "Mean"))+
  stat_summary(fun = "median",
               geom = "point",
               aes(color = "Median"))+
  scale_color_manual(values = c("red","blue"),
                     name ="Legend")+
  labs(title = "Discount Distribution by Region",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.2),
        axis.ticks = element_line(color = "gray30", linewidth = 0.2),
        axis.text = element_text(family = "serif",color = "gray30", size = 9),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", color = "gray30", size = 9),
        legend.title = element_text(family = "serif", face = "bold",colour = "gray30", size = 10),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray30"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray45"))

#saving the plot
ggsave(plot = vp, filename = "Violin_plot.png",
       width = 8, height = 3, dpi = 300)
