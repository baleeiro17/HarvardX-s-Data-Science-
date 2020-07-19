library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

F <- function(a){
  mean(x <= a)
}  
1 - F(70)    # probability of male taller than 70 inches

# plot distribution of exact heights in data
plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(x = a)")

# probabilities in actual data over length 1 ranges containing an integer
mean(x <= 68.5) - mean(x <= 67.5)
mean(x <= 69.5) - mean(x <= 68.5)
mean(x <= 70.5) - mean(x <= 69.5)

# probabilities in normal approximation match well
pnorm(68.5, mean(x), sd(x)) - pnorm(67.5, mean(x), sd(x))
pnorm(69.5, mean(x), sd(x)) - pnorm(68.5, mean(x), sd(x))
pnorm(70.5, mean(x), sd(x)) - pnorm(69.5, mean(x), sd(x))

# probabilities in actual data over other ranges don't match normal approx as well
mean(x <= 70.9) - mean(x <= 70.1)
pnorm(70.9, mean(x), sd(x)) - pnorm(70.1, mean(x), sd(x))

# Plotting the probability density for the normal distribution.
# dnorm(z) gives the probability density  f(z)  of a certain z-score
# Note that dnorm() gives densities for the standard normal distribution by default. 
# Probabilities for alternative normal distributions with mean mu 
# and standard deviation sigma can be evaluated with:
x <- seq(-4, 4, length = 100)
data.frame( x, f = dnorm(x) ) %>%
  ggplot( aes(x, f) ) +
  geom_line()