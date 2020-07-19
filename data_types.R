
# Data types:

# Use function class to show type of variable.
x<-9
class(x)

y<-"string"
class(y)

# Data-frames very important in data science.
library(dslabs)
data(murders)
class(murders)

# Use str to show structure for data-frame(rows,columns etc)
str(murders)

# Show the first six lines of this data-frame using the function head.
head(murders)

# and how to acess one variable specific using the function $ + variable
# the order of the entries in the list preserves the order of the rows in
# our data table.
murders$population

# Show names of the columns from data-frame using the function names.
names(murders)

# Use vectors in R.
pop<- murders$population
length(pop)

# Characters vectors
lista<- murders$state
class(lista)

# Logical vectors.
ex<- 3 == 2
class(ex)

# factors are useful for storing categorical data.
class(murders$region)

# show levels from categorical data(not character is integer-numeric)
levels(murders$region)

# The function table takes a vector as input and returns 
# the frequency of each unique element in the vector.

