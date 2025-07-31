#load libraries
library(waterfalls)
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing profit by Sub_category
profit_summary<-superstore%>%group_by(Sub.Category)%>%
  summarise(profit = round(sum(Profit),0))

#creating waterfall chart
wfl<-waterfall(profit_summary,
          draw_lines = FALSE,#remove lines
          rect_width = 0.96,#rectangles width
          draw_axis.x = "none",
          rect_text_size = 0.8,
          rect_border = NA,
          total_rect_border_color = NA,
          total_rect_color = "#b48f2c",
          calc_total = TRUE)+
  scale_y_continuous(labels = comma)+
  theme_minimal()+
  labs(title = "Waterfall Chart",
       caption = "Viz by: Bernard Kilonzo",
       x ="Sub_Category", y = "Cummulative Profit")+
  theme(panel.grid = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.1),
        axis.title = element_text(family = "serif",face = "bold", color = "gray25", size = 10),
        axis.text = element_text(family = "serif", color = "gray35", size = 9),
        axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(family = "serif", face = "bold", color = "gray20", size = 13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray40", size = 9))

#saving the plot
ggsave(plot = wfl, filename = "waterfall.png",
       width = 8, height = 6, units = "in", dpi = 300)
