library(ggplot2)
library(dplyr)
library(dslabs)
library(gridExtra)

# we can create histogram plot like this:
p <- heights %>% filter( sex == "Male" ) %>% ggplot( aes( height ) )
p <- p + geom_histogram( binwidth = 1,fill = "red", color = "black") +
     xlab("heights in inches") + ggtitle("Histogram")
p

# we can create smooth densities plot like this:
s <- heights %>% filter( sex == "Male" ) %>% ggplot( aes( height ) )
s <- s + geom_density( fill = "blue" ) + xlab("heights in inches")
s

# By default, the Q-Q plot is compared to the normal distribution with average
# zero and standard deviation one.
r <- heights %>% filter( sex == "Male" ) %>% ggplot( aes( sample = height ) )
r <- r + geom_qq()

# To change this, again, from the help file we learn that 
# we need to use the dparams argument.
param <- heights %>% filter( sex == "Male" ) %>% 
  summarize( mean = mean(height), sd = sd(height) )


# And now we see that the Q-Q plot is plotted against a normal distribution
# with the same mean and standard deviation as our data.
x <- heights %>% filter( sex == "Male" ) %>% 
  ggplot( aes( sample = height ) )
x <- x + geom_qq( dparams = param ) + geom_abline()
x

# another option is to first scale the data so that we have them in 
# standard units.
z <- heights %>% filter( sex == "Male" ) %>% 
  ggplot( aes( sample = scale(height) ) )
z <- z + geom_qq() + geom_abline()
z

# We can then add identity lines to see how well the normal approximation works:
# Finally, let's learn how to make grids of plots, you've seen how we 
# put plots next to each other.
# called grid.arrange that lets us show different plot objects next to each other.

p1 <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
p2 <- p1 + geom_histogram(binwidth = 1, fill = "blue", col = "black")
p3 <- p1 + geom_histogram(binwidth = 2, fill = "blue", col = "black")
p4 <- p1 + geom_histogram(binwidth = 3, fill = "blue", col = "black")
grid.arrange(p2, p3, p4, ncol = 3)




