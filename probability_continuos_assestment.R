# Assume the distribution of female heights is approximated by a normal distribution with a mean of 
# 64 inches and a standard deviation of 3 inches.
# if we pick a female at random, what is the probability that she is 5 feet or shorter?

# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that 
# a randomly selected female is shorter than 5 feet. Print this value to the console.
# one pick using pnorm.
pnorm( 5*12, female_avg, female_sd )

# Assume the distribution of female heights is approximated by a normal distribution 
# with a mean of 64 inches and a standard deviation of 3 inches. 
# If we pick a female at random, what is the probability that she is 6 feet or taller?
1 - pnorm( 6*12, female_avg, female_sd )

# If we pick a female at random, what is the probability that she is between 61 and 67 inches?
pnorm( 67, female_avg, female_sd ) -  pnorm( 61, female_avg, female_sd )

# Repeat the previous exercise, but convert everything to centimeters.
# That is, multiply every height, including the standard deviation, by 2.54. 
# What is the answer now?
# female_avg <- 64*2.54
# female_sd <- 3*2.54
# pnorm( 67*2.54, female_avg, female_sd ) -  pnorm( 61*2.54, female_avg, female_sd )

# This makes sense because the answer to the question should not be affected by which units we use.
# In fact, if you look closely, you notice that 61 and 67 are both 1 SD away from the average.

# Compute the probability that the height of a randomly chosen female is 
# within 1 SD from the average height.

# To a variable named 'taller', assign the value of a height that is one SD taller than average.
taller <- female_avg + female_sd

# To a variable named 'shorter', assign the value of a height that is one SD shorter than average.
shorter <- female_avg - female_sd

# Calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.
pnorm( taller, female_avg, female_sd ) - pnorm( shorter, female_avg, female_sd )

# Imagine the distribution of male adults is approximately normal 
# with an average of 69 inches and a standard deviation of 3 inches.
# How tall is a male in the 99th percentile?

# Assign a variable 'male_avg' as the average male height.
male_avg <- 69

# Assign a variable 'male_sd' as the standard deviation for male heights.
male_sd <- 3

# Determine the height of a man in the 99th percentile of the distribution.
qnorm( 0.99, male_avg, male_sd )

# The distribution of IQ scores is approximately normally distributed. 
# The average is 100 and the standard deviation is 15. 
# Suppose you want to know the distribution of the person with the highest IQ 
# in your school district, where 10,000 people are born each year.
# Generate 10,000 IQ scores 1,000 times using a Monte Carlo simulation. 
# Make a histogram of the highest IQ scores.
set.seed(1)
B <- 1000
avg <- 100
sd <- 15

# Create an object called `highestIQ` that contains the 
# highest IQ score from each random distribution of 10,000 people.
highestIQ <- replicate( B,{
  dist <- rnorm( 10000, avg, sd )
  max( dist )
})

# Make a histogram of the highest IQ scores.
hist( highestIQ )

# see the same distribution now with all values.
alliq <- replicate( B,{
  dist <- rnorm( 10000, avg, sd )
  dist
})

# Make a histogram of the highest IQ scores.
hist( alliq )



