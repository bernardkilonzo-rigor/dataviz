setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Diverging barplot")
#load libraries
library(tidyverse)

#load data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")
superstore$Order.Date<-as.Date(superstore$Order.Date, format = "%d/%m/%Y")

#computing profit by sub-category in the central region
profitability<-superstore%>%filter(Region=="Central")%>%
  group_by(Sub.Category)%>%
  summarise(profit =sum(Profit))

#classifying data set
profitability$type<-ifelse(profitability$profit >= 0, "Profitable", "Unprofitable")

#creating sample visualization
dbp<-profitability%>%ggplot(aes(y = reorder(Sub.Category, profit), x = profit, fill = type)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Profitable" = "steelblue", "Unprofitable" = "tomato"))+
  labs(title = "Profitability by Sub-Category",
       x = "Profit", y = "Sub-Category", fill = "Legend",
       caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray50", linewidth = 0.2),
        axis.ticks = element_line(colour = "gray50", linewidth = 0.2),
        axis.title = element_text(family = "serif", face = "bold",size = 10, color = "gray40"),
        axis.text = element_text(family = "serif", size = 9, color = "gray40"),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray35"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = dbp, filename = "diverging_barplot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#create a another alternative using dataset below...
#Summarizing performance by month for the two years
summary_metrics<-superstore%>%mutate(mon = month(Order.Date, label = TRUE))%>%
  group_by(mon)%>%
  summarise(sales_2019 =sum(ifelse(year(Order.Date)==2019, Sales,0)),
            sales_2020 =sum(ifelse(year(Order.Date)==2020, Sales,0)))