setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Funnel chart")

#Load libraries
library(tidyverse)

#create data
advert_data<-data.frame(
  Stage =c("Ads Reach","Visitors","Leads","Customers"),
  Value =c(2500,986,197,25)
)


