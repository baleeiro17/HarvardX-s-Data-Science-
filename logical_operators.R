library(dslabs)
data("murders")

murder_rate<- ( murders$total / murders$population )*100000 

# using logical operators in R to index vectors.

# it actually performs the test for each entry to the vector.
index<- murder_rate > 0.71
index<- murder_rate <= 0.71

# the entries that are true are the cases for the which the murder is smaller or equal than 0.71.
# remember vector can be indexed with logicals.
murders$state[ index ]

# coun how many entries are true because true is 1 and false is 0.
sum(index)

# use & as and.

# get states on the mountains in the united states and with rate to be less than or equal 1.
west <- murders$region == "West"

rates <- murder_rate <= 1

index <- west & rates

murders$state[ index ]
