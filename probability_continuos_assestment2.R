

# Set the seed to 16, then use rnorm() to generate a normal distribution of 10000 tests with a mean of 20.9 
# and standard deviation of 5.7. Save these values as act_scores. 
# You'll be using this dataset throughout these four multi-part questions.
set.seed( 16 )
act_scores <- rnorm( 10000, 20.9, 5.7 )

# What is the mean of act_scores?
mean( act_scores )

# What is the standard deviation of act_scores?
sd( act_scores )

# A perfect score is 36 or greater ( the maximum reported score is 36 ).
# In act_scores, how many perfect scores are there out of 10,000 simulated tests?
mean( act_scores >= 36 ) * 10000

# In act_scores, what is the probability of an ACT score greater than 30?
mean( act_scores >= 30)

# In act_scores, what is the probability of an ACT score less than or equal to 10?
mean( act_scores <= 10 )

# Set x equal to the sequence of integers 1 to 36. 
# Use dnorm to determine the value of the probability density 
# function over x given a mean of 20.9 and standard deviation of 5.7; 
# save the result as f_x. Plot x against f_x.
x <- seq( 1, 36 )
f_x <- dnorm( x, 20.9, 5.7 )
plot( x = x, y = f_x ) 

