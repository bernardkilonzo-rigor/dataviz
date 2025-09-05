setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Gantt chart")
#load libraries
library(tidyverse)

#load data
project_timeline<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Project%20Timelines.csv")

#converting start and end dates into date objects
project_timeline$Start.date<-dmy(project_timeline$Start.date)
project_timeline$End.date<-dmy(project_timeline$End.date)

#creating a basic gantt chart
project_timeline%>%ggplot(aes(x =Start.date, xend =End.date, y = Expert.Assigned,
                              yend = Expert.Assigned, color = Task))+
  geom_segment(linewidth =8)
