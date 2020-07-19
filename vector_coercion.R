# In this case, R coerced variables or the data  into a character string.
vector<- c(1,"canada",3)
class(vector)

# Function to force the data into characters.
x<- 1:5
as.character(x)

# Turn them back into numeric variables.
as.numeric(x)

# Special value for missing data, it is the NA.
# We can get the NAs from coercion.
# It tries to coerce but it can't, we will get NA.
vector1<- c("1","b","2")
as.numeric(vector1) # it is not possible changing b into numeric.

# new class in R( For most practical purposes
# integers and numerics are indistinguishable )
class( seq(1,10) )
