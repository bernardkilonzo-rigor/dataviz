setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Parallel coordinates chart")
#load  libraries
library(GGally)
library(dplyr)

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
    plot.caption = element_text(family = "serif", face = "italic", size = 9, color = "gray50")
  )
