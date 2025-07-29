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
          total_rect_color = "brown",
          calc_total = TRUE)+
  theme_minimal()
