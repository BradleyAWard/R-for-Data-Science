library(tidyverse)
library(palmerpenguins)

# Code 1
# An example plot of penguin flipper length by body mass
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# Code 2
# An example plot of penguin flipper length by body mass (with colour)
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point()

# Code 3
# An example plot of penguin flipper length by body mass (with smooth fit)
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  geom_smooth(method = "lm")

# Code 4
# An example plot of penguin flipper length by body mass (with fit for species)
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

# Code 5
# An example plot of penguin flipper length by body mass (with labels)
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm") +
  labs(title = "Body mass and flipper length",
       subtitle = "Dimensions for Adelie, Chinstrap and Gentoo Penguins",
       x = "Flipper length [mm]",
       y = "Body mass [g]",
       color = "Species",
       shape = "Species")

# Code 6
# Bar chart with ordered categorical variables
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

# Code 7
# A histogram of penguin body mass
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)

# Code 8
# A density plot of penguin body mass
ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()

# Code 9
# A boxplot of body mass by species
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

# A density plot of body mass by species
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(linewidth = 0.75, alpha = 0.5)

# Code 10
# A stacked bar chart for penguin species on different islands
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

# A relative stacked bar chart for penguins species on different islands
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

# Code 11
# A scatterplot where color maps to species and shape maps to island
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

# Code 12
# A scatterplot (as above), in separate subplots
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(aes(color = species, shape = island)) +
  facet_wrap(~island)

# Code 13
# Saving a plot
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")
