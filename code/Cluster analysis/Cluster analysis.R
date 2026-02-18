setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Cluster analysis")

#load library
library(tidyverse)

#load data set
superstore <-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting the numerical variables (sales & profit)
data_num <-superstore[,c("Sales","Profit")]

#running K-means clustering
km <- kmeans(data_num, centers = 4, nstart = 50)

#adding cluster labels to the table
superstore$cluster <-factor(km$cluster)

#visualizing the clusters
superstore%>%ggplot(aes(x = Sales, y = Profit, color = cluster))+
  geom_point(size =4)
  
