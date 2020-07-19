

# Monte Carlo simulations model the probability of different outcomes
# by repeating a random process a large enough number of 
# times that the results are similar to what would be observed 
# if the process were repeated forever.

# create a urn with beads( 3 blue beads and 2 red beads ).
urn <- rep( c("blue","red"), times = c(3,2) )

# showing the elements of the urn.
urn 

# showing sample 1 bead at random, picking one bead at random.
sample(urn,1) # It changes in the time red or blue because it is random.

# repeat this experiment over and over to make the results pratically equivalent to doing it 
# over and over forever.
# monte carlo simulation.

B <- 10000 # number of times to draw 1 bead.
events <- replicate( B, sample(urn, 1) )
events # vector with 10000 entries.
tab <- table(events)
prop.table( tab ) # view table of outcome(results) proportions or probability.

# we can using sample function to perform this experiment too.
prop.table( table( sample( urn, B, replace = TRUE ) ) )

# calculate probability with mean function.
# In R, applying the mean() function to a logical vector returns the proportion of elements that are TRUE.
# It is very common to use the mean() function in this way 
# to calculate probabilities and we will do so throughout the course.
beads <- rep( c("red", "blue"), times = c(2,3) )
mean(beads == "blue")

