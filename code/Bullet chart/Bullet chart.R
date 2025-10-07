setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Bullet chart")

#load libraries
library(tidyverse)

#create sample data
data <- data.frame(
  product = c("Chairs","Tables","Stationary","Phones","Copiers","Books","Printers"),
  sales = c(800,1200,200,2500,1500,650,1800),
  target = c(1000,1100,300,2900,1700,500,1500),
  target_80_percent = c(800,880,240,2320,1360,400,1200),
  target_50_percent = c(500,550,150,1450,850,250,750)
)

