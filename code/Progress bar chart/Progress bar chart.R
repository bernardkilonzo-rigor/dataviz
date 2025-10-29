setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Progress bar chart")

#load libraries
library(tidyverse)

#create data
data<-data.frame(ID = 1:5,
                 Project_Task = c("Blog Post","Presentation","Workbook","Website","Video Blog"),
                 percent_complete =c(80,65,30,45,17))

#Add a new column computing percent to completion
data<-data%>%mutate(percent_to_complete = 100 -percent_complete)

#create progress bar chart
