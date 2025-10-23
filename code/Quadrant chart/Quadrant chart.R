setwd("C:\\Users\\berna\\OneDrive\\Desktop\\Production\\dataviz\\code\\Quadrant chart")
#load libraries
library(ggplot2)

#dataset
set.seed(123)
df <- data.frame(
  name = paste("Item", 1:20),
  x = rnorm(20, mean = 50, sd = 10),
  y = rnorm(20, mean = 50, sd = 10)
)

#quandrant boundaries
x_mid <- mean(df$x)
y_mid <- mean(df$y)


#Creating quandrant
ggplot(df, aes(x = x, y = y)) +
  geom_point(size = 3, color = "steelblue") +
  geom_vline(xintercept = x_mid, linetype = "dashed", color = "gray") +
  geom_hline(yintercept = y_mid, linetype = "dashed", color = "gray") +
  geom_text(aes(label = name), vjust = -1, size = 3) +
  theme_minimal() +
  labs(title = "Quadrant Chart", x = "X Axis", y = "Y Axis")

#coloring by quanadrant
df$quadrant <- with(df, ifelse(x > x_mid & y > y_mid, "Q1",
                               ifelse(x < x_mid & y > y_mid, "Q2",
                                      ifelse(x < x_mid & y < y_mid, "Q3", "Q4"))))
ggplot(df, aes(x = x, y = y, color = quadrant)) +
  geom_point(size = 3) +
  geom_vline(xintercept = x_mid, linetype = "dashed") +
  geom_hline(yintercept = y_mid, linetype = "dashed") +
  theme_minimal()
