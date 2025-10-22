setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marimekko Chart")

#load libraries
install.packages("ggmosaic")
library(ggmosaic)
library(tidyverse)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")


#create sample data
data <- data.frame(
  Gender = c("Male", "Male", "Female", "Female"),
  Product = c("A", "B", "A", "B"),
  Count = c(40, 60, 70, 30)
)

#convert to frequency table
data_expanded <- data %>%
  uncount(weights = Count)
view(data_expanded)

#create marimekko chart
ggplot(data_expanded) +
  geom_mosaic(aes(x = product(Gender, Product), fill = Product))+
  theme_minimal()
