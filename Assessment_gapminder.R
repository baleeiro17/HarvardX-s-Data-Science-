library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)

# Now we are going to combine the plotting tools 
# we have used in the past two exercises to create density plots for multiple years.
years <- c( 1970, 2010 )
gapminder %>% mutate( dollars_per_day = gdp/population/365 ) %>% 
  filter( year %in% years & continent == "Africa" & !is.na(gdp) ) %>% 
  ggplot( aes(dollars_per_day) ) +  
  scale_x_continuous( trans = "log2" ) + 
  geom_density() + 
  facet_grid( year~. )

# Now we are going to edit the code from Exercise 9 
# to show a stacked density plot of each region in Africa.
gapminder %>% mutate( dollars_per_day = gdp/population/365 ) %>%
  filter( year %in% c(1970,2010) & continent == "Africa" & !is.na(gdp) ) %>% 
  ggplot( aes( dollars_per_day, fill = region ) ) + 
  scale_x_continuous( trans = "log2") + 
  geom_density(bw = 0.5, position = "stack" )  + 
  facet_grid( year~. )

# We are going to continue looking at patterns in the gapminder dataset by
# plotting infant mortality rates versus dollars per day for African countries.
gapminder_Africa_2010 <- gapminder %>% mutate( dollars_per_day =  gdp /population/365 ) %>%
  filter( year == 2010 & continent == "Africa" & !is.na(gdp) )

# now make the scatter plot
gapminder_Africa_2010 %>% ggplot( aes( dollars_per_day, infant_mortality, color = region ) ) + 
  geom_point()

# with country names instead of points so we can identify which countries are which.
gapminder_Africa_2010 %>% 
  ggplot( aes(dollars_per_day, infant_mortality, color = region, label = country ) ) + 
  scale_x_continuous( trans = "log2" ) + 
  geom_text()



