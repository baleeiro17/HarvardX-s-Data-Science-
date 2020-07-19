library(dslabs)
library(dplyr)
data("murders")

murders <- murders %>% mutate( rate = (total/population)*100000 )

ind <- which.min(murders$rate)

# use if and else.
if( murders$rate[ ind ] < 0.5 ){
  print(murders$state[ ind ])
} else {
  print("no state has a murder rate that low.")
}
# or ifelse function that is very useful.
# the function takes three arguments a logical, and two possible answers.
ifelse(  murders$rate[ ind ] < 0.3, murders$state[ ind ], "no state has a murder rate that low.")

# but this functions is particularly useful because it works on vectors.
# example about replacing NAS with some other value.
data("na_example")

# verify how many NAS are in the vector.
sum( is.na(na_example) )

# replacing All the NAS with 0, using ifelse function.
no_nas <- ifelse( is.na(na_example), 0, na_example )
sum( is.na(no_nas) )

# Two more functions: any and all, there are also quite useful.
# The any function takes a vector of logicals and it returns true, if any(at least)
# of the entries is true, false because none of them are true.
v <- c(TRUE, TRUE, FALSE)
any(v)

# all return true if all the entries are true.
# they are not all true then of course I get a false.
all(v)


