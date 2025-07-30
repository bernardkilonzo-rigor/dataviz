setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Waterfall chart")
#load libraries
library(waterfalls)
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing profit by Sub_category
profit_summary<-superstore%>%group_by(Sub.Category)%>%
  summarise(profit = round(sum(Profit),0))

#creating waterfall chart
waterfall(profit_summary,
          draw_lines = FALSE,#remove lines
          rect_width = 0.8,#rectangles width
          rect_text_size = 0.8,
          total_rect_color = "steelblue",
          calc_total = TRUE)+
  theme_minimal()+
  labs(title = "Waterfall Chart",
       caption = "Viz by: Bernard Kilonzo",
       x ="Sub_Category", y = "Cummulative Profit")+
  theme(panel.grid = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.1),
        axis.title = element_text(family = "serif",face = "bold", color = "gray25", size = 10),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        plot.title = element_text(family = "serif", face = "bold", color = "gray20", size = 13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray40", size = 9))
