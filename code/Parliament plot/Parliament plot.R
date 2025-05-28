#load libraries
library(ggparliament)
library(tidyverse)
library(paletteer)

#load data
parliament<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Ug_Parliament.csv")

#Create parliament plot
parliament_plot<-parliament_data(parliament,
                                 type = "semicircle",#parliament type
                                 parl_rows = 12,#rows of the parliament
                                 party_seats = parliament$Seats)#seats per party

pp<-ggplot(parliament_plot, aes(x=x, y=y, color = Party))+
  geom_parliament_seats()+
  draw_totalseats(n = 529, type = "semicircle") +
  theme_ggparliament()+
  scale_color_manual(values = c("#476f84","#72874e","#d63200","#b8b69e",
                                "#a37903","#0476D9","#FAB512","#af6458",
                                "#526a83"))+
  labs(title = "Composition of the 11th Parliament of Uganda (2021-2026)",
       subtitle = "Data Source: Wikipedia",
       caption = "Visualization By: Bernard Kilonzo",
       color = "Political groups")+
  theme(plot.title = element_text(family = "serif",face = "bold", size = 14),
        plot.subtitle = element_text(family = "serif",face = "italic", size = 10),
        plot.caption = element_text(family = "serif",face = "italic"),
        legend.title = element_text(family = "serif", face = "bold",  size = 9),
        legend.text = element_text(family = "serif",size = 8))

#save parliament plot
ggsave(plot = pp, filename = "Parliament_plot.png",
       width = 8, height = 6, units = "in", dpi = 300) 
