setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Sunburst")

#load library
library(plotly)

#create data set
data <- data.frame(
  Labels = c("France", "England", "Kenya", "Sudan", "India", "China", "Germany"),
  Parents = c("Europe", "Europe", "Africa", "Africa", "Asia", "Asia", "Europe"),
  Values = c(3, 10, 5, 15, 7, 20, 8)
)

#create sunburst chart
fig <- plot_ly(
  labels = data$Labels,
  parents = data$Parents,
  values = data$Values,
  type = 'sunburst'
)

fig

