library(gtools)
library(tidyverse)

# In the 200m dash finals in the Olympics, 8 runners compete for 3 medals (order matters). 
# In the 2012 Olympics, 3 of the 8 runners were from Jamaica and the other 5 were from different countries. 
# The three medals were all won by Jamaica (Usain Bolt, Yohan Blake, and Warren Weir).

# How many different ways can the 3 medals be distributed across 8 runners?
l <- permutations(8,3) # 336 possibilidades.
l1 <- nrow( l )

# How many different ways can the three medals be distributed among the 3 runners from Jamaica?
l <- permutations(3,3)
l2 <- nrow( l )

# What is the probability that all 3 medals are won by Jamaica?
p <- l2 / l1
p

# Run a Monte Carlo simulation on this vector representing the countries of the 8 runners in this race:
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")

# For each iteration of the Monte Carlo simulation, within a replicate() loop, 
# select 3 runners representing the 3 medalists and check whether they are all from Jamaica. 
# Repeat this simulation 10,000 times. Set the seed to 1 before running the loop.
# Calculate the probability that all the runners are from Jamaica.
set.seed(1)
B <- 10000
prob <- replicate( B, {
  winners <- sample( runners, 3, replace = FALSE ) # first choice we do not replace because he is the winner.
  winners[1] == "Jamaica" & winners[2] == "Jamaica" & winners[3] == "Jamaica"
  # or all( results )
})
mean( prob )

# A restaurant manager wants to advertise that his lunch special offers enough choices 
# to eat different meals every day of the year. 
# He doesn't think his current special actually allows that number of choices, 
# but wants to change his special if needed to allow at least 365 choices.

# A meal at the restaurant includes 1 entree, 2 sides, and 1 drink. 
# He currently offers a choice of 1 entree from a list of 6 options, 
# a choice of 2 different sides from a list of 6 options, 
# and a choice of 1 drink from a list of 2 options.

# How many meal combinations are possible with the current menu?
entries <- nrow( combinations( 6,1 ) )
sides1 <- nrow( combinations(6,2) )
drink <- nrow( combinations( 2,1 ) )

# entries + sides1 + drink # but is 1 entree, 2 sides and 1 drink( and multiplicative rule )
entries * sides1 * drink 

# The manager has one additional drink he could add to the special.
# How many combinations are possible if he expands his original special to 3 drink options?
entries <- nrow( combinations( 6,1 ) )
sides1 <- nrow( combinations( 6,2 ) )
drink <- nrow( combinations( 3,1 ) )
entries * sides1 * drink 

# How many meal combinations are there if customers can choose from 
# 6 entrees, 3 drinks, and select 3 sides from the current 6 options?
entries <- nrow( combinations( 6,1 ) )
sides1 <- nrow( combinations( 6,3 ) )
drink <- nrow( combinations( 3,1 ) )
entries * sides1 * drink 

# The manager is concerned that customers may not want 3 sides with their meal. 
# He is willing to increase the number of entree choices instead, 
# but if he adds too many expensive options it could eat into profits. 
# He wants to know how many entree choices he would have to offer in order to meet his goal:
# -Write a function that takes a number of entree choices and returns the number of meal combinations 
# possible given that number of entree options, 3 drink choices, and a selection of 2 sides from 6 options.
# -Use sapply() to apply the function to entree option counts ranging from 1 to 12.

# What is the minimum number of entree options required in order to generate more than 365 combinations?
entrees <- function( N ) {
    var = ( nrow( combinations( N,1 ) ) * nrow( combinations( 6,2 ) ) * nrow( combinations( 3,1 ) ) ) 
} 

combos <- sapply(1:12,FUN = entrees) 
data.frame( entrees = 1:12, combos = combos ) %>%
  filter( combos > 365 ) %>%
  min(.$entrees)

# The manager isn't sure he can afford to put that many entree choices on the lunch menu and 
# thinks it would be cheaper for him to expand the number of sides. 
# He wants to know how many sides he would have to offer to meet his goal of at least 365 combinations.

# - Write a function that takes a number of side choices and returns the number of meal combinations possible given 6 entree choices, 
# 3 drink choices, and a selection of 2 sides from the specified number of side choices.

# - Use sapply() to apply the function to side counts ranging from 2 to 12.

# What is the minimum number of side options required in order to generate more than 365 combinations?
entrees <- function( N ) {
  var = ( nrow( combinations( 6,1 ) ) * nrow( combinations( N,2 ) ) * nrow( combinations( 3,1 ) ) ) 
} 

combos <- sapply( 2:12,FUN = entrees ) 
data.frame( entrees = 2:12, combos = combos ) %>%
  filter( combos > 365 ) %>%
  min( .$entrees )

