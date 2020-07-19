library(dslabs)
library(tidyverse)
data("gapminder")

# But once we see these plots, new questions emerge.
# For example, which countries are improving more?
# Which ones are improving less?
# Was the improvement constant during the last 50 years.
# or was there more of an acceleration during a specific certain period?
# For a closer look that may help answer these questions,
# we introduce time series plots.
# Time series plots have time in the x-axis, and an outcome, or measurement
# of interest, on the y-axis.

# For example, here's a trend plot for the United States fertility rate.
# See that the trend is not linear at all.
gapminder %>% filter( country == "United States" ) %>% 
  ggplot( aes(year, fertility) ) + geom_point()

# When the points are regularly spaced and densely packed as they are here,
# we can create curves by joining points with lines.
gapminder %>% filter( country == "United States" ) %>% 
  ggplot( aes(year, fertility) ) + geom_line()

# This is particularly helpful when we look at two or more countries.
gapminder %>% filter( country %in% c("South Korea", "Germany") ) %>%
  ggplot( aes(year, fertility, group = country) ) + geom_line()

gapminder %>% filter( country %in% c("South Korea", "Germany") ) %>% 
  ggplot( aes(year, life_expectancy, color = country) ) + geom_line()


# For time series plots, we actually recommend labeling the curves.
countries <- c("South Korea", "Germany")
labels <- data.frame( country = countries, x = c(1975, 1965), y = c(60,72) )
gapminder %>% filter( country %in% countries ) %>% 
  ggplot( aes( year, life_expectancy, color = country ) ) + geom_line() +
  geom_text( data = labels, aes( x, y, label = country ), size = 5 ) + 
  theme( legend.position = "none" )


