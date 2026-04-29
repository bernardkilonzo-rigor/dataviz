setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Parallel coordinates chart")
#load  libraries
library(GGally)
library(dplyr)
library(plotly)

#sample data set
df <- iris %>%
  mutate(Species = as.factor(Species))

#creating parallel coordinates plot
pc<- ggparcoord(
  data = df,
  columns = 1:4, #numeric columns
  groupColumn = 5, #grouping variable
  scale = "uniminmax", #scales each variable to the 0–1 range
  alphaLines = 0.6 #controls line transparency
) +
  scale_color_brewer(palette = "Dark2") +
  labs(
    title = "Parallel Coordinates Plot (Iris Dataset)",
    x = "Features",
    y = "Scaled Values",
    caption = "Viz By: Bernard Kilonzo"
  )+
  theme(
    panel.background = element_blank(),
    plot.title = element_text(family = "serif", face = "bold", size = 15),
    plot.caption = element_text(family = "serif", face = "italic", size = 11, color = "gray40")
  )

#saving the plot
ggsave(plot = pc, filename = "Parallel_coordinates_plot.png", width = 8,
       height = 6, units = "in", dpi = 300)

#creating parallel coordinates plot with Plotly library
group_vals <- as.numeric(as.factor(df[[5]]))

plot_ly(
  type = 'parcoords',
  line = list(
    color = group_vals,
    colorscale = 'Viridis',   # or 'Jet', 'Portland', etc.
    showscale = TRUE
  ),
  dimensions = list(
    list(label = names(df)[1], values = df[[1]]),
    list(label = names(df)[2], values = df[[2]]),
    list(label = names(df)[3], values = df[[3]]),
    list(label = names(df)[4], values = df[[4]])
  )
)
