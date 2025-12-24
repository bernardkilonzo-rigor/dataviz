#load libraries
library(tidyverse)

#create sample data
target <- data.frame(
  product = c("Chairs","Tables","Stationary","Phones","Copiers","Books","Printers"),
  sales = c(800,1200,200,2500,1500,650,1800),
  target = c(1000,1100,300,2900,1700,500,1500),
  target_80_percent = c(300,330,90,870,510,150,450),
  target_50_percent = c(500,550,150,1450,850,250,750)
)

#flagging products met or exceeded target
target<-target%>%
  mutate(kpi = if_else(
    sales>=target,"on_target","below_target"
  ))

#shaping data
data_pivot<-target%>%pivot_longer(target_80_percent:target_50_percent, names_to = "targets", values_to = "value")

#ordering the targets
data_pivot$targets<-factor(data_pivot$targets, levels = c("target_80_percent","target_50_percent"))

#creating bullet chart in ggplot2
bc<-ggplot(data_pivot, aes(x = product, y = value)) +
  geom_bar(aes(fill = targets), stat = "identity", width = 0.6) +
  geom_bar(data = target, aes(x = product, y = sales, fill = kpi), stat = "identity", width = 0.3) +
  geom_point(data = target, aes(x = product, y = target),stat = "identity", color = "red", size = 4) +
  coord_flip() +
  scale_fill_manual(values = c( "target_80_percent" = "#d3d3d3", "target_50_percent" = "#a9a9a9","on_target"="steelblue",
                                "below_target"="orange")) +
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

#loading plotly library
library(plotly)

#Adding color flag
target_cl <-target%>%
  mutate(Status = if_else(
    sales>=target,"on_target","below_target"),
    Color = ifelse(Status == "on_target", "forestgreen", "firebrick"))

#creating a bullet graph with plotly library
target_cl%>%plot_ly(y = ~product,
                 x = ~sales,
                 type = "bar",
                 orientation = "h",
                 marker = list(color = ~Color),
                 name = ~Status)%>%
  add_trace(x = ~target,
            y = ~product,
            type = "scatter",
            mode = "markers",
            marker = list(color = "black", symbol ="circle",size =10),
            name = "Target Sales")%>%
  add_trace(x = ~target_50_percent,
            y = ~product,
            type = "scatter",
            marker = list(color = "lightgray",symbol = "diamond", size = 7),
            name = "80%-Target")%>%
  add_trace(x = ~target_80_percent,
            y = ~product,
            type = "scatter",
            marker = list(color = "orange",symbol = "diamond", size = 7),
            name = "50%-Target")%>%
  layout(
    title = list(text ="<b>Bullet Graph: Actual Sales vs. Target Sales</b>",font = list(font = 10, color = "steelblue")),
    xaxis = list(title = "Sales"),
    yaxis = list(title = "")
  )
  
