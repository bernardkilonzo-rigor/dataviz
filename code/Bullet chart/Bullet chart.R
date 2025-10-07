setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Bullet chart")

#load libraries
library(tidyverse)

#create sample data
data <- data.frame(
  product = c("Chairs","Tables","Stationary","Phones","Copiers","Books","Printers"),
  sales = c(800,1200,200,2500,1500,650,1800),
  target = c(1000,1100,300,2900,1700,500,1500),
  target_80_percent = c(800,880,240,2320,1360,400,1200),
  target_50_percent = c(500,550,150,1450,850,250,750)
)

#shaping data
data_pivot<-data%>%pivot_longer(target_80_percent:target_50_percent, names_to = "targets", values_to = "value")
view(data_pivot)

#creating bullet chart in ggplot2
ggplot(data_pivot, aes(x = product, y = value)) +
  geom_bar(aes(fill = targets), stat = "identity", width = 0.6) +
  geom_bar(data = data, aes(x = product, y = sales), stat = "identity", fill = "black", width = 0.3) +
  geom_point(data = data, aes(x = product, y = target),stat = "identity", color = "red", size = 4) +
  coord_flip() +
  scale_fill_manual(values = c("target_50_percent" = "#d3d3d3", "target_80_percent" = "#a9a9a9")) +
  labs(title = "Bullet Chart Example", x = "", y = "Value") +
  theme_minimal()
