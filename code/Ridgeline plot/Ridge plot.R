#load Libraries
library(ggridges)
library(tidyverse)
library(readr)

#Set working directory and load data
setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\Ridgeline Plot")
x<-read_csv("Average_temperature.csv")
view(x)

#Modify data set
x<-x%>%pivot_longer(cols = -c(Entity,Month,Code),
                    names_to = "Year",
                    values_to = "Temp")

x<-x%>%mutate(tempr = round(Temp,3))%>%
  mutate(mon = month.name[Month])

#Order months
x$mon<-factor(x$mon, levels = month.name)

#Creating ridgeline plot
x%>%filter(Entity=="Russia")%>%
  ggplot(aes(x = tempr, y = mon))+
  geom_density_ridges()


#Apply color gradient
x%>%filter(Entity=="Russia")%>%
  ggplot(aes(x = tempr, y = mon, fill = stat(x)))+
  geom_density_ridges_gradient(color = "gray50",
                               linewidth = 0.4)+
  scale_fill_gradient2(low = "#1565c0", mid = "#D3DBE7", high = "#c62828", midpoint = 0)+
  labs(title = "Average Surface Temperature in Russia (1950-2024)",
       subtitle = "Data Source: NASA/GISS",
       caption = "Visualization By: Bernard Kilonzo",
       y ="Month", x = "Average surface temperature (in degrees Celsius)",
       fill = "Temp")+
  theme(panel.grid = element_line(color = "#ececec", linewidth = 0.1),
        panel.background = element_rect(fill = "#fdfbfb"),
        axis.ticks = element_blank(),
        plot.title = element_text(family = "sans",face = "bold"),
        plot.subtitle = element_text(family = "sans",face = "italic"),
        plot.caption = element_text(family = "mono",face = "italic")
  )
