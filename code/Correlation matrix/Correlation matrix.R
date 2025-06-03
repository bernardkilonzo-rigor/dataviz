library(tidyverse)
library(ggcorrplot)

#loading data
sample_data<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/refs/heads/main/data/Correlation%20matrix.csv")

#computing the correlation matrix
corr_matrix<-cor(sample_data)

#Creating correlation matrix (plot type full)
corr_v1<-ggcorrplot(corr_matrix, method = "square", type = "full",
           lab = TRUE, lab_size = 3.5, lab_col = "gray15",
           colors = c("brown","gray","steelblue"),
           legend.title = "correlation")+
  labs(caption = "Viz by: Bernard Kilonzo", title ="Correlation Matrix Plot")+
  theme(axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        legend.title = element_text(family = "serif", size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 8, colour = "gray35"),
        plot.title = element_text(family = "serif",face = "bold", size = 14, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = corr_v1, filename = "Corr_plot_v1.png",
       width = 8, height = 6, units = "in", dpi = 300) 

#creating correlation matrix_v2 (plot type = upper)
corr_v2<-ggcorrplot(corr_matrix, method = "square", type = "upper",#changing type to "upper"
           lab = TRUE, lab_size = 3.5, lab_col = "gray15",
           colors = c("brown","gray","steelblue"),
           legend.title = "correlation")+
  labs(caption = "Viz by: Bernard Kilonzo", title ="Correlation Matrix Plot")+
  theme(axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        panel.grid = element_line(color = "gray95", linewidth = 0.3),
        legend.title = element_text(family = "serif", size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 8, colour = "gray35"),
        plot.title = element_text(family = "serif",face = "bold", size = 14, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = corr_v2, filename = "corr_plot_v2.png",
       width = 8, height = 6, units = "in", dpi = 300) 

#creating correlation matrix_v3 (plot type lower)
corr_v3<-ggcorrplot(corr_matrix, method = "square", type = "lower",#changing type to "lower"
           lab = TRUE, lab_size = 3.5, lab_col = "gray15",
           colors = c("brown","gray","steelblue"),
           legend.title = "correlation")+
  labs(caption = "Viz by: Bernard Kilonzo", title ="Correlation Matrix Plot")+
  theme(axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        panel.grid = element_line(color = "gray95", linewidth = 0.3),
        legend.title = element_text(family = "serif", size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 8, colour = "gray35"),
        plot.title = element_text(family = "serif",face = "bold", size = 14, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = corr_v3, filename = "corr_plot_v3.png",
       width = 8, height = 6, units = "in", dpi = 300) 

#creating correlation matrix_v4 (plotting circle)
corr_v4<-ggcorrplot(corr_matrix, method = "circle", type = "lower",#method=circle & type=lower
           lab = TRUE, lab_size = 3, lab_col = "gray15",
           colors = c("brown","gray","steelblue"),
           legend.title = "correlation")+
  labs(caption = "Viz by: Bernard Kilonzo", title ="Correlation Matrix Plot")+
  theme(axis.text = element_text(family = "serif", size = 9, color = "gray35"),
        panel.grid = element_line(color = "gray95", linewidth = 0.3),
        legend.title = element_text(family = "serif", size = 9, color = "gray35"),
        legend.text = element_text(family = "serif", size = 8, colour = "gray35"),
        plot.title = element_text(family = "serif",face = "bold", size = 14, color = "gray25"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray35"))

#saving the plot
ggsave(plot = corr_v4, filename = "corr_plot_v4.png",
       width = 8, height = 6, units = "in", dpi = 300) 
