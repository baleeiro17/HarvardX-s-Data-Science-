library(dslabs)
data("murders")
data(na_example)

# create dataframe using this example:
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# create columns from dataset:
city_temps <- data.frame(name = city, temperature = temp)
city_temps

# more example how to create one datase:

# Define a variable states to be the state names from the murders data frame
states <- murders$state

# Define a variable ranks to determine the population size ranks
ranks <- rank(murders$population)

# Define a variable ind to store the indexes needed to order the population values
ind <- order(murders$population)

# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <- data.frame( name = states[ind] , rank = ranks[ind] )

my_df

# Note what we can do with the ! operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]

# show data from dataset
str(na_example)

# Use is.na to create a logical index ind that tells which entries are NA
ind<- is.na(na_example)

# Determine how many NA ind has using the sum function
sum(ind)

# using ! to solve problem with NA
# Compute the average, for entries of na_example that are not NA
mean( na_example[!ind] )






