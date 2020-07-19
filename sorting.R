library(dslabs)
data(murders)

# show all information present in the database.
show(murders) 

# sorting states by total of murders or states orderered by murder totals.
sort(murders$total)

# but if I rather see name of states than number of murders.
# ordered murders total and return index,use this for organize information.
index<-order(murders$total)

# show all states ordered by murders total(from least to most),here,
# I saw name of states not number of murders.
murders$abb[index]

# but if I need an information about max or min or index from max or min.
max(murders$total)
min(murders$total)

i_max <- which.max(murders$total)
i_min <- which.min(murders$total)

murders$state[i_max]
murders$state[i_min]

# difference about rank and order:
# order gives a index that we need to go to the column of the original to get value.
# 1257 2 -> order gives 2(position of the smallest data ) 1( position of second
# smallest data)
# rank indicates the position of the data about ( 1 is the smallest data )
x <- c(31, 4, 15, 92, 65)
rank(x)






