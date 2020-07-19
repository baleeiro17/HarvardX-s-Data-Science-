library(dplyr)
library(dslabs)
data("murders")

# adding a new column to the table.
# dplyr knows total and population are variables from dataframe.
murders <- mutate(murders,rate=total/population*100000)
head(murders)

# to filter the data by subsetting rows, we use filter.
filter(murders, rate <= 0.71)

# So it's often useful to select just the columns that you want to work with.
# select which is for columns, filter is for rows.
new_table <- select(murders, state, region, rate)
filter( new_table, rate<=0.71 )

# using the pipe to learn to put them(functions select, filter and mutate) all together.
# data -> operations 1 -> operations 2 -> finish.
murders %>% select( state, region, rate) %>% filter(rate <= 0.71)

# creating a data frame with stringAsFactors = FALSE because we did not want to transform string into factor as default.
grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90),
                     stringsAsFactors = FALSE)

# We can remove rows using the != operator. For example to remove Florida we would do this:
no_florida <- filter(murders, state != "Florida")

# can see the data from New York and Texas like this:
filter(murders, state %in% c("New York", "Texas"))

# Create a table, call it my_states, that satisfies both the conditions
# that satisfies both the conditions: it is in the Northeast or West and the murder rate is less than 1.
my_states <- filter( murders, region %in% c("Northeast","West") & rate < 1 )

# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank )

