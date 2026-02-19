#load library
library(tidyverse)

#load data set
superstore <-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#extracting the numerical variables (sales & profit)
data_num <-superstore[,c("Sales","Profit")]

#running K-means clustering
km <- kmeans(data_num, centers = 4, nstart = 25)

#adding cluster labels to the data set
superstore$cluster <-factor(km$cluster)

#visualizing the clusters
superstore%>%ggplot(aes(x = Sales, y = Profit, color = cluster))+
  geom_point(size =4, alpha =0.5)+
  labs(title = "Cluster Analysis", color = "Clusters")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif", face ="bold", color = "gray40"),
        axis.text = element_text(family = "serif", color = "gray40"),
        axis.line = element_line(linewidth = 0.1, color = "gray45"),
        axis.ticks = element_line(linewidth = 0.1,color = "gray45"),
        plot.title = element_text(family = "serif",face = "bold", color = "gray25"))
  
