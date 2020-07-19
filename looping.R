# compute a sum of sequenece from 1 to 25.
# 1 
# 1+2
# 1+2+3

# sum sequences from 1 to n.
compute_s_n <- function(n) {
  x <- 1:n
  sum(x)
}

# define range of the sequence.
m <- 25

# I´m going to create a vector using dynamic allocation.
resu <- vector(length = m)

# using loop in R.
for( n in 1:m ) {
  resu[n] <- compute_s_n(n)
}


m <- 1:25

# making a table to comparing the values.
table = data.frame(m, n = resu, formula = m*(m+1)/2)

# we add lines, using function lines.
# making a plot for comparing formula and my function.
# (x, y)
plot(m, resu)

# add line on plot(formula).
lines(m,table$formula)

# Functions that are typically used instead of for loops in R
# are apply, sapply, tapply, and mapply.
# https://www.guru99.com/r-apply-sapply-tapply.html

x <- c(1,2,-3,4)
if(all(x>0)) {
  print("All Positives")
} else {
  print("Not All Positives")
}

