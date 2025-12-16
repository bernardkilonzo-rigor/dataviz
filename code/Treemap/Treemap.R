#load libraries
library(tidyverse)
library(treemapify)
library(paletteer)
library(scales)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Sample%20-%20Superstore.csv")

#grouping sales by state
state_sales<-superstore%>%group_by(State)%>%
  summarise(sales = sum(Sales))

#creating a tree map
tmp<-state_sales%>%ggplot(aes(area = sales, fill = sales,label = State))+
  geom_treemap(color = "gray85", size =1)+
  scale_fill_paletteer_c("ggthemes::Red-Green-Gold Diverging")+
  labs(title = "Revenue by State",
       caption = "Viz by: Bernard Kilonzo", fill = "Sales")+
  theme(plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#save 100% stacked bar plot
ggsave(plot = tmp, filename = "Treemap.png",
       width = 8, height = 6, units = "in", dpi = 300)

#load plotly library
library(plotly)

#preparing sample data set
sample_data<-superstore%>%group_by(State)%>%
  summarise(sales = sum(Sales))

#creating a dummy root so plotly understands the hierarchy
labels <- c("Total",sample_data$State) #root + states
parents <- c("", rep("Total", nrow(sample_data))) #root has no parent, all others share root
values <- c(sum(sample_data$sales), sample_data$sales) #give root the total

#creating treemap plot using plotly library
plot_ly(type = "treemap", labels = labels,
                      parents = parents,
                      values =values,
        branchvalues = "total",
        textinfo = "label+value+percent root")
