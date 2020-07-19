library(dslabs)
data(heights)

# find quartiles, show how data is quartiles.
summary( heights$height )

# find intervals that divide a dataset into 100 intervals each with 1% probability
# know with percentiles.
p <- seq(0.01, 0.99, 0.01)
percentiles <- quantile( heights$height, p )

# show portion of the data is 1stquartile and 3rd quartile.
percentiles[ "25%"]
percentiles[ "75%"]

# or you should 
percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]

# The qnorm() function gives the theoretical value of a quantile 
# with probability p of observing a value equal to or less than 
# that quantile value given a normal distribution with mean mu and 
# standard deviation sigma:
# Suppose male heights follow a normal distribution with 
# a mean of 69 inches and standard deviation of 3 inches. 
# The theoretical quantiles are:
p <- seq(0.01, 0.99, 0.01)
theoretical_quantiles <- qnorm(p, 69, 3)