
# This line of example code simulates four independent random games where the Celtics 
# either lose or win. Copy this example code to use within the `replicate` function.
simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))


# The variable 'B' specifies the number of times we want the simulation to run.
# Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `celtic_wins` that replicates two steps for B iterations: 
# (1) generating a random four-game series `simulated_games` using the example code, 
# then (2) determining whether the simulated series contains at least one win for the Celtics.
celtic_wins <- replicate( B,{
  simulated_games <- sample( c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4) )
  ( simulated_games[1] == "win" | simulated_games[2] == "win"  | simulated_games[3] == "win" 
    | simulated_games[4] == "win" )
})



# Calculate the frequency out of B iterations that the Celtics won at least one game. 
# Print your answer to the console.
prob_cel <- function ( B ){
  celtic_wins <- replicate( B,{
    simulated_games <- sample( c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4) )
    ( simulated_games[1] == "win" | simulated_games[2] == "win"  | simulated_games[3] == "win" 
      | simulated_games[4] == "win" )
  })
  mean( celtic_wins )
}
prob_cel( B )