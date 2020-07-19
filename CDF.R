# in this archive we implemented Cumulative Distribution Function(CDF).
library(dslabs)
library(dplyr)
data("heights")

# create list with numbers of heights.
heights <- filter( heights, sex == "Male")
my_data <- heights$height

# This function can then be applied to 
# a range of values across the range of the dataset to calculate a CDF.

# define range of values spanning the dataset.
a <- seq(min(my_data), max(my_data), length = 100)

# computes prob. for a single value
cdf_function <- function(x) {    
  mean(my_data <= x)
}

#sapply(X, FUN)
# Arguments:
#  -X: A vector or an object
#  -FUN: Function applied to each element of x
cdf_values <- sapply(a, cdf_function)
( cdf_function(65) - cdf_function(60) ) * 100
# plot(a, cdf_values)
