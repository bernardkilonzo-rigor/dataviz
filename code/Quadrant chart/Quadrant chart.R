setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Quadrant chart")

#load libraries
library(tidyverse)

#load data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#quadrant boundaries
discount_mid <- mean(superstore$Discount)
quantity_mid <- mean(superstore$Quantity)

#creating the quadrants for coloring
superstore$quadrant<- with(superstore, ifelse(
  superstore$Discount<discount_mid & superstore$Quantity<quantity_mid, "Q1",
  ifelse(superstore$Discount<discount_mid & superstore$Quantity>quantity_mid, "Q2",
         ifelse(superstore$Discount>discount_mid & superstore$Quantity<quantity_mid,"Q3","Q4")
)))

#Creating quadrant chart
superstore%>%ggplot(aes(x = Discount, y = Quantity, color = quadrant)) +
  geom_point(size = 3) +
  geom_vline(xintercept = discount_mid, linetype = "dashed", color = "gray") +
  geom_hline(yintercept = quantity_mid, linetype = "dashed", color = "gray")
