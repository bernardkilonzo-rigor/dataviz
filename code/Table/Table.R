setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Table")

#load libraries
library(tidyverse)
library(knitr)
library(gt)
library(DT)
library(flextable)
library(reactable)

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
datatable(x, filter = "top") #expand it in length

#best for word/powerpoint reports - flextable
tb<- flextable(x)
autofit(tb) #gives Word/PPT a natural width baseline
theme_vanilla(tb) #adding professional theme

flextable(x)%>%
  autofit()%>% #gives Word/PPT a natural width baseline
  theme_vanilla()%>%
  fontsize(size = 10, part = "all") %>% #customize fonts
  align(align = "center", part = "all") %>% #alignment
  padding(padding = 4, part = "all") %>% #padding
  add_footer_lines(values = "Source: Sample-Superstore Data Set")%>%
  set_caption(caption = "Product Performance Summary")

#modern highly interactive tables - reactable

reactable(x%>% tibble::rownames_to_column("model"),
searchable = TRUE,
filterable = TRUE,
pagination = TRUE,
highlight = TRUE,
striped = TRUE,
bordered = FALSE)
