# Misha Sharma: 100826646
# Part 1:

# Step 1, 2 and 3
library(readxl) # Loading the required libraries 
library(tidyverse) # Loading the required libraries 

file_path <- "~/Desktop/InfoVisualisation /worksheet1/bc_trade.xlsx" # File path 
df <- read_xlsx(file_path, skip = 5)|> # Reading file
  rename(month = "Month of year", energy = "Energy outputs") # Renaming columns 1 and 3

#Part 2:

# Step 4: Create a vector of colours for the bars
df$fill_colour <- "#cccccc"  # Default colours
df$fill_colour[df$month == "Jun"| df$month == "Jul"| df$month == "Aug"] <- "firebrick" # Setting summer months to firebrick

# Step 5: Create the bar plot
df$energy |> barplot(
  names.arg = df$month,
  col = df$fill_colour,
  space = 0,  # Bar spacing set to 0   
  main = "British Columbia Energy Exports",
  border= NA,
  xlab = "Month",
  ylab = "Exports ($ thousands)"
)
