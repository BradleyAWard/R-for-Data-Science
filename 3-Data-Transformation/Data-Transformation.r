library(tidyverse)
library(Lahman)

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

# Code 6
# Create new columns for gain an average speed
flights |>
  mutate(gain = dep_delay - arr_delay,
         speed = distance / air_time * 60,
         .before = 1)

# Code 7
# Select columns by name
flights |>
  select(year, month, day)

# Select all columns between year and day (inclusive)
flights |>
  select(year:day)

# Select all columns except those from year to day
flights |>
  select(!year:day)

# Select all columns that are characters
flights |>
  select(where(is.character))

# Code 8
# Combining verbs with the pipe
flights |>
  filter(dest == "IAH") |>
  mutate(speed = distance / air_time * 60) |>
  select(year:day, dep_time, carrier, flight, speed) |>
  arrange(desc(speed))

# Code 9
# The average delay of flights by month
flights |>
  group_by(month) |>
  summarize(n = n(),
            delay = mean(dep_delay, na.rm = TRUE))

# Code 10
# Takes the first row from each group
df |> slice_head(n = 1)

# Takes the last row in each group
df |> slice_tail(n = 1)

# Takes the row with the smallest value of column x
df |> slice_min(x, n = 1)

# Takes the row with the largest value of column x
df |> slice_max(x, n = 1)

# Takes one random row
df |> slice_sample(n = 1)

# Code 11
# Flights that are most delayed upon arrival
flights |>
  group_by(dest) |>
  slice_max(arr_delay, n = 1, with_ties = FALSE) |>
  relocate(dest)

# Code 12
# Calculate the batter's average and plot against at-bats
batters <- Lahman::Batting |>
  group_by(playerID) |>
  summarize(n = sum(AB, na.rm = TRUE),
            average = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE))

batters |>
  filter(n > 100) |>
  ggplot(aes(x = n, y = average)) +
  geom_point(alpha = 1/10) +
  geom_smooth(se = FALSE)
ggsave(filename = "Outputs/Data_Transformation/Code_12.jpg", width = 5, height = 4, dpi = 500)
