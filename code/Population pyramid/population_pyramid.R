#load libraries
library(tidyverse)
library(readxl)
library(scales)

#load data
Ke_pop<-read_csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Ke_population.csv")

#convert male values into negative values by multiplying by -1
Ke_pop<-Ke_pop%>%mutate(Male = Male*-1)

#Ensure age group is an ordered factor
Ke_pop$`Age Group`<-factor(Ke_pop$`Age Group`, levels = (unique(Ke_pop$`Age Group`)))

#shaping data through pivoting
Ke_pop_v1<-Ke_pop%>%pivot_longer(Male:Female, names_to = "Gender",
                                 values_to = "Pop")

#creating a basic population pyramid chart (year = 2019)
bpp<-Ke_pop_v1%>%filter(Year==2019)%>%
  ggplot(aes(x = `Age Group`, y =Pop/1e6, fill =Gender))+
  geom_bar(stat = "identity")+
  coord_flip()+
  scale_fill_manual(values = c("Female"="#618c03", "Male"="#bfb304"))+
  scale_y_continuous(labels = abs)+
  labs(title = "Population Pyramid of Kenya (2019)",
       caption = "Viz by: Bernard Kilonzo",
       x = "Age Group", y = "Population (millions)")+
  theme(panel.background = element_blank(),
        panel.grid.major.y = element_line(color = "gray95", linewidth = 0.1),
        panel.grid.major.x = element_line(color = "gray95",linetype = "dashed",linewidth = 0.1),
        axis.ticks = element_line(colour = "gray88", linewidth = 0.1),
        axis.title = element_text(family = "serif", size = 10,face = "bold", color = "gray30"),
        axis.text = element_text(family = "serif", size = 8, color = "gray30"),
        legend.text = element_text(family = "serif", size = 8, color = "gray30"),
        legend.title = element_text(family = "serif",face = "bold" ,size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = bpp, filename = "population_pyramid_1.png",
       width = 8, height = 6, units = "in", dpi = 300)

#Overlaying two periods (2009 & 2019)
#creating grouped population pyramid plot
grouped_pp<-Ke_pop_v1%>%filter(Year>2008)%>%
  ggplot(aes(x = `Age Group`, y =Pop/1e6,fill =interaction(Gender, Year) ,group = Year))+
  geom_bar(stat = "identity", position = position_dodge(width = 0.85), width = 1)+
  coord_flip()+
  scale_y_continuous(labels = abs)+
  scale_fill_manual(values = c("Female.2019"="#618c03","Female.2009"="#bcd684","Male.2019"="#bfb304","Male.2009"="#d8d493"))+
  labs(title = "Population Pyramid of Kenya (2009 & 2019)",
       caption = "Viz by: Bernard Kilonzo",
       x = "Age Group", y = "Population (millions)", fill ="")+
  theme(panel.background = element_blank(),
        panel.grid.major.y = element_line(color = "gray95", linewidth = 0.1),
        panel.grid.major.x = element_line(color = "gray95",linetype = "dashed",linewidth = 0.1),
        axis.ticks = element_line(colour = "gray88", linewidth = 0.1),
        axis.title = element_text(family = "serif", size = 10,face = "bold", color = "gray30"),
        axis.text = element_text(family = "serif", size = 8, color = "gray30"),
        legend.text = element_text(family = "serif", size = 8, color = "gray30"),
        legend.title = element_text(family = "serif",face = "bold" ,size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = grouped_pp, filename = "population_pyramid_2.png",
       width = 8, height = 6, units = "in", dpi = 300)

#overlaying three periods (1999, 2009 & 2019)
#creating a stacked population pyramid plot
stacked_pp<-Ke_pop_v1%>%ggplot(aes(x = `Age Group`, y =Pop/1e6, fill =Year))+
  geom_bar(stat = "identity", position = position_stack())+
  coord_flip()+
  scale_y_continuous(labels = abs)+
  scale_fill_gradient(low ="#618c03", high = "#bcd684")+
  labs(title = "Population Pyramid of Kenya (1999, 2009 & 2019",
       caption = "Viz by: Bernard Kilonzo",
       x = "Age Group", y = "Population (millions)", fill ="")+
  theme(panel.background = element_blank(),
        panel.grid.major.y = element_line(color = "gray95", linewidth = 0.1),
        panel.grid.major.x = element_line(color = "gray95",linetype = "dashed",linewidth = 0.1),
        axis.ticks = element_line(colour = "gray88", linewidth = 0.1),
        axis.title = element_text(family = "serif", size = 10,face = "bold", color = "gray30"),
        axis.text = element_text(family = "serif", size = 8, color = "gray30"),
        legend.text = element_text(family = "serif", size = 8, color = "gray30"),
        legend.title = element_text(family = "serif",face = "bold" ,size = 9, color = "gray30"),
        plot.title = element_text(family = "serif", face = "bold", size = 12, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = stacked_pp, filename = "population_pyramid_3.png",
       width = 8, height = 6, units = "in", dpi = 300)
