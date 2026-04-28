setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Parallel coordinates chart")

#load  libraries
library(GGally)
library(dplyr)

# Example dataset
df <- iris %>%
  mutate(Species = as.factor(Species))

# Parallel coordinates plot
ggparcoord(
  data = df,
  columns = 1:4,          # numeric columns
  groupColumn = 5,        # grouping variable
  scale = "uniminmax",    # scales each variable 0–1
  alphaLines = 0.6
) +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal() +
  labs(
    title = "Parallel Coordinates Plot (Iris Dataset)",
    x = "Features",
    y = "Scaled Values"
  )
