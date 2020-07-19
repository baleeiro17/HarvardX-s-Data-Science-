library(dslabs)
data("murders")

# returns indices that are TRUE:
x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)

# to determine the murder rate in Massachusetts we may do the following, return index in dataframe:
index <- which(murders$state == "Massachusetts")
index
murders$state[ index ]

# to obtain the indices and subsequent murder rates of New York, Florida, Texas, we do( not all data in logical).
index <- match(c("New York", "Florida", "Texas"), murders$state)
index

# we can acess other variables with 
murders$state[index]

# return logical vector if elements is in y as is in x.
x <- c("a", "b", "c", "d", "e")
y <- c("a", "d", "f")
y %in% x

# to see if Boston, Dakota, and Washington are states(subsetting task or subsets)
c("Boston", "Dakota", "Washington") %in% murders$state
