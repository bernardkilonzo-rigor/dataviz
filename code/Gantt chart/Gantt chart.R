setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Gantt chart")
#load libraries
library(tidyverse)

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
  geom_segment(linewidth =6)
