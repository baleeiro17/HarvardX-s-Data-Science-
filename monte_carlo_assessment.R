
# Suppose you're in a classroom with 50 people.
# If we assume this is a randomly selected group,
# what is the chance that at least two people have the same birthday?

# pick up for each person in classrom with 50 people a birthday randomly.
events <- sample( 1:365, 50, replace = TRUE )
any( duplicated(events) )

# Monte Carlo simulation with B = 10000 replicates.
B = 10000 
results <- replicate( B, {
  class_birthday <- sample(1:365, 50, replace = TRUE)
  any( duplicated(class_birthday) ) # if TRUE return TRUE if not return FALSE.
})

# results is a vector with entries equal to true or false.
# calculates proportion of groups with duplicated bday.
mean( results )

# Say you want to use what you've just
# learned about the birthday problem to bet
# with friends about two people having the same birthday in a group of people.
# When are the chances larger than 50%?
# Larger than 75%?
c_prob <- function( n ) {
  B <- 10000
  results <- replicate( B, {
    class_birthday <- sample( 1:365, n, replace = TRUE )
    any( duplicated(class_birthday) ) # if TRUE return TRUE if not return FALSE.
  })
  mean( results )
}

group <- seq( 1, 60 )

# sapply permits us to perform element-wise operations
# on any function.
x <- 1:10
sapply( x, sqrt )

# we can plot this graph.
data <- sapply( group, c_prob )
plot( group, data )

# Now, notice had it not been possible to compute
# the exact probabilities, something that sometimes happens,
# we would have still been able to accurately estimate
# the probabilities using Monte Carlo.


# In more complex calculations, 10,000 may not nearly be enough.
# Also for some calculations, 10,000 experiments
# might not be computationally feasible, and it might be more than we need.
# We know that the larger the number of experiments, we've
# been using the letter B to represent that, the better the approximation.

# But how big do we need it to be?
# One practical approach we will describe here
# is to check for the stability of the estimate.
# So we're going to run a simulation where we compute or estimate
# the probability of two people having a certain birthday using different sizes
# of the Monte Carlo simulations.
# We compute the simulation, and now we look at the values
# that we get for each simulation.
# Remember, each simulation has a different b,
# a different number of experiments.
# When we see this graph, we can see that it's wiggling up and down.
# That's because the estimate is not stable yet.
# It's not such a great estimate.
# But as b gets bigger and bigger, eventually it starts to stabilize.
# And that's when we start getting a feeling for the fact
# that now perhaps we have a large enough number of experiments.

B <- 10^seq(1, 5, len = 100)    # defines vector of many B values
compute_prob <- function(B, n = 22){    # function to run Monte Carlo simulation with each B
  same_day <- replicate(B, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  mean(same_day)
}

prob <- sapply(B, compute_prob)    # apply compute_prob to many values of B
plot(log10(B), prob, type = "l")    # plot a line graph of estimates 
