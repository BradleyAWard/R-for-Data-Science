## 1) Data Visualization

R has several systems for making graphs, but *ggplot2* is one of the most elegant and versatile. We start by visualizing data using *ggplot2* by creating a simple scatter plot and use it to introduce aesthetic mappings and geometric objects - the fundamental building blocks of *ggplot2*. We then look at visualizing distributions of single variables, relationships between two or more variables and saving plots.

---

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

---

### Creating a plot

With *ggplot2*, you begin a plot with the function $\texttt{ggplot()}$, defining a plot object that you then add *layers* to. The first argument of $\texttt{ggplot()}$ is the dataset to use in the graph. Next, we need to tell $\texttt{ggplot()}$ how the information from our data will be visually represented. The $\texttt{mapping}$ argument of the function defines how variables in your dataset are mapped to the aesthetics of your plot. The $\texttt{mapping}$ argument is always defined in the $\texttt{aes()}$ function. Defining the observations from our data frame on our plot requires us to define a *geom*: the geometrical object that a plot uses to represent the data. People often describe plots by the type of geom that the plot uses. For example, bar charts use $\texttt{geom\_ bar()}$, line charts use $\texttt{geom\_ line()}$, boxplots use $\texttt{geom\_ boxplot()}$ and scatter plots use $\texttt{geom\_ point()}$. 

[Code 1]

Let us review the warning message: "Removed 2 rows containing missing values ('geom_point()')". We are seeing this message because there are two penguins in our dataset with missing body mass and/or flipper length values. R and ggplot2 do not allow missing values to silently go missing. 

#### Adding Aesthetics and Layers

Let us incorporate species into our plot and see if this reveals any additional insights into the apparent relationship between these variables. To achieve this, we need to modify the aesthetic of the geom.

[Code 2]

When a categorical variable is mapped to an aesthetic, ggplot2 will automatically assign a unique value of the aesthetic (here a unique value) to each unique level of the variable (each of the three species), a process known as *scaling*.

Let us add one more layer: a smooth curve displaying the relationship between body mass and flipper length. Since this is a new geometric object representing our data, we will add a new geom as a layer on top of our point geom: $\texttt{geom\_ smooth()}$, and we will specify that we want to draw the line of best fit on a linear model with method = "lm".

[Code 3]

We have successfully added lines, but it has created separate lines for each of the penguin species. When aesthetic mappings are defined in $\texttt{ggplot()}$, at the *global* level, they are passed down to each of the subsequent geom layers of the plot. However, each geom function in ggplot2 can also take a $\texttt{mapping}$ argument, which allows for aesthetic mappings at the *local* level that are added to those inherited from the global level. To create a line for all points we should specify $\texttt{color = species}$ for $\texttt{geom\_ point()}$ only.

[Code 4]

If we wanted to use different shapes for each species of penguins we could map $\texttt{species}$ to the $\texttt{shape}$ aesthetic.

Finally, we can improve the labels of our plot using the $\texttt{labs()}$ function in a new layer. Arguments that can be include: $\texttt{title}$, $\texttt{subtitle}$, $\texttt{x}$, $\texttt{y}$, and $\texttt{color}$ and $\texttt{shape}$, which define the label for the legend.

[Code 5]

So far we have been very explicit in our calls to $\texttt{ggplot()}$. Typically, the first one or two arguments to a functions are so important they are known instinctively. The first two arguments to $\texttt{ggplot()}$ are $\texttt{data}$ and $\texttt{mapping}$; in future we will not supply those names.

---

### Visualizing Distributions

How you visualize the distribution of a variable depends on the type of variable: categorical or numerical.

#### A Categorical Variable

A variable is *categorical* if it can take only one of a small set of values. To examine the distribution of a categorical variable, you can use a bar chart. In bar plots of categorical values with unordered levels, it is often preferable to reorder the bars based on their frequencies. Doing so requires transforming the variable to a factor (how R handles categorical data) and then reordering the levels of that factor.

[Code 6]

#### A Numerical Variable

A variable is *numerical* if it can take a wide range of numerical values and it is sensible to add, subtract, or take averages with those values. Numerical values can be continuous or discrete. One commonly used visualization for distributions of continuous variables is a histogram.

[Code 7]

An alternative visualization for distributions of numerical variables is a density plot. A density plot is a smoothed version of a histogram and a practical alternative for continuous data that comes from an underlying smooth distribution.

[Code 8]

---

### Visualizing Relationships

To visualize a relationship we need to have at least two variables mapped to aesthetics of a plot. We shall go through commonly used plots for visualizing relationships between multiple variables and the geoms used to create them.

#### A Numerical and a Categorical Variable

To visualize the relationship between a numerical and a categorical variable we can use side-by-side box plots. A *boxplot* is a type of visual for measures of percentiles that describe a distribution. Each boxplot consists of:

- A box that indicates the *interquartile range* (IQR), stretching from the 25th percentile of the distribution to the 75th percentile. In the middle of the box is a line that displays the median (50th percentile). These three lines give you a sense of the spread of the distribution and whether the distribution is symmetric about the median.
- Visual points that display observations that fall more than 1.5 times the IQR from either edge of the box.
- A line that extends from each end of the box and goes to the farthest nonoutlier point in your distribution.

We show the distribution of body mass by species using a boxplot $\texttt{geom\_ boxplot()}$, or alternatively, we can make density plots with $\texttt{geom\_ density()}$. For the density plot we have customized the thickness of the lines using the $\texttt{linewidth}$ argument, additionally, we can map $\texttt{species}$ to both $\texttt{color}$ and $\texttt{fill}$ aesthetics and use the $\texttt{alpha}$ aesthetic to add transparency to the filled density curves. 

[Code 9]