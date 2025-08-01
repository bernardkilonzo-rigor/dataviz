setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Density plot")

#load libraries
library(tidyverse)

#load data
survey_data<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Survey%20Data.csv")
View(survey_data)
#Simple density plot
survey_data%>%ggplot(aes(x = Q6d, fill = Gender))+
  geom_density(alpha =0.5)
