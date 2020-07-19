library(dslabs)
library(tidyverse)
data("gapminder")

# We have used data exploration to discover that the income gap between rich and poor countries.
# We use a series of histograms and box plots to see this.
# Here, we suggest a succinct way to convey this message with just one plot.
# We will use smooth density plots.
west <- c("Western Europe", "Northern Europe", "Southern Europe",
          "Northern America", "Australia and New Zealand")

gapminder <- gapminder %>% mutate( dolars_per_day =  gdp / population  / 365 )
country_1970 <- gapminder %>% filter( year == 1970 & !is.na( dolars_per_day ) ) %>% .$country
country_2010 <- gapminder %>% filter( year == 2010 & !is.na( dolars_per_day ) ) %>% .$country
countries <- intersect( country_1970, country_2010 )
years <- c(1970, 2010)

# show how many developing countries and west country had in region.
# variable density on y-axis.
gapminder %>% filter( year %in% years & country %in% countries ) %>%
  ggplot( aes(dolars_per_day ) ) + geom_density( fill = "grey") + scale_x_continuous( trans = "log2") + 
  facet_grid( year~. )

# variable count on y-axis.
# A third mode appears consisting of the countries that most closed the gap.
gapminder %>% filter( year %in% years & country %in% countries ) %>%
  mutate( group = ifelse( region %in% west ,"West", "Developing") ) %>% 
  ggplot( aes(dolars_per_day, y = ..count.., fill = group ) ) + 
  scale_x_continuous( trans = "log2" ) + 
  # bw there was a lot of unsmoothness, we can change the bw argument.
  geom_density( alpha = 0.2, bw = 0.75 ) + 
  facet_grid( year~. )


# what many of the countries that most improved were from Asia.
# We can easily alter the plot to show key regions separately.
# To do this, we introduced a new function called case_when.
# Add group as a factor, grouping regions.
p1 <- gapminder %>%
  mutate( group = case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others") ) %>%
  mutate( group = factor( group, levels = c("Others", "Latin America", "East Asia", 
                                            "Sub-Saharan Africa", "West") ) ) 

p2<- p1 %>% 
  filter( year %in% years & country %in% countries ) %>%
  ggplot( aes(dolars_per_day, y = ..count.., fill = group ) ) +
  scale_x_continuous(trans = "log2") + 
  geom_density(alpha = 0.2, bw = 0.75, position = "stack") +
  facet_grid(year ~ .)
p2

# As a final point, we note that these distributions
# weigh every country the same
p3 <- p1 %>% filter( year %in% years & country %in% countries ) %>%
  group_by( year ) %>% 
  mutate( weight = population / sum(population*2) ) %>%
  ungroup() %>%
  ggplot( aes(dolars_per_day, fill = group, weight = weight ) ) +
  scale_x_continuous( trans = "log2" ) + 
  geom_density( alpha = 0.2, bw = 0.75, position = "stack" ) +
  facet_grid( year ~ .)
p3
