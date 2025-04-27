library(ggplot2)
library(scales)
library(RColorBrewer)

setwd("/Users/mishasharma/Desktop/InfoVisualisation /worksheet4") # File path
load("Ontario.RData") # Load the data

# Figure 1
ggplot(df_on, aes(x = Year, y = Population)) +  
  geom_smooth(method = "loess", color = "darkgrey") +
  geom_point() +  # Scatterplot 
  scale_x_continuous(limits = c(2010, 2020), 
                     breaks = scales::pretty_breaks(n = 6)) +  # Limiting x-axis and pretty breaks
  scale_y_continuous(labels = scales::comma_format(scale = 1000)) +  # Comma labels on y-axis with scale 1000
  labs(
    title = "Ontario Population over Time, Coloured by Yearly Change",  # Title for the graph
    y = "Total Population"  # Title for y-axis
  )  

# Figure 2
ggplot(df_on, aes(x = Year, y = Population)) +  
  geom_smooth(method = "loess", color = "darkgrey") +
  geom_point(aes(color = pop_change)) +  # Scatterplot 
  scale_x_continuous(limits = c(2010, 2020), 
                     breaks = scales::pretty_breaks(n = 6)) +  # Limiting x-axis and pretty breaks
  scale_y_continuous(labels = scales::comma_format(scale = 1000)) +  # Comma labels on y-axis with scale 1000
  scale_color_distiller(name = "Pop Change", palette = "PuRd", direction = -1, 
                        limits = c(5, NA), breaks = c(5, 10, 15)) +  
  labs(
    title = "Ontario Population over Time, Coloured by Yearly Change",  # Title for the graph
    y = "Total Population"  # Title for y-axis
  )  

# scale_color_distiller --> TA said use this 
