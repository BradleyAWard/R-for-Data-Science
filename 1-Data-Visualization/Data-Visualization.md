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

With *ggplot2*, you begin a plot with the function $\texttt{ggplot()}$, defining a plot object that you then add *layers* to. The first argument of $\texttt{ggplot()}$ is the dataset to use in the graph. Next, we need to tell $\texttt{ggplot()}$ how the information from our data will be visually represented. The $\texttt{mapping}$ argument of the function defines how variables in your dataset are mapped to the aesthetics of your plot. The $\texttt{mapping}$ argument is always defined in the $\texttt{aes()}$ function. Defining the observations from our data frame on our plot requires us to define a *geom*: the geometrical object that a plot uses to represent the data. People often describe plots by the type of geom that the plot uses. For example, bar charts use $\texttt{geom\textunderscore bar()}$, line charts use $\texttt{geom\textunderscore line()}$, boxplots use $\texttt{geom\textunderscore boxplot()}$ and scatter plots use $\texttt{geom\textunderscore point()}$. 

[Code 1]

Let us review the warning message: "Removed 2 rows containing missing values ('geom_point()')". We are seeing this message because there are two penguins in our dataset with missing body mass and/or flipper length values. R and ggplot2 do not allow missing values to silently go missing. 

### Adding Aesthetics and Layers

Let us incorporate species into our plot and see if this reveals any additional insights into the apparent relationship between these variables. To achieve this, we need to modify the aesthetic of the geom.

[Code 2]

When a categorical variable is mapped to an aesthetic, ggplot2 will automatically assign a unique value of the aesthetic (here a unique value) to each unique level of the variable (each of the three species), a process known as *scaling*.

Let us add one more layer: a smooth curve displaying the relationship between body mass and flipper length. Since this is a new geometric object representing our data, we will add a new geom as a layer on top of our point geom: $\texttt{geom\textunderscore smooth()}$, and we will specify that we want to draw the line of best fit on a linear model with method = "lm".

[Code 3]

We have successfully added lines, but it has created separate lines for each of the penguin species. When aesthetic mappings are defined in $\texttt{ggplot()}$, at the *global* level, they are passed down to each of the subsequent geom layers of the plot. However, each geom function in ggplot2 can also take a $\texttt{mapping}$ argument, which allows for aesthetic mappings at the *local* level that are added to those inherited from the global level. To create a line for all points we should specify $\texttt{color = species}$ for $\texttt{geom\textunderscore point()}$ only.

[Code 4]

If we wanted to use different shapes for each species of penguins we could map $\texttt{species}$ to the $\texttt{shape}$ aesthetic.

Finally, we can improve the labels of our plot using the $\texttt{labs()}$ function in a new layer. Arguments that can be include: $\texttt{title}$, $\texttt{subtitle}$, $\texttt{x}$, $\texttt{y}$, and $\texttt{color}$ and $\texttt{shape}$, which define the label for the legend.

[Code 5]