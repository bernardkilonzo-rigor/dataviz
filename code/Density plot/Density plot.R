setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Density plot")

#load libraries
library(tidyverse)

#load data
survey_data<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Survey%20Data.csv")

#Simple density plot (option 1)
survey_data%>%ggplot(aes(x = Q6d, fill = Gender))+
  geom_density(alpha =0.4)+
  scale_fill_manual(values = c("maroon", "steelblue"))

#simple density plot (option 2)
survey_data%>%ggplot(aes(x = Q6d, color = Gender))+
  geom_density(lwd =1)+
  scale_color_manual(values = c("maroon", "steelblue"))
