library(dslabs)
library(tidyverse)
data("gapminder")

west <- c("Western Europe", "Northern Europe", "Southern Europe",
          "Northern America", "Australia and New Zealand")
# We do this by creating a histogram for the groups previously defined.
# And we immediately see that the countries in the West have higher incomes.
# Countries in the developing world are shifted towards the left.
gapminder %>% mutate( dolars_per_day = ( gdp / population ) / 365 ) %>% 
  filter( year == 1970 & !is.na(gdp) ) %>% 
  mutate( group = ifelse( region %in% west,"West","Developing" ) ) %>% 
  ggplot( aes( dolars_per_day ) ) + geom_histogram( binwidth = 1, color = "black", fill = "red" ) + 
  scale_x_continuous( trans = "log2" ) + facet_grid( .~group )

# Now we're ready to see if the separation is worse today than it was 40 years ago.
# So it's the same code, but now we're looking at two years, 1970 and 2010.
# And we end the code with a facet grid by year and group.
# We can see that the developing world has shifted to the right more than the West.
# Meaning that it has gotten closer. The income distribution of the developing countries
# has gotten closer to those from the west.
years <- c("1970", "2010")
gapminder %>% mutate( dolars_per_day = ( gdp / population ) / 365 ) %>% 
  filter( year %in% years & !is.na(gdp) ) %>% 
  mutate( group = ifelse( region %in% west,"West","Developing" ) ) %>% 
  ggplot( aes( dolars_per_day ) ) + geom_histogram( binwidth = 1, color = "black", fill = "red" ) + 
  scale_x_continuous( trans = "log2" ) + facet_grid( year~group )

# Before we interpret the findings of this plot further.
# We note that there are more countries represented in the 2010 histograms than in the 1970s ones.
# make histogram including only countries with data available in both years
# The histogram has shifted more to the right than for the rich countries.
gapminder <- gapminder %>% mutate( dolars_per_day = ( gdp / population ) / 365 )
country_1970 <- gapminder %>% filter( year == 1970 & !is.na( dolars_per_day ) ) %>% .$country
country_2010 <- gapminder %>% filter( year == 2010 & !is.na( dolars_per_day ) ) %>% .$country
countries <- intersect( country_1970, country_2010 )
gapminder %>% 
  filter( year %in% years & !is.na(gdp) & country %in% countries ) %>% 
  mutate( group = ifelse( region %in% west,"West","Developing" ) ) %>% 
  ggplot( aes( dolars_per_day ) ) + geom_histogram( binwidth = 1, color = "black", fill = "red" ) + 
  scale_x_continuous( trans = "log2" ) + facet_grid( year~group )

# To see which specific regions improve the most,
# we can remake the box plots that we made earlier, but now adding 2010.
gapminder %>% filter( year %in% years & country %in% countries ) %>% 
  mutate( region = reorder( region, dolars_per_day, FUN = median ) )  %>%
  ggplot() + theme( axis.text.x = element_text(angle = 90, hjust = 1) ) + xlab("") + 
  scale_y_continuous( trans = "log2" ) + geom_boxplot( aes( region, dolars_per_day, fill = continent) ) +
  facet_grid( year ~. )

# Now these box plots, it's a little bit hard to compare,
# because we're trying to compare box plots that are on top of each other.
# But ask ggplot plot to color or fill the box block depending on the year.
# ggplot automatically separates them and puts the two box plots
# next to each other.
gapminder %>% filter( year %in% years & country %in% countries ) %>% 
  mutate( region = reorder( region, dolars_per_day, FUN = median ) )  %>%
  ggplot() + theme( axis.text.x = element_text(angle = 90, hjust = 1) ) + xlab("") + 
  scale_y_continuous( trans = "log2" ) + 
  geom_boxplot( aes( region, dolars_per_day, fill = factor(year) ) )


