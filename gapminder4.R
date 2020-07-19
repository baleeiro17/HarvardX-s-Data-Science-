library(dslabs)
library(tidyverse)
data("gapminder")

# In this video, we cover transformations.
# Transformations can be very useful to better understand distributions.
# The GDP per person is often used as a rough summary of how rich a country is.
# Here we divide this quantity by 365 to obtain the more interpretable measure
# dollars per day.
# Using current US dollars as a unit, a person surviving on an income
# of less than $2 a day, for example, is defined to be living in absolute poverty.
gapminder %>% mutate( dolars_per_day = (gdp/population) / 365 ) %>% filter( year == 1970 & !is.na(gdp) ) %>%
  ggplot( aes(dolars_per_day) ) + geom_histogram( binwidth = 1, color = "black", fill = "red" )


# Log transformations change multiplicative changes
# into additive ones.
# Using base 2 for, example, means that every time a value doubles,
# the log transformation increases by one.
# In statistics, these bumps are sometimes referred to as modes.
# The mode of a distribution is the value with the highest frequency.
# The mode of a normal distribution is the average.
# We call the location where it goes up and down again as local modes.
# And we say that the distribution has multiple modes.
# This bimodality is consistent with the dichotomous world
# made up of countries with average incomes less than $8 per day.
# And countries above that we see two modes in the histogram.
gapminder %>% mutate( dolars_per_day = (gdp/population) / 365 ) %>% 
  filter( year == 1970 & !is.na(gdp) ) %>%
  ggplot( aes( log2(dolars_per_day) ) ) + geom_histogram( binwidth = 1, color = "black", fill = "red" )

# In the dollar per day example, we use base 2 instead of base 10
# because the resulting range is easier to interpret.
# The range of the values being plotted started from about 0.3 and ended around 50.
# In base 10, this turns to a range that includes very few integers, just 0 and 1.
# With base 2, our range includes negative 2, negative 1, 0, 1, 2, 3, 4, and 5.
# So we prefer to have more integers in the transform scale.

# if we log the data, we can more easily interpret intermediate values in the scale.
# However, the advantage of using log scales is that we see the original values on the axis.
# repeat histogram with log2 scaled x-axis
gapminder %>% mutate( dolars_per_day = ( gdp / population ) / 365 ) %>% 
  filter( year == 1970 & !is.na(gdp) ) %>%
  ggplot( aes( dolars_per_day ) ) + geom_histogram( binwidth = 1, color = "black", fill = "red" ) +
  scale_x_continuous( trans = "log2" )

