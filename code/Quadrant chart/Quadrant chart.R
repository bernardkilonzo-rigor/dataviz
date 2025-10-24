setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Quadrant chart")

#load libraries
library(tidyverse)

#load dataset
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#quandrant boundaries
discount_mid <- mean(superstore$Discount)
quantity_mid <- mean(superstore$Quantity)

#Creating quandrant
superstore%>%ggplot(aes(x = Discount, y = Quantity)) +
  geom_point(size = 3, color = "steelblue") +
  geom_vline(xintercept = discount_mid, linetype = "dashed", color = "gray") +
  geom_hline(yintercept = quantity_mid, linetype = "dashed", color = "gray")

#coloring by quanadrant
df$quadrant <- with(df, ifelse(x > x_mid & y > y_mid, "Q1",
                               ifelse(x < x_mid & y > y_mid, "Q2",
                                      ifelse(x < x_mid & y < y_mid, "Q3", "Q4"))))
ggplot(df, aes(x = x, y = y, color = quadrant)) +
  geom_point(size = 3) +
  geom_vline(xintercept = x_mid, linetype = "dashed") +
  geom_hline(yintercept = y_mid, linetype = "dashed") +
  theme_minimal()
