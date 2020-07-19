library(tidyverse)
library(dslabs)
data(murders)

# calculate rate muder of United States.
p <- murders %>% mutate( rate = total / population * 100000 )
p
p <- p %>% summarize( rate = sum(total) / sum(population) )

# but p is not a numeric value but is a dataframe.
class(p)

# how change this for number.
# To understand this line, you just need to think of the dot
# as a placeholder for the data that is being passed through the pipe.
# then we type dot dollar sign rate and this
# returns the numeric, not the data table. 
r <- murders %>% summarize( rate = sum(total) / sum(population) ) %>% .$rate
r
