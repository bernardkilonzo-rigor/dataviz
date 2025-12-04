#Load libraries
library(tidyverse)
library(paletteer)

#create data
advert_data<-data.frame(
  Stage =c("Ads Reach","Visitors","Leads","Customers"),
  Value =c(2500,986,197,25)
)

#Adding y-position for plotting
advert_data<-advert_data%>%
  mutate(Stage = factor(Stage, levels = rev(Stage)),
                                  ymin = cumsum(Value) - Value,
                                  ymax = cumsum(Value))

#Creating the plot
fc<-ggplot(advert_data) +
  geom_rect(aes(xmin = -Value/2, xmax = Value/2, ymin = ymin, ymax = ymax, fill = Stage)) +
  scale_y_continuous(expand = c(0, 0))+
  coord_flip()+
  scale_fill_paletteer_d("rockthemes::alice")+
  labs(title = "Funnel Chart", caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))


#saving the plot
ggsave(plot = fc, filename = "Funnel_chart.png",
       width = 8, height = 6, units = "in",dpi = 300)

#load plotly library
library(plotly)

#Ordering the stages in descending order
advert_data<-advert_data[order(-advert_data$Value),]

#converting the stages to factor
advert_data$Stage<-factor(advert_data$Stage, levels = advert_data$Stage)

#creating funnel chart with plotly library
advert_data%>%plot_ly(y = ~Stage,x = ~Value,type = "funnel")%>%
  layout(title = list(text = "<b> Funnel Chart </b>"), 
         yaxis = list(title = "<b> Marketing Stages</b>"))
