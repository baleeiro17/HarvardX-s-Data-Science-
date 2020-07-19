library(tidyverse)
library(dslabs)
data(us_contagious_diseases)
str(us_contagious_diseases)

# data to be used for rounding..
# options(digits = 3) will cause all future computations that session to have 3 significant digits.
options( digits = 3 )
data <- 25.534679
data1 <- 1.23599
data
data1

# to have 3 significant digits.
# round( data ) 25
# round( data1 ) 0