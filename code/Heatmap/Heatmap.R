#load libraries
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#summarizing profit by month and sub.category 
profit_summary<-superstore%>%mutate(mon = month(Order.Date, label=TRUE))%>%
  group_by(Sub.Category,mon)%>%
  summarise(profit = round(sum(Profit),0))

#creating heat map
hp<-profit_summary%>%ggplot(aes(x = mon, y = Sub.Category, fill = profit))+
  geom_tile(color = "white", lwd =0.1)+
  scale_fill_gradient2(low = "red", mid = "gray90", high = "green", midpoint = 0)+
    labs(title = "Analysis of Profit by Month & Sub Category",
       x = "Month", y = "Sub Category", caption = "Viz  by: Bernard Kilonzo",
       fill = "Profit")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        legend.title = element_text(family = "serif",face = "bold", size = 9, color = "gray30"),
        legend.text = element_text(family = "serif", color = "gray30", size = 9),
        plot.title = element_text(family = "serif", face = "bold", size = 13,color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = hp, filename = "Heatmap.png",
       width = 8, height = 6, units = "in", dpi = 300) 
