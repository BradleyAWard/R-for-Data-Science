## 1) Data Visualization

R has several systems for making graphs, but *ggplot2* is one of the most elegant and versatile. We start by visualizing data using *ggplot2* by creating a simple scatter plot and use it to introduce aesthetic mappings and geometric objects - the fundamental building blocks of *ggplot2*. We then look at visualizing distributions of single variables, relationships between two or more variables and saving plots.

### First Steps

In addition to *tidyverse* we use the *palmerpenguins* package, which includes the *penguins* dataset. Do penguins with longer flippers weigh more or less than penguins with shorter flippers? What does the relationship between flipper length and body mass look like? Does the relationship vary by the species of the penguin r the island where the penguin lives? The *penguins* data frame contains 344 observations. We define the following:

- *Variable*

A quantity, quality or property that you can measure

- *Value*

The state of a variable when you measure it. The value of a variable may change from measurement to measurement.

- *Observation*

A set of measurements made under similar conditions. An observation will contain several values, each associated with a different variable. This may be referred to as a data point.

- *Tabular data*

A set of values, each associated with a variable and an observation.

In this context, a variable refers to an attribute of all the penguins, and an observation refers to all the attributes of a single penguin. The *penguins* data frame is given in the form of a *tibble*, which is common to the tidyverse.

### Creating a plot

With *ggplot2*, you begin a plot with the function $\texttt{ggplot()}$, defining a plot object that you then add *layers* to. The first argument of $\texttt{ggplot()}$ is the dataset to use in the graph.


