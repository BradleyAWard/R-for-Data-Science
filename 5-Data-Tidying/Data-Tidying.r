library(tidyverse)
library(billboard)

# Code 1
# The billboard dataset
billboard

# Code 2
# Tidying billboard with pivot_longer()
billboard |>
  pivot_longer(cols = starts_with("wk"),
               names_to = "week",
               values_to = "rank",
               values_drop_na = TRUE)

# Code 3
# Tidying billboard with pivot_longer() and mutate()
billboard_longer <- billboard |>
  pivot_longer(cols = starts_with("wk"),
               names_to = "week",
               values_to = "rank",
               values_drop_na = TRUE) |>
  mutate(week = parse_number(week))

billboard_longer

# Code 4
# Plot of song rank over time
billboard_longer |>
  ggplot(aes(x = week, y = rank, group = track)) +
  geom_line(alpha = 0.25) +
  scale_y_reverse()
ggsave(filename = "Outputs/Data_Tidying/Code_4.jpg", width = 5, height = 4, dpi = 500)
