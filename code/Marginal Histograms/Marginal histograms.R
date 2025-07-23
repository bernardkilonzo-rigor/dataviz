#load libraries
library(tidyverse)
library(ggExtra)

#load data
superstore<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#creating the scatter plot
scatter_plot<-superstore%>%ggplot(aes(x = Discount, y = Quantity))+
  geom_point(color ="steelblue", size = 0.5)+
  labs(caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_line(color = "gray90", linewidth = 0.1),
        axis.line = element_line(colour = "gray60", linewidth = 0.2),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray30"))


#Adding marginal histograms
marginal_hist<-ggMarginal(scatter_plot, type = "histogram", fill ="lightblue", color = "steelblue", linewidth =0.1)

#saving the plot
ggsave(plot = marginal_hist, filename = "marginal_histogram.png",
       width = 8, height = 6, units = "in", dpi = 300)

