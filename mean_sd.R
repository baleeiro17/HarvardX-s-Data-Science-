library(tidyverse)
library(dslabs)
data(heights)

# summarize vector with male heights.
index <- which( heights$sex == "Male" )
vect <- heights$height[ index ]

# calcule mean.
mean(vect)

# calcule standard deviation.
sd(vect)

# calcule standard units.
x <- scale(vect)

# how many men are within two standard deviations from the average ?
mean( abs( x ) < 2 )
# answer 95% of the data are within two standard deviations from the average.

# Z-scores(standard units) are useful to quickly evaluate whether 
# an observation is average or extreme:
x[15]

