library( gtools )

# what does the probability that if I
# draw 5 cards without replacement, I get all cards
# of the same suit, what is called a flush in poker?

# So let's start by constructing a deck of cards
# using R.

# how using paste.
number <- "Three"
suit <- "Hearts"
paste(number, suit)

# as.character transform in text.
paste( letters[1:5], as.character(1:5) )

# The function expand.grid gives us all the combinations of 2 lists.
expand.grid( pants = c("blue","black"), shirt = c("white","grey","plaid") )

# So here's how we generate a deck of cards.
suits <- c( "Diamonds","Clubs","Hearts","Spades" )
numbers <- c( "Ace","Deuce","Three","Four", "Five", "Six", "Seven", 
             "Eight", "Nine","Ten", "Jack", "Queen", "King" )

deck <- expand.grid( number = numbers, suit = suits )
deck <- paste( deck$number,deck$suit )

# Let's double-check that the probability of a king in the first card is 1 in 13.
kings <- paste( "King",suits )
mean( deck %in% kings ) # proportion is TRUE.

# The permutations function computes for any list of size n
# all the different ways we can select R items.
# here all the ways we can choose 2 numbers from the list 1, 2, 3, 4, 5.
permutations( 5, 2 ) # orders matters 1,2 is different than 2,1 and pick a number, it can´t appear again.

# So for example, if you want to see 5 random 7-digit phone numbers out
# of all possible phone numbers, you could type code like this.
all_phone_numbers <- permutations( 10, 7, v = 0:9 )
n <- nrow( all_phone_numbers )
index <- sample( n, 5 ) # choosing five lines at random
all_phone_numbers[ index, ]

# Now, how about the conditional probability of the second card being a king,
# given that the first was a king ?
hands <- permutations( 52,2, v = deck )
first_card <- hands[ ,1 ]
second_card <- hands[ ,2 ]

# This is an R version of the multiplication rule.
sum( first_card %in% kings & second_card %in% kings ) / sum( first_card %in% kings )

# using combinations.
combinations(3,2) # 1,2 is not different than 2,1. In this case orders doesn´t matter.

# Now, what if the order does not matter ?
# For example, in blackjack, if you get an ace and a face card or a 10,
# it's called a natural 21, and you win automatically.
ace <- paste( "Ace", suits )
facecard <- expand.grid( number = c("Ten", "Jack", "Queen", "King"), suit = suits )
facecard <- paste( facecard$number, facecard$suit )
facecard
hands <- combinations(52,2, v = deck )
first_card <- hands[ ,1] 
second_card <- hands[ ,2] 
mean(  ( first_card %in% ace & second_card %in% facecard ) )

# Instead of using combinations to deduce the exact probability of a natural 21,
# we can also use a Monte Carlo to estimate this probability.

# In this case, we draw two cards over and over.
B <- 10000
events <- replicate( B, {
          hand <- sample( deck, 2 )
          ( hand[1] %in% ace & hand[2] %in% facecard ) | ( hand[2] %in% ace & hand[1] %in% facecard )
})
mean( events )
