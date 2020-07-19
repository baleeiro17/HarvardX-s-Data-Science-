library(dslabs)
library(tidyverse)
data("gapminder")

# Now, because the number of regions is large in this case, 
# Looking at histograms or smooth densities for each will not be useful.
length( levels(gapminder$region) )

# And now what this does, is it helps us see
# the differences between the countries with the lower income.
# we first stratify the data into regions, and then examine the distribution for each.
# Instead, we can stack box plots next to each other.
gapminder %>% mutate( dolars_per_day = gdp/population/365 ) %>% filter( year == 1970 & !is.na( gdp ) ) %>%
  ggplot( aes(region, dolars_per_day) ) +
  geom_boxplot() + geom_boxplot() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# or can use aes(dolars_per_day,region)(x,y)
gapminder %>% mutate( dolars_per_day = gdp/population/365 ) %>% filter( year == 1970 & !is.na( gdp ) ) %>%
  ggplot( aes( dolars_per_day, region) ) +
  geom_boxplot() 

# is to simply reorder the regions by their median income level.
# To achieve this, we write the same code as before but we add to mutate that changes region 
# to a new factor
gapminder %>% mutate( dolars_per_day = gdp/population/365 ) %>% 
  filter( year == 1970 & !is.na( gdp ) ) %>%
  mutate( region = reorder( region, dolars_per_day, FUN = median ) )  %>%
  ggplot( aes( region, dolars_per_day, fill = continent) ) + geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  xlab("")

# We want to change it to log2 scale in this case,
# so we add the layer scale underscore y underscore continuous.
# And now what this does, is it helps us see
# the differences between the countries with the lower income.
gapminder %>% mutate( dolars_per_day = gdp/population/365 ) %>% 
  filter( year == 1970 & !is.na( gdp ) ) %>%
  mutate( region = reorder( region, dolars_per_day, FUN = median ) )  %>%
  ggplot( aes( region, dolars_per_day, fill = continent) ) + geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1) ) +  xlab("") + 
  scale_y_continuous( trans = "log2" )

# And we can see the individual points.
# You can decide if you show this or not.
# But now we can see exactly where every single country lies.
gapminder %>% mutate( dolars_per_day = gdp/population/365 ) %>% 
  filter( year == 1970 & !is.na( gdp ) ) %>%
  mutate( region = reorder( region, dolars_per_day, FUN = median ) )  %>%
  ggplot( aes( region, dolars_per_day, fill = continent) ) + geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1) ) +  xlab("") + 
  scale_y_continuous( trans = "log2" ) + geom_point( show.legend = FALSE )
  
  
  