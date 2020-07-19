library(dslabs)
library(tidyverse)
data("gapminder")


# of Western Europe and North America, which
# is characterized by long lifespans and small families versus the developing
# world, Africa, Asia, and Latin America, characterized
# by short lifespans and large families.
# is it true?
gapminder %>% filter( year == "1962" ) %>% ggplot( aes( fertility, life_expectancy, color = continent ) ) +
  geom_point()
  
# Note that most points do, in fact, fall into two distinct categories, one
# with life expectancies around 70 years and three or less children per family
# and the other with life expectancies lower than 65 years
# and with more than five children per family.
# The West versus developing worldview was grounded in some reality, 
# but is this still the case 50 years later?

# But for comparison, side by side plots are preferable.
# In ggplot, we can achieve this by faceting variables.
# We stratify the data by some variable and make the same plot for each strata.
# Here we are faceting by the year.
# year ->rows and continent ->columns.
gapminder %>% filter( year %in% c("1962","2012") ) %>% ggplot( aes( fertility, life_expectancy, color = continent ) ) +
  geom_point() + facet_grid( year ~ continent )

# which is simply to compare in 1962 and 2012.
# In this case, there's just one variable(columns)
gapminder %>% filter( year %in% c("1962", "2012") ) %>% ggplot( aes( fertility, life_expectancy, color = continent ) ) +
  geom_point() + facet_grid( .~year )

# see the changes when we compare Europe to Asia.
# To explore how this transformation happened through the years,
# we can make the plot for several years.
# For example, we can add 1970, 1980, 1990, and 2000 to the plot.
gapminder %>% filter( year %in% c("1962", "1970", "1980", "1990", "2000", "2012") & continent %in% c("Europe","Asia") ) %>% 
    ggplot( aes( fertility, life_expectancy, color = continent ) ) +
        geom_point() + facet_grid( .~year )

# Instead, we might want to have the plots across different rows and columns.
gapminder %>% filter( year %in% c("1962", "1970", "1980", "1990", "2000", "2012") & continent %in% c("Europe","Asia") ) %>% 
  ggplot( aes( fertility, life_expectancy, color = continent ) ) +
  geom_point() + facet_grid() + facet_wrap( .~year )

# When not using facet, this range is determined
# by the data shown in the plot.
# When using facet, the range is determined
# by the data shown in all plots. And therefore, it's kept fixed across the plots.
# This makes comparisons across plots much easier.
# Therefore, by keeping the scales the same,
# we were able to quickly see how many of the countries
# outside of the Western world have improved
# during the last 40 to 50 years.


