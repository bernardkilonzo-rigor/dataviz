setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Gauge chart")

#load libraries
library(plotly)

#creating gauge chart
plot_ly(
  type = "indicator",
  mode = "gauge+number+delta",
  value = 70,                        #Current value
  delta = list(reference = 80),      #Target value for comparison
  gauge = list(
    axis = list(range = list(0, 100)), #Axis range
    steps = list(
      list(range = c(0, 50), color = "lightgray"),
      list(range = c(50, 80), color = "yellow"),
      list(range = c(80, 100), color = "green")
    ),
    threshold = list(
      line = list(color = "red", width = 4),
      thickness = 0.75,
      value = 90                       # Threshold marker
    )
  ),
  title = list(text = "KPI Gauge Chart")
)
