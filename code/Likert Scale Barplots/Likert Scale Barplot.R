setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Likert Scale Barplots")
#load libraries
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

#create a plot
lsp<-plot(likert_summary)

#saving the plot
ggsave(plot = lsp, filename = "Likert_scale_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)


