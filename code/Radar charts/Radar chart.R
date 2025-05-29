#load libraries
library(tidyverse)
library(ggradar)

#load data
data_roles<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Data%20roles.csv")

#create radar chart_1
lcols<-c("#0476d9","#618c03","#bfb304","#a68b03")#line colors
rd_1<-ggradar(data_roles,
        axis.label.size = 2.5,
        axis.line.colour = "gray80",
        background.circle.transparency = 0.1,
        grid.label.size = 3,
        grid.line.width = 0.2,
        gridline.mid.colour = "gray",
        group.line.width = 0.5,
        group.point.size = 2,
        group.colours = lcols,
        legend.title = "Job Roles",
        legend.position = "right")+
  labs(title = "Data Science Skills by Job Role",
       caption = "Viz By: Bernard Kilonzo")+
  theme(plot.title = element_text(family = "serif", face = "bold", size = 12),
        plot.caption = element_text(family = "serif",face = "italic",size = 8),
        legend.text = element_text(family = "serif", size = 8),
        legend.title = element_text(family = "serif",face = "bold",size = 10))

#save radar chart_v1
ggsave(plot = rd_1, filename = "radar_chart_1.png",
       width = 8, height = 6, units = "in", dpi = 300)

#Radar chart_v2
#load library
library(fmsb)

#load data
#note, the first and second row in this data represents the maximum and minimum values respectively.
data_roles1<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Data_roles_v2.csv")

#define colors
areas <- c(rgb(1, 0, 0, 0.25),
           rgb(0, 1, 0, 0.25),
           rgb(0, 0, 1, 0.25),
           rgb(0,1,1,0.25))
line <- c(rgb(1, 0, 0, 0.25),
           rgb(0, 1, 0, 0.25),
           rgb(0, 0, 1, 0.25),
           rgb(0,1,1,0.25))

#save plot
png("radar_chart_v2.png", width = 800, height = 800)

##Create radar chart_v2
radarchart(data_roles1,
                 cglty = 1,
                 cglcol = "gray",
                 cglwd = 1,
                 pcol = line,
                 pfcol = areas,
                 plwd = 1.5,
                 plty = 1,
                 vlcex = 1,
           title = "Data Science Skills by Job Role")+
  theme(title = element_text(family = "serif", size = 12))

#Add custom legend
legend("bottomright",
       legend = c("ML Engineers","Data Engineers",
                  "Data Scientists","Data Analysts"),
       bty = "n", pch = 20, col = areas,
       text.col = "gray35", pt.cex = 2, cex = 1,
       title = "Job Roles", title.font = 2)

#add caption
mtext("Viz by: Bernard Kilonzo", side = 1, line = 3, cex = 1, col = "black")

#close PNG device
dev.off()
