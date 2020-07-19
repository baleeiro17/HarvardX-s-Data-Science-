
B <- 10000
pick <- replicate( B,{
    # So let's start by creating a simulation that imitates the strategy of sticking
    # to the same door.
    doors <- as.character( 1:3 )
    prize <- sample( c("car","goat","goat") ) # change the positions of the car.
    prize_door <- doors[ prize == "car" ]     # set the position of the car in doors.
    
    # Prize door contains the number of the door with the prize behind it.
    # Then we're going to imitate your pick by taking a random sample of these three
    my_pick <- sample( doors, 1 )
    
    # Now, in the next step, we're going to decide which door you're shown.
    # You're going to be shown not your door and not the door with a prize.
    # You're going to be shown the other one.
    show <- sample( doors[ !doors %in% c(my_pick, prize_door) ] , 1 )
    # You stick to your door.
    stick <- my_pick
    
    # we ask is the door you chose, the one you stuck to, is that the prize door?
    stick == prize_door
    
} )

# We know it's going to be a 1/3, because none of this procedure
# changed anything.
# You started picking one out of three, nothing changed.
mean( pick )

# Now, let's repeat the exercise, but consider the switch strategy.
pick_c2 <- replicate( B,{
  # So let's start by creating a simulation that imitates the strategy of sticking
  # to the same door.
  doors <- as.character( 1:3 )
  prize <- sample( c("car","goat","goat") ) # change the positions of the car.
  prize_door <- doors[ prize == "car" ]     # set the position of the car in doors.
  
  # Prize door contains the number of the door with the prize behind it.
  # Then we're going to imitate your pick by taking a random sample of these three
  my_pick <- sample( doors, 1 )
  
  # Now, in the next step, we're going to decide which door you're shown.
  # You're going to be shown not your door and not the door with a prize.
  # You're going to be shown the other one.
  show <- sample( doors[ !doors %in% c(my_pick, prize_door) ] , 1 )
  # You stick to your door.
  switch <- doors[ !doors %in% c( my_pick, show ) ]
  
  # we ask is the door you chose, the one you stuck to, is that the prize door?
  switch == prize_door
  
} )

mean( pick_c2 )


