setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Table")

#load libraries
library(tidyverse)
library(knitr)
library(gt)

#load data set
superstore <- read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#simple, clean, and flexible tables - knitr::kable()
x <- superstore%>%
  group_by(Region, Sub.Category)%>%
  summarise(sales = sum(Sales))%>%
  pivot_wider(names_from = Sub.Category, values_from = sales)

kable(x)

#beautiful, publication-quality tables - gt
x%>%gt()%>%
  tab_style(
    style = cell_borders(
      sides = "bottom",
      color = "black",
      weight = px(2)
    ),
    locations = cells_column_labels()
  )

#interactive tables (search, sort, filter) - DT::datatable()


#best for word/powerpoint reports - flextable



#modern highly interactive tables - reactable

