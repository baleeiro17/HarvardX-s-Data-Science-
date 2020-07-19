# define x as male heights from dslabs data
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# generate simulated height data using normal distribution - both datasets should have n observations
# Specifically, the rnorm function takes three arguments-- size; average,
# which defaults to 0; standard deviation, which defaults to 1--
# n number of datasets to be simulated.
n <- length(x)
avg <- mean(x)
s <- sd(x)
simulated_heights <- rnorm(n, avg, s)

# plot distribution of simulated_heights.
# the distribution of these outcomes looks normal because they were generated to look normal.
data.frame(simulated_heights = simulated_heights) %>%
  ggplot( aes(simulated_heights) ) +
  geom_histogram( color="black", binwidth = 2 )

# Monte Carlo simulation of tallest person over 7 feet
# We're going to run 10,000 simulations, and for each one,
# we're going to generate 800 normally distributed values,
B <- 10000
tallest <- replicate(B, {
  simulated_data <- rnorm( 800, avg, s )    # generate 800 normally distributed random heights
  max( simulated_data )    # determine the tallest height
})
# Having a seven footer is quite rare:
mean( tallest >= 7*12 )    # proportion of times that tallest person exceeded 7 feet (84 inches)
# Note that it does not look normal.
data.frame( prop = tallest ) %>% ggplot( aes( prop ) ) + geom_histogram(color="black", binwidth = 2)

