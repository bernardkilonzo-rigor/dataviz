setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marimekko Chart")

#load libraries
install.packages("ggmosaic")
library(ggmosaic)
library(tidyverse)

#create sample data
data <- data.frame(
  Gender = c("Male", "Male", "Female", "Female"),
  Product = c("A", "B", "A", "B"),
  Count = c(40, 60, 70, 30)
)

#convert to frequency table
data_expanded <- data %>%
  uncount(weights = Count)

#create marimekko chart
ggplot(data_expanded) +
  geom_mosaic(aes(x = product(Gender, Product), fill = Product))
