#load library
library(sunburstR)

#create hierarchical data
data <- data.frame(
  paths = c("Technology-Consumer-Tables", "Furniture-Corporate-Bookcases", "Office Supplies-Home Office-Furnishings"),
  values = c(55, 150, 760)
)

#create sunburst chart
sunburst(data)
