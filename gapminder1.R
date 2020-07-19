library(dslabs)
library(tidyverse)
data("gapminder")

# We will use real data to answer the following 
# questions about world health and economics.

# First question: Is it still fair to consider the world as divided
# into the West and the developing world ?

# Second question: Has income inequality across countries 
# worsened over the last 40 years ?

# we start by testing our knowledge regarding differences in child
# mortality across different countries.
gapminder %>%  
  filter( year == "2015" & country %in% c("Sri Lanka","Poland","South Africa","Russia","Thailand","Pakistan","South Korea") ) %>% 
    select( country, infant_mortality ) 

