library(tidyverse)
library(palmerpenguins)

# Code 1
# An example plot of penguin flipper length by body mass
ggplot(
       data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# Code 2
# An example plot of penguin flipper length by body mass
ggplot(
       data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point()

# Code 3
# An example plot of penguin flipper length by body mass
ggplot(
       data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  geom_smooth(method = "lm")

# Code 4
# An example plot of penguin flipper length by body mass
ggplot(
       data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

# Code 5
# An example plot of penguin flipper length by body mass
ggplot(
       data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm") +
  labs(
       title = "Body mass and flipper length",
       subtitle = "Dimensions for Adelie, Chinstrap and Gentoo Penguins",
       x = "Flipper length [mm]",
       y = "Body mass [g]",
       color = "Species",
       shape = "Species")