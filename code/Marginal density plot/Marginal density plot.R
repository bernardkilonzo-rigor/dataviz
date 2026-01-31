setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marginal density plot")

#load libraries
library(tidyverse)
library(ggExtra)

#creating a scatter plot
sc_plot<-iris%>%ggplot()+
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species),
             alpha = 0.6, shape =16)+
  theme_minimal()+
  theme(legend.position = "bottom")+
  labs(x = "Sepal Length", y = "Sepal Width")

#creating a marginal density plot
ggMarginal(sc_plot, type = "density", groupColour = TRUE, groupFill = TRUE)
