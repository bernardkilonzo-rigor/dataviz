setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Marginal density plot")

#load libraries
library(tidyverse)
library(ggExtra)

#creating a scatter plot
sc_plot<-iris%>%ggplot()+
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species),
             alpha = 0.6, shape =16)+
  theme_minimal()+
  theme(legend.position = "bottom")+
  labs(x = "Sepal Length", y = "Sepal Width")

#creating marginal density plot
scplot<-ggMarginal(sc_plot, type = "density", groupColour = TRUE, groupFill = TRUE)

#saving the plot
ggsave(plot = scplot, filename = "marginal_density_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating marginal histograms
marg_hist<-ggMarginal(sc_plot, type = "histogram", groupColour = TRUE, groupFill = TRUE)

#saving marginal histogram
ggsave(plot = marg_hist, filename = "Marginal_histogram.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating marginal box plot
marg_box<-ggMarginal(sc_plot, type = "boxplot", groupColour = TRUE, groupFill = TRUE)

#saving marginal box plot
ggsave(plot = marg_box, filename = "Marginal_boxplot.png",
       width = 8, height = 6, units = "in", dpi = 300)
