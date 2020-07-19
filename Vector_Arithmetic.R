library(dslabs)
data("murders")

# confirm california has the large population and with more murders than others.
murders$state[ which.max(murders$total) ]
murders$state[ which.max(murders$population) ]

# operations with vector.

# heights in inches
heights<-c(69,71,68)

# convert for centimeters by multiply the object heights by 2.54( each element multiplied by 2.54)
heights * 2.54 

# if we want to compute how many inches taller or shorter than the average, in this case 69.
# we can subtract the average from every entry from the vector and then how much bigger or smaller each
# entry is from 69.
heights - 69

# this operations work with the vector of the same lenght and the same holds for other matematical operations.

# This implies that to compute the murder rate, murders for every 100000 people.
murder_rate<- ( murders$total / murders$population )*100000 

# ordered states by murder rate( more fair )
murders$state[ order(murder_rate,decreasing = TRUE) ]
