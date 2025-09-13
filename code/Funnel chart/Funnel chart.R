setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Funnel chart")

#Load libraries
library(tidyverse)

#create data
advert_data<-data.frame(
  Stage =c("Ads Reach","Visitors","Leads","Customers"),
  Value =c(2500,986,197,25)
)

#Adding y-position for plotting
advert_data<-advert_data%>%
  mutate(Stage = factor(Stage, levels = rev(Stage)),
                                  ymin = cumsum(Value) - Value,
                                  ymax = cumsum(Value))

#Creating the plot
ggplot(advert_data) +
  geom_rect(aes(xmin = -Value/2, xmax = Value/2, ymin = ymin, ymax = ymax, fill = Stage)) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_flip() +
  theme_minimal()

