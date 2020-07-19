library(tidyverse)
library(dslabs)

# But for ordering entire tables, the function arrange, in dplyr,
# is very useful.

# For example, here, we order the states by their population size( ascendent )
murders %>% arrange( population ) %>% head()

# For example, here, we order the states by their population size( descendent )
# range by murder rate in descending order
murders %>% mutate( rate = total / population * 100000) %>% arrange( desc(rate) ) %>%
  head()

# because we're ordering by region.
murders %>% mutate( rate = total / population * 100000) %>% arrange( region, rate ) 
  
# we can use the top_n function.
# Here, using this code, we will show the 10 states with the highest murder
# rates.
murders %>% mutate( rate = total / population * 100000) %>% top_n(10, rate ) 

# using top_n 10 with ordenered by ascending.
# show the top 10 states with highest murder rate, ordered by rate.
murders %>% mutate( rate = total / population * 100000 ) %>% arrange( desc(rate) ) %>%
  top_n( 10 ) 

# To ignore the NAs, we can use the na.rm argument:
# mean(na_example, na.rm = TRUE).
# sd(na_example, na.rm = TRUE).


