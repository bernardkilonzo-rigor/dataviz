#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create a basic histogram graph
hp<-superstore%>%filter(Sales<500)%>%ggplot(aes(x = Sales))+
  geom_histogram(binwidth = 20, color="gray2",linewidth =0.2, fill ="white")+
  scale_x_continuous(limits = c(0,NA), expand = c(0,0))+
  scale_y_continuous(limits = c(0,NA), expand = c(0,0))+
  labs(title = "Histogram Graph", caption = "Viz by Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold",color = "gray30", size = 10),
        axis.text = element_text(family = "serif", color = "gray30", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray45"))

#saving the plot
ggsave(plot = hp, filename = "Histogram_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#histogram with density plot
hdp<-superstore%>%filter(Sales<500)%>%ggplot(aes(x = Sales))+
  geom_histogram(aes(y = after_stat(density)),binwidth = 20, color="gray2",linewidth =0.2, fill ="white")+
  geom_density(linewidth = 0.8, color ="steelblue", fill = "lightblue", alpha =0.5)+
  scale_x_continuous(limits = c(0,NA), expand = c(0,0))+
  scale_y_continuous(limits = c(0,NA), expand = c(0,0))+
  labs(title = "Histogram with Density Plot", caption = "Viz by Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold",color = "gray30", size = 10),
        axis.text = element_text(family = "serif", color = "gray30", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = hdp, filename = "histogram_density_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)
