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
lsp<-plot(likert_summary)+
  labs(title = "Level of Satisfaction",
       caption = "Viz by: Bernard  Kilonzo")+
  theme(plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray30"))

#saving the plot
ggsave(plot = lsp, filename = "Likert_scale_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#customizing  (editing) colors
lsp_1<-plot(likert_summary)+
  scale_fill_manual(values = c("#bf623d", "#e3a462", "#d4d4d4", "#a7cee8", "#6b9bc2"))+
  labs(title = "Level of Satisfaction",
       caption = "Viz by: Bernard  Kilonzo")+
  theme(plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray30"))

#saving the plot
ggsave(plot = lsp_1, filename = "Likert_scale_plot_1.png",
       width = 8, height = 6, units = "in", dpi = 300)
