setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Gantt chart")
#load libraries
library(tidyverse)
library(paletteer)

#load data
project_timeline<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Project%20Timelines.csv")
view(project_timeline)
#converting start and end dates into date objects
project_timeline$Start.date<-dmy(project_timeline$Start.date)
project_timeline$End.date<-dmy(project_timeline$End.date)

#combining expert assigned and the tasks
project_timeline<-project_timeline%>%
  mutate(label = paste(Expert.Assigned, Task, sep = "-"))

#creating a basic gantt chart
project_timeline%>%ggplot(aes(x =Start.date, xend =End.date, y = label,
                              yend = label, color = Task))+
  geom_segment(linewidth =6)+
  scale_color_paletteer_d("ggsci::default_jco")+
  labs(x = "Month", y = "Individual Assigned", title = "Gantt Chart",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.ticks = element_line(color = "gray35", linewidth = 0.1),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))
