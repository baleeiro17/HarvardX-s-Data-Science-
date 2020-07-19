library(ggplot2)
library(dslabs)
data("murders")

# First step to learning ggplot2 is to be able to break a graph into components.
# main three components: 1-data component, 2-geometry component(scatter,bar,histo)
# 3-mapping(x-population size, y-total number of murders, text is used to identify 
# the states and colors are used to denote the four different regions).
# 4- scale(range of the x-axis and y-axis they are both log scales for example)

# creating a new plot:

# 1-define a ggplot object.

# this associates the data set with the plotting object.

# murders %>% ggplot() equivalent to line below.
p <- ggplot( data = murders )
class(p)
# print the plot and we saw that gray slab.
p