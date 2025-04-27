#load libraries 
library(dplyr)
library(ggplot2)
library(tidyverse)

#load dataset
data(starwars)

#filter out species that end with "man" and begin with letters "G", "D", and "W"
starwars_filtered <- starwars |>
  filter(!is.na(species) & 
           (str_detect(species, "man$") | str_detect(species, "^[GDW]"))) |>
  select(name, species, height, mass)

#Calculate BMI = mass (kg) / (height (m))^2
starwars_bmi <- starwars_filtered |>
  mutate(height_m = height / 100,  # Convert cm to meters
         BMI = mass / (height_m^2)) |>
  filter(!is.na(BMI))  

# Calculate mean BMI for each species
species_bmi_summary <- starwars_bmi |>
  group_by(species) |>
  summarise(mean_BMI = mean(BMI, na.rm = TRUE)) |>
  mutate(is_bigger = if_else(mean_BMI > 30, "yes", "no"))

ggplot(species_mean_bmi, aes(x = species, y = BMI, fill = is_bigger)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("yes" = "turquoise3", "no" = "salmon")) +
  labs(title = "The biggest species in Star Wars",
       x = "Species",
       y = "Body mass index (kg/m^2)",
       fill = "BMI > 30") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 10))
