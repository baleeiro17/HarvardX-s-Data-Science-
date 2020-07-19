library(ggplot2)
library(dplyr)
library(dslabs)
data("murders")

# Note that in the previous lines of code, we have been mapping population 
# and total to the points twice, once for each geometry.
# If we define a mapping in ggplot, then all the geometries that are added as 
# layers will default to this mapping:
p <- ggplot( data = murders )
p + geom_point( aes( x = population/10^6, y = total), size = 3 ) +
  geom_text( aes( population/10^6, total, label = abb), nudge_x = 1 )

# simplifies code:
p <- murders %>% ggplot( aes(population/10^6, total, label = abb) )
p + geom_point( size = 3 ) + geom_text( nudge_x = 1.5 )

# Also note that the geom point function doesn't need the label
# argument, which was defined globally, so it simply ignores it.
# The local mappings override the global ones.
p + geom_point(color = "yellow", size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Hello there!") )
