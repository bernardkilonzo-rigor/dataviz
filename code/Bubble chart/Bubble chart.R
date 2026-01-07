#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating bubble chart
bp<-superstore%>%ggplot(aes(x = Sales, y = Profit, size = Discount, color = Profit))+
  geom_point(alpha = 0.5)+
  labs(title = "Bubble Plot", caption = "Viz By: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.ticks = element_line(linewidth = 0.1),
        legend.title = element_text(family = "serif", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 10, color = "gray40"))

#saving bubble plot
ggsave(plot = bp, filename = "bubble_plot.png", 
       width = 8, height = 6, units = "in", dpi = 300)

#loading plotly library
library(plotly)

#creating a bubble chart in R with plotly
superstore%>%plot_ly(x = ~Sales,
                     y = ~Profit,
                     type = "scatter",
                     mode = "markers",
                     marker = list(size = ~Discount,
                                   sizemode = "area",
                                   sizeref =0.04,
                                   color = ~Profit,
                                   colorscale = "Viridis",
                                   opacity = 0.7))%>%
  layout(title = "Bubble Plot with Plotly")
