#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating jitter box plot
jbp<-superstore%>%filter(Region=="East")%>%ggplot(aes(y = State, x = Quantity, color = State))+
  stat_boxplot(geom = "errorbar",width =0.4)+
  geom_boxplot(outlier.color = NA)+#removing the outliers
  geom_jitter(size =0.7)+
  scale_color_paletteer_d("impressionist.colors::irissen")+
  labs(title = "Order Distribution by Quantity by State",
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
ggsave(plot = jbp, filename = "jitter_boxplot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#load plotly library
library(plotly)

#creating jitter boxplot with plotly library
superstore%>%filter(Region=="East")%>%
  plot_ly(y = ~State, x = ~Quantity, type = "box",
          boxpoints = "all",jitter = 0.5,
          pointpos = 0,fillcolor ="lightgray",
          marker = list(size = 4, color = "gray"),
          line = list(color = "steelblue"))%>%
  layout(title = list(text = "<b>Order Distribution by Quantity & State</b>"),
         xaxis = list(title = "<b>Quantiy</b>"),
         yaxis = list(title = "<b>State</b>"))
