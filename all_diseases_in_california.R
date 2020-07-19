library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

# The US rate for each disease will be the total number of cases divided by the total population.
# Remember to convert to cases per 10,000.
# Now we are going to look at the rates of all diseases in one state. 
# Again, you will be modifying the sample code to produce the desired plot.
us_contagious_diseases %>% filter( state=="California" & weeks_reporting >=10 ) %>% 
  group_by(year, disease) %>%
  # for each year and disease we make a rate.
  summarize( rate = sum(count)/sum(population)*10000 ) %>%
  ggplot( aes(year, rate, color = disease) ) + 
  geom_line()

# Now we are going to make a time series plot for the rates of all diseases in the United States.
us_contagious_diseases %>% filter( !is.na(population) ) %>% group_by(year, disease) %>% summarize( rate = sum(count)/sum(population)*10000 ) %>%
  ggplot( aes(year, rate, color = disease) ) + 
  geom_line()
  