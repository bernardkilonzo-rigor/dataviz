setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Funnel chart")

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
ggplot(advert_data) +
  geom_rect(aes(xmin = -Value/2, xmax = Value/2, ymin = ymin, ymax = ymax, fill = Stage)) +
  scale_y_continuous(expand = c(0, 0))+
  coord_flip()+
  scale_fill_paletteer_d("trekcolors::enara2")+
  labs(title = "Funnel Chart", caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray25"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 13, color = "gray20"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

