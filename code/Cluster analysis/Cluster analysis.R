setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Cluster analysis")

#load library
library(tidyverse)

#load data set
superstore <-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting the numerical variables (sales & profit)
data_num <-superstore[,c("Sales","Profit")]

#Run K-means clustering
km <- kmeans(data_num, centers = 4, nstart = 50)
