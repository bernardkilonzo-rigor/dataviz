setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Likert Scale Barplots")
library(tidyverse)
library(likert)

#load data
survey_data<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Survey%20Data.csv")

#Selecting the likert scale data (Q4)
q4<-survey_data%>%select(contains("Q4"))

#Converting likert items into ordered factors
q4[]<-lapply(q4, factor, levels =c("Highly dissatisfied","Dissatisfied",
                                   "Neutral","Satisfied", "Highly satisfied"))

#using likert() to summarize likert items across questions
likert_summary<-likert(q4)

likert_summary

#create a plot
plot(likert_summary)+
  scale_fill_manual(values = c("#bf623d", "#e3a462", "#d4d4d4", "#a7cee8", "#6b9bc2"))

ggsave(plot = x, filename = "Image 3.png",
       width = 8, height = 6, units = "in", dpi = 300)

y<-plot(likert_summary)+
scale_fill_manual(values = c("#bf623d", "#e3a462", "#d4d4d4", "#a7cee8", "#6b9bc2"))


ggsave(plot = y, filename = "Image 4.png",
       width = 8, height = 6, units = "in", dpi = 300)
