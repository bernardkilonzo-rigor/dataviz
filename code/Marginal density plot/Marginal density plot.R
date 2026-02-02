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

#creating marginal density
scplot<-ggMarginal(sc_plot, type = "density", groupColour = TRUE, groupFill = TRUE)

#saving marginal density
ggsave(plot = scplot, filename = "marginal_density_plot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating marginal histogram
marg_hist<-ggMarginal(sc_plot, type = "histogram", groupColour = TRUE, groupFill = TRUE)

#saving marginal histogram
ggsave(plot = marg_hist, filename = "Marginal_histogram.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating marginal box plot
marg_box<-ggMarginal(sc_plot, type = "boxplot", groupColour = TRUE, groupFill = TRUE)

#saving marginal box plot
ggsave(plot = marg_box, filename = "Marginal_boxplot.png",
       width = 8, height = 6, units = "in", dpi = 300)

#creating marginal violin
marg_violin<-ggMarginal(sc_plot, type = "violin", groupColour = TRUE, groupFill = TRUE)

#saving marginal violin
ggsave(plot = marg_violin, filename = "Marginal_violin.png",
       width = 8, height = 6, units = "in", dpi = 300)
