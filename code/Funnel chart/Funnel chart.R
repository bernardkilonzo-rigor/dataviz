setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Funnel chart")

#Load libraries
library(tidyverse)

#create data
advert_data<-data.frame(
  Stage =c("Ads Reach","Visitors","Leads","Customers"),
  Value =c(2500,986,197,25)
)

#Adding y-position for plotting
advert_data<-advert_data%>%
  mutate(Stage = factor(Stage, levels = rev(Stage)),
                                  ymin = cumsum(Value) - Value,
                                  ymax = cumsum(Value))


