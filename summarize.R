library(tidyverse)
library(dslabs)
data(heights)

# then we produce a new summarize table.
# with just the average and the standard deviation of heights.
# With the function summarize, we can only call
# functions that return a single value.

s <- heights %>% filter( sex == "Male") %>% summarize( mean = mean(height), 
                                                         standard_deviation = sd(height),
                                                         median = median(height) )
s
# we get the standard deviation we just.
# we get the average we just computed.
s$mean
s$standard_deviation
s$median