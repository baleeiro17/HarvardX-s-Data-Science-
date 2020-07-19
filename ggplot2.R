library(ggplot2)
library(dplyr)
library(dslabs)
data("murders")

# In ggplot we create graphs by adding layers.
# We add them componet by component.
# Layers can define geometries, compute summary statistics,
# define what scales to use, and even change styles.

# Aes will be one of the functions that you will most use, 
# he function connects data with what we see on the graph(aesthetic mappings).
# the outcome of this function is often used as the argument of a geometry function.
murders %>% ggplot() + 
  geom_point( aes( x = population/10^6, y = total) )

# or we can using .... 
p <- ggplot( data = murders )
p + geom_point( aes( x = population/10^6, y = total) )

# Second layer in the plot, we wish to make involves adding a label to each point.
# This will help us identify which point goes with which state.
# The geom label and geom text functions permit us to add text to the plot.
# Geom label adds a label with a little rectangle, and geom text simply 
# adds the text.
# Because each state, each point, has a label,
# we need an aesthetic mapping to make this connection.
p <- ggplot( data = murders )
p + geom_point( aes( x = population/10^6, y = total) ) +
  geom_text( aes( population/10^6, total, label = abb) )

# aes() is a quoting function.
# This makes it easy to work with variables from the data frame 
# because you can name those directly.


