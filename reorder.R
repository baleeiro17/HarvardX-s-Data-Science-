library(dplyr)
library(ggplot2)
library(dslabs)

# Now we are going to customize this plot.
# a little more by creating a rate variable and reordering by that variable instead.
# reorder the states by the rate variable.

data( us_contagious_diseases )
dat <- us_contagious_diseases %>% filter( year == 1967 & disease=="Measles" & count>0 & !is.na(population) ) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>% mutate( state = reorder(state, rate) )
dat %>% ggplot( aes(state, rate) ) +
  geom_bar( stat="identity" ) +
  coord_flip()

# make a histogram by region using region as a factor.
# using this chart is not the best choice.

data("murders")
murders %>% mutate(rate = total/population*100000) %>%
  group_by(region) %>%
  summarize( avg = mean(rate) ) %>%
  mutate( region = factor(region) ) %>%
  ggplot( aes(region, avg) ) +
  geom_bar( stat="identity") +
  ylab("Murder Rate Average")

# To further investigate whether moving to the western region is a wise decision, 
# let's make a box plot of murder rates by region, showing all points.
murders %>% mutate(rate = total/population*100000) %>% 
  mutate( region = reorder( region,rate, FUN = median ) ) %>%
  ggplot( aes(region,rate) ) + geom_boxplot() + geom_point()

# the safest state is not in the west as we see and the histogram is not the best graph to 
# justify(consolidate) our descision.

