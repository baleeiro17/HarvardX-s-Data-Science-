library(dslabs)
library(dplyr)
data("murders")

# show relantioship between murders and population.
# states with larger populations are likely to have more murders.
total_population_millions <- murders$population/10^6
total_murders <- murders$total
# scatterplot.
# plot(total_population_millions, total_murders)

# but if you check many states have populations below 5 million 
# and are bunched up in the plot. We may gain further insights 
# from making this plot in the log scale.
log10_population <- log( total_population_millions, base = 10 )
log10_total_gun_murders <- log( total_murders, base = 10)
plot(log10_total_gun_murders, log10_population)


# added information into dataframe.
murders <- murders %>% mutate(rate = (murders$total/murders$population)*100000 )

# create histogram of our murder rates by simply typing:
# of a list of numbers that gives you a general overview of the types of values
# you have.
hist(murders$rate)

# one very extreme case with a murder rate of more than 15(frequency in histogram).
# district of columbia.
murders$state[ which( murders$rate > 15 ) ]
murders$state[ which.max( murders$rate ) ]

# box plot we can see many distributions in one plot, we say that box plots provide a more terse summary
# than the histogram, but they're easier to stack against each other.

# we use them to compare the murder rates for different regions.
# we infer that the South has the highest murder rate of all regions.
boxplot(rate~region, data = murders)