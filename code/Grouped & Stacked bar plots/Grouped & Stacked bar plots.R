#load libraries
library(tidyverse)
library(paletteer)
library(scales)

#load dataset
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#Creating a grouped bar chart
bp<-superstore%>%ggplot(aes(x =Region, y = Sales, fill =Category))+
  geom_bar(stat = "summary", fun = sum, position = "dodge")+
  scale_y_continuous(labels = comma)+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Sales Performance by Product Category per Region",
       caption = "Visualization by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray50"),
        axis.ticks = element_line(color = "gray50"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.position = "top",
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray30"),
        plot.caption = element_text(family = "serif", face = "italic", size = 8),
        )
 
#save grouped bar plot
ggsave(plot = bp, filename = "grouped_bar_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)


#Creating stacked bar plot
sp<-superstore%>%ggplot(aes(x =Region, y = Sales, fill =Category))+
  geom_bar(stat = "summary", fun = sum, position = "stack", width = 0.5)+#specify position as stack
  scale_y_continuous(labels = comma)+
  scale_fill_paletteer_d("nationalparkcolors::Acadia")+
  labs(title = "Sales Performance by Product Category per Region",
       caption = "Visualization by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray50"),
        axis.ticks = element_line(color = "gray50"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.position = "top",
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray30"),
        plot.caption = element_text(family = "serif", face = "italic", size = 8),
  )

#save stacked bar plot
ggsave(plot = sp, filename = "stacked_bar_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)
