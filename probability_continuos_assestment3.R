
# with a mean of 20.9 and standard deviation of 5.7.
# Save these values as act_scores.

# you must subtract the mean and then divide by the standard deviation. 
# Use the mean and standard deviation of act_scores, 
# not the original values used to generate random test scores.

# generate random test scores.
set.seed( 16 )
act_scores <- rnorm( 10000, 20.9, 5.7 )

# mean of act_scores
mean <- mean( act_scores )

# standard deviation of act_scores
sd <- sd( act_scores )

# make z-score.
zScores <- ( act_scores - mean  ) / sd 

# What is the probability of a Z-score greater than 2 (2 standard deviations above the mean)?
# R abs method is one of the R Math functions, 
# which is to return the Positive absolute value of a specific number or an expression
# 2 standard deviations above the mean)
mean( zScores  > 2 ) 

# What ACT score value corresponds to 2 standard deviations above the mean (Z = 2)?
( 2 * sd ) + mean

# A Z-score of 2 corresponds roughly to the 97.5th percentile.

# Use qnorm() to determine the 97.5th percentile of normally 
# distributed data with the mean and standard deviation observed in act_scores.
qnorm( 0.975, mean, sd )

# What is the 97.5th percentile of act_scores?
mean( act_scores <= 31.96338 )

# Write a function that takes a value and produces the probability 
# of an ACT score less than or equal to that value (the CDF). 
# Apply this function to the range 1 to 36.
cdf <- function ( value ) {
  mean( act_scores <= value )
}

# What is the minimum integer score such that the probability of that score or lower is at least .95?
list <- seq( 1,36 )
menor <- 0
for ( item in list ){
  if( cdf(item) >= 0.95 && menor == 0 ){
    menor <- item
  }
}

#cdf <- sapply(1:36, function (x){
#  mean(act_scores <= x)
#})
#min(which(cdf >= .95))


# Use qnorm() to determine the expected 95th percentile, the value for 
# which the probability of receiving that score or lower is 0.95, 
# given a mean score of 20.9 and standard deviation of 5.7.
qnorm( 0.95, 20.9, 5.7 )

# We can use quantile() to determine sample quantiles from the data.
# Make a vector containing the quantiles for p <- seq(0.01, 0.99, 0.01), 
# The 1st through 99th percentiles of the act_scores data. Save these as sample_quantiles.
p <- seq( 0.01, 0.99, 0.01 )
sample_quantiles <- quantile( act_scores, p )
sample_quantiles

# In what percentile is a score of 26?
names(sample_quantiles[max(which(sample_quantiles < 26))])

# or
cdf( 26 )

# Make a corresponding set of theoretical quantiles using qnorm() over the interval 
# p <- seq(0.01, 0.99, 0.01) with mean 20.9 and standard deviation 5.7. 
# Save these as theoretical_quantiles. Make a QQ-plot graphing sample_quantiles 
# on the y-axis versus theoretical_quantiles on the x-axis.

theoretical_quantiles <- qnorm( p, 20.9, 5.7 )


qqplot( theoretical_quantiles, sample_quantiles )


