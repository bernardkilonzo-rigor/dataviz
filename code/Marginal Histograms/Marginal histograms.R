setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marginal Histograms")
#load libraries
library(tidyverse)
library(ggExtra)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating the scatter plot
scatter_plot<-superstore%>%ggplot(aes(x = Discount, y = Quantity))+
  geom_point()

#Adding marginal histograms
marginal_hist<-ggMarginal(scatter_plot, type = "histogram")

#saving the plot
ggsave(plot = marginal_hist, filename = "marginal_histogram.png",
       width = 8, height = 6, units = "in", dpi = 300)
