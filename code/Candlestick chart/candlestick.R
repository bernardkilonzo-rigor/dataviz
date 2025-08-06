setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Candlestick chart")
#load libraries
library(tidyverse)
library(quantmod)
library(xts)

#create a candlestick using local data
#load data
stock<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Stock%20Exchange%20Sample%20Data.csv")
view(stock)
#converting date to a date object
stock$date <- as.Date(stock$date, format = "%d/%m/%Y")

#selecting the required columns
new_stock<-stock%>%select(-symbol)

#converting the data to xts
new_stock_xts<-xts(new_stock[,-1], order.by = new_stock$date)

#creating a simple plot
chartSeries(new_stock_xts, type = "candlesticks",
            theme = chartTheme("white"),
            name = "WLTW Stock")

#saving the plot
png("candlestick_chart.png", width = 800, height = 600) #opens PNG graphics device
chartSeries(new_stock_xts, type = "candlesticks",
            theme = chartTheme("white"),
            name = "WLTW Stock")
dev.off() #Closes the graphics device.

#create a candlestick using real-time data
#load data (getting Google stock data)
getSymbols("GOOG", src = "yahoo", from = "2024-07-01", to = "2025-06-30")

#create the plot
chartSeries(GOOG, type = "candlesticks", theme = chartTheme("white"))
