setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Table")

#load libraries
library(tidyverse)
library(knitr)

#load data set
superstore <- read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Sample%20-%20Superstore.csv")

#simple, clean, and flexible tables - knitr::kable()



#beautiful, publication-quality tables - gt



#interactive tables (search, sort, filter) - DT::datatable()


#best for word/powerpoint reports - flextable



#modern highly interactive tables - reactable

