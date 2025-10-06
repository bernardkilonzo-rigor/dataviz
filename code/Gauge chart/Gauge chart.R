setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Gauge chart")

#load libraries
library(plotly)
library(webshot)
webshot::install_phantomjs()
#creating gauge chart
gp<-plot_ly(
  type = "indicator",
  mode = "gauge+number+delta",
  value = 55,                        #Current value
  delta = list(reference = 85),      #Target value for comparison
  gauge = list(
    axis = list(range = list(0, 100)), #Axis range
    steps = list(
      list(range = c(0, 35), color = "lightgray"),
      list(range = c(35, 70), color = "yellow"),
      list(range = c(70, 100), color = "green")
    ),
    threshold = list(
      line = list(color = "red", width = 4),
      thickness = 0.75,
      value = 80                       # Threshold marker
    )
  ),
  title = list(text = "KPI Gauge Chart")
)


#saving the plot
plotly::export(p =gp, file = "gauge_plot.png")
