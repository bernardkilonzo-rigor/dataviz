#load libraries
library(tidyverse)
library(paletteer)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#create a basic box plot
bp<-superstore%>%filter(Region=="East")%>%ggplot(aes(y = State, x = Quantity, fill =State))+
  stat_boxplot(geom = "errorbar",width =0.4)+
  geom_boxplot()+
  scale_fill_paletteer_d("palettetown::solrock")+
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
ggsave(plot = bp, filename = "box_plot.png",
       width = 8, height = 6, dpi = 300)

#load plotly library
library(plotly)

#creating a simple boxplot with plotly library
superstore%>%plot_ly(x = ~Sales, color = ~Region, type = "box")%>%
  layout(title = list(text = "<b> Boxplot </b>"),
         xaxis = list(title = "<b> Sales </b>"),
         yaxis = list(title = "<b> Region </b>"))
