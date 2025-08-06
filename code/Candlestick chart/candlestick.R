#load libraries
library(tidyverse)
library(quantmod)
library(xts)

#create a candlestick using local data
#load data
stock<-read.csv("https://raw.githubusercontent.com/bernardkilonzo-rigor/dataviz/main/data/Stock%20Exchange%20Sample%20Data.csv")

#converting date to a date object
stock$date <- as.Date(stock$date, format = "%d/%m/%Y")

#selecting the required columns
new_stock<-stock%>%select(-symbol)

#converting the data to xts
new_stock_xts<-xts(new_stock[,-1], order.by = new_stock$date)

#creating candlestick chart
chartSeries(new_stock_xts, type = "candlesticks",
            theme = chartTheme("white"),
            up.col = "#46bd71",
            dn.col = "#35366e",
            name = "WLTW Stock")

#saving the chart
png("candlestick_chart.png", width = 1400, height = 800) #opens PNG graphics device
chartSeries(new_stock_xts, type = "candlesticks",
            theme = chartTheme("white"),
            up.col = "#46bd71",
            dn.col = "#35366e",
            name = "WLTW Stock")
dev.off() #Closes the graphics device.

#create a candlestick using real-time data
#load data (getting Google stock data)
getSymbols("GOOG", src = "yahoo", from = "2024-07-01", to = "2025-06-30")

#creating a candlestick chart
chartSeries(GOOG, type = "candlesticks",
            theme = chartTheme("white"),
            up.col = "#46bd71",
            dn.col = "#35366e",
            name = "Google Stock")

#saving the chart
png("candlestick_chart_1.png", width = 1400, height = 800) #opens PNG graphics device
chartSeries(GOOG, type = "candlesticks",
            theme = chartTheme("white"),
            up.col = "#46bd71",
            dn.col = "#35366e",
            name = "Google Stock")
dev.off() #Closes the graphics device.
