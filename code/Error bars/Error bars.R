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
computed_data%>%ggplot(aes(x = Sub.Category, y = mean, group =1))+
  geom_line(color = "gray45", linewidth =0.9)+
  geom_point(size =3, color = "gray45")+
  geom_errorbar(aes(ymin = mean-se, ymax = mean+se), color = "tomato")+
  labs(title = "Error Bars in a Line Plot",x ="Sub Category", y = "Mean")+
  theme(panel.background = element_blank(),
        axis.line = element_line(color = "gray45", linewidth = 0.1),
        axis.ticks = element_line(color = "gray45", linewidth = 0.1),
        axis.text.x = element_text(angle = 45, hjust = 1))



