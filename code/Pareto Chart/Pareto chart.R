setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Pareto Chart")

#load libraries
library(tidyverse)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#Computing sales by State
state_sales<-superstore%>%
  group_by(State)%>%
  summarise(sales =sum(Sales))

#Sorting and computing cumulative percentage
state_sales<-state_sales%>%
  arrange(desc(sales))%>%
  mutate(cum_sales =cumsum(sales),
         cum_perc = cum_sales/sum(sales)*100)

#creating a Pareto chart in ggplot2
state_sales%>%ggplot(aes(x = reorder(State, -sales)))+
  geom_bar(aes(y = sales), stat = "identity", fill = "steelblue")+
  geom_line(aes(y = cum_perc * max(sales) / 100, group = 1), color ="red", linewidth =0.7)+
  geom_point(aes(y = cum_perc * max(sales)/100), color = "red", size =1)+
  scale_y_continuous(
    name = "Sales",
    sec.axis = sec_axis(~ . * 100 / max(state_sales$sales), name = "Cumulative Percentage"
  ))+
  labs(title = "Pareto Chart",
       x = "State", caption = "Viz By: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray30", linewidth = 0.1),
        axis.ticks = element_line(color = "gray30", linewidth = 0.1),
        axis.title = element_text(family = "serif", face = "bold", size = 10, color = "gray25"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))
