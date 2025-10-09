#load libraries
library(tidyverse)

#create sample data
data <- data.frame(
  product = c("Chairs","Tables","Stationary","Phones","Copiers","Books","Printers"),
  sales = c(800,1200,200,2500,1500,650,1800),
  target = c(1000,1100,300,2900,1700,500,1500),
  target_80_percent = c(300,330,90,870,510,150,450),
  target_50_percent = c(500,550,150,1450,850,250,750)
)

#shaping data
data_pivot<-data%>%pivot_longer(target_80_percent:target_50_percent, names_to = "targets", values_to = "value")

#ordering the targets
data_pivot$targets<-factor(data_pivot$targets, levels = c("target_80_percent","target_50_percent"))

#creating bullet chart in ggplot2
bc<-ggplot(data_pivot, aes(x = product, y = value)) +
  geom_bar(aes(fill = targets), stat = "identity", width = 0.6) +
  geom_bar(data = data, aes(x = product, y = sales), stat = "identity", fill = "black", width = 0.3) +
  geom_point(data = data, aes(x = product, y = target),stat = "identity", color = "red", size = 4) +
  coord_flip() +
  scale_fill_manual(values = c( "target_80_percent" = "#d3d3d3", "target_50_percent" = "#a9a9a9")) +
  labs(title = "Bullet Chart", x = "Product", y = "Sales", fill = "Legend", caption = "Viz by: Bernard Kilonzo")+
  theme(panel.background = element_blank(),
        axis.title = element_text(family = "serif",face = "bold", size = 10, color = "gray30"),
        axis.text = element_text(family = "serif", size = 9, color = "gray30"),
        axis.ticks = element_line(linewidth = 0.2, color = "gray30"),
        legend.title = element_text(family = "serif", face = "bold", size = 10, color = "gray30"),
        legend.text = element_text(family = "serif", size = 9, color = "gray30"),
        plot.title = element_text(family = "serif",face = "bold", size = 13, color = "gray30"),
        plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray40"))

#saving the plot
ggsave(plot = bc, filename = "bullet_chart.png",
       width = 8, height = 6, units = "in", dpi = 300)
