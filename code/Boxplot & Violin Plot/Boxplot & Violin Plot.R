#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create violin plot with boxplot
vbp<-superstore%>%ggplot(aes(x =Region, y =Quantity, color =Region))+
  geom_violin()+
  geom_boxplot(width =0.07)+
  scale_color_paletteer_d("rockthemes::faithnomore")+
  labs(title = "Distribution of Order's Quantity by Region",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.2),
        axis.ticks = element_line(color = "gray45", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray35"),
        axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        legend.title = element_text(family = "serif", face = "bold",size = 10, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray35"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = vbp, filename = "boxplot_violin_plot_1.png",
       width = 8, height = 6, units = "in", dpi = 300)

##create violin plot with boxplot (filling the plot)
vbp_2<-superstore%>%ggplot(aes(x =Region, y =Quantity, fill =Region))+
  geom_violin()+
  geom_boxplot(width =0.07)+
  scale_fill_paletteer_d("wesanderson::Chevalier1")+
  labs(title = "Distribution of Order's Quantity by Region",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.2),
        axis.ticks = element_line(color = "gray45", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray35"),
        axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        legend.title = element_text(family = "serif", face = "bold",size = 10, color = "gray35"),
        legend.text = element_text(family = "serif", size = 9, color = "gray35"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = vbp_2, filename = "boxplot_violin_plot_2.png",
       width = 8, height = 6, units = "in", dpi = 300)

#load plotly library
library(plotly)

#create violin plot with boxplot in plotly
superstore%>%plot_ly(y = ~Quantity, x = ~Region,
                     type = "violin", fillcolor = "lightgray",
                     line = list(color = "gray"),
                     box = list(visible = TRUE,fillcolor = "lightblue",
                                line = list(color = "steelblue")))
