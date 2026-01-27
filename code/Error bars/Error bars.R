#load libraries
library(tidyverse)

#loading data set
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#preparing sample data set
computed_data<-superstore%>%
  group_by(Sub.Category)%>%
  summarise(mean = mean(Sales), se =sd(Sales)/sqrt(n()))

#creating error bars from mean & standard error (or SD)
errbar<-computed_data%>%ggplot(aes(y = Sub.Category, x = mean))+
  geom_bar(stat = "identity", fill = "gray70")+
  geom_errorbar(aes(xmin = mean-se, xmax = mean+se))+
  labs(title = "Error Bars Plot", x = "Mean", y = "Sub Category")+
  theme(
    panel.background = element_blank(),
    axis.ticks = element_line(color = "gray50", linewidth =0.1),
    axis.line = element_line(color = "gray50", linewidth =0.1)
  )

#saving the plot
ggsave(plot = errbar, filename = "Error_bar.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating error bars in line plots
err_lne<-computed_data%>%ggplot(aes(x = Sub.Category, y = mean, group =1))+
  geom_line(color = "gray45", linewidth =0.9)+
  geom_point(size =3, color = "gray45")+
  geom_errorbar(aes(ymin = mean-se, ymax = mean+se), color = "tomato")+
  labs(title = "Error Bars in a Line Plot",x ="Sub Category", y = "Mean")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.1),
        axis.ticks = element_line(color = "gray45", linewidth = 0.1),data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABzElEQVR42u2Wy07CQBhGeRl3iF2Bz+DaRE0UNsYn0Z2vIE+hxLglMZq4IwYpV4G23JGrLS7GOTWsDEzbNMZFJ/l3c843l6bzx2L/aWhaaiehJTPxRPIysZe6DlIuKx24PIXuaqmDw+Ozm9u7e71QeHVKpbIIUrA4cOFU7vToJJOVkK3rFVEu/1SlUvVVaw4HLpxbd87R5HIPOlC1WhO1Wl3U6w23Go13T7WeD4sDF07cG4O5l2LxzQFC0my2RKvVFu22Icv0WIbLwOLAJZ2ruLZ/tXnH8qNgtUBITLMjOp2e6Hb7otcbeCrmwsDiwIUT99ZgJhqG5cL9/lAMh2MxGn2I8XjiqZgLA4sDF05lMKsEGAxGrmgymYnpdC5ms4WnYi4MLA5cOJXBHBGrBUQyny/FYvEplkvbUzEXBhYHLpzKYFbIUbFqBMhse+WrYGBx4MKpDObj4J5YMatH5DhfvgoGFgcunMpgvkyOiPta7zZIMCwOXDij4Cg4Cv6bYJ5F+V91wg42TUvxLMrHOp9/1MMOxrm1EaA9SacvspbVtcP6ZeLCqWz6aMxO0+fZp+cXdu4EfSRgceBSNnu/2lt5L4HbW1g/7W00ohHW+AYpkWmxvX/prAAAAABJRU5ErkJggg==
        axis.text.x = element_text(angle = 45, hjust = 1))

#saving the plot
ggsave(plot = err_lne, filename = "Error_Bars_Line_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)


