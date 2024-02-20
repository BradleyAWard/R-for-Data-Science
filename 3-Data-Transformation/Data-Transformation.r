library(tidyverse)
library(nycflights13)

# Code 1
# All flights that departed more than two hours late
flights |>
  filter(dep_delay > 120)

# Flights that departed on 1st January
flights |>
  filter(month == 1 & day == 1)

# FLights that departed in January or February
flights |>
  filter(month == 1 | month == 2)

# Code 2
# Flights that departed in January or February
flights |>
  filter(month %in% c(1, 2))

# Code 3
# Sort the flights by departure time
flights |>
  arrange(year, month, day, dep_time)

# Code 4
# Order the flights from most to least delayed
flights |>
  arrange(desc(dep_delay))

# Code 5
# Remove all duplicate rows
flights |>
  distinct()

# Find all unique combinations of origin and destination
flights |>
  distinct(origin, dest)
  