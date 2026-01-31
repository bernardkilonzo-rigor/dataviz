setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marginal density plot")

#load libraries
library(tidyverse)
library(ggExtra)

#creating marginal density plot
iris%>%ggplot()+
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species),
             alpha = 0.6, shape =16)+
  theme_minimal()+
  theme(legend.position = "bottom")+
  labs(x = "Sepal Length", y = "Sepal Width")
