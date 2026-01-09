#load libraries
library(tidyverse)

#load data
survey_data<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Survey%20Data.csv")

#create simple density plot (option 1)
dp1<-survey_data%>%ggplot(aes(x = Q6d, fill = Gender, color = Gender))+
  geom_density(alpha =0.5, linewidth =0.8)+
  scale_fill_manual(values = c("#618c03", "#0476d9"))+
  scale_color_manual(values = c("#618c03", "#0476d9"))+
  labs(title = "Density Plot",
       caption = "Viz by: Bernard Kilonzo",
       x = "Product Rating (0 to 10",
       y = "Density")+
  theme(panel.background = element_blank(),
        axis.line = element_line(linewidth = 0.2, color = "gray20"),
        axis.ticks = element_line(linewidth = 0.2, color = "gray20"),
        axis.text = element_text(family = "serif",color = "gray25", size = 9),
        axis.title = element_text(family = "serif", face = "bold", color = "gray25", size = 10),
        legend.title = element_text(family = "serif", face = "bold", color = "gray25", size = 10),
        legend.text = element_text(family = "serif", color = "gray25", size = 9),
        plot.title = element_text(family = "serif",face = "bold", color = "gray20", size = 13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray34", size = 9))

#saving the plot
ggsave(plot = dp1, filename = "density_plot_1.png",
       width = 8, height = 6, units = "in", dpi = 300)

#create simple density plot (option 2)
dp2<-survey_data%>%ggplot(aes(x = Q6d, color = Gender))+
  geom_density(lwd =1)+
  scale_color_manual(values = c("#618c03", "#bfb304"))+
  labs(title = "Density Plot",
       caption = "Viz by: Bernard Kilonzo",
       x = "Product Rating (0 to 10",
       y = "Density")+
  theme(panel.background = element_blank(),
        axis.line = element_line(linewidth = 0.2, color = "gray20"),
        axis.ticks = element_line(linewidth = 0.2, color = "gray20"),
        axis.text = element_text(family = "serif",color = "gray25", size = 9),
        axis.title = element_text(family = "serif", face = "bold", color = "gray25", size = 10),
        legend.title = element_text(family = "serif", face = "bold", color = "gray25", size = 10),
        legend.text = element_text(family = "serif", color = "gray25", size = 9),
        plot.title = element_text(family = "serif",face = "bold", color = "gray20", size = 13),
        plot.caption = element_text(family = "serif", face = "italic", color = "gray34", size = 9))

#saving the plot
ggsave(plot = dp2, filename = "density_plot_2.png",
       width = 8, height = 6, units = "in", dpi = 300)

#loading plotly library
library(plotly)
view(survey_data)

#creating a density plot with plotly library
dta<-density(survey_data$Q6d, na.rm = TRUE) #computing density
#creating plot with plotly
plot_ly(x = dta$x, y = dta$y, type = "scatter", mode = "lines")
