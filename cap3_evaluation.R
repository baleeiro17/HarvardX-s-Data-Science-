library(dslabs)
data(heights)
options(digits = 3)    # report 3 significant digits for all answers

# average height in this dataset.
average <- mean(heights$height)
ind <- which( average < heights$height & heights$sex == "Female" )
length(ind)

# proportion of individuals in the dataset are female.
prop <- heights$sex %in% c("Female")
mean(prop)

# Determine the minimum height in the heights dataset.
min <- heights$height[ which.min(heights$height) ]

heights$sex[ match(min, heights$height) ]

# Determine the maximum height.
max <- heights$height[ which.max(heights$height) ]
min
max

# How many of the integers in x are NOT heights in the dataset?
x <- 50:82
ind <- x %in% heights$height
sum(!ind)

# Using the heights dataset, create a new column of heights in centimeters named ht_cm. Recall that 1 inch =
# 2.54 centimeters. Save the resulting dataset as heights2.
heights2 <- data.frame(heights,ht_cm = heights$height*2.54 )
heights2$ht_cm[18]
mean(heights2$ht_cm)

# Create a data frame females by filtering the heights2 data to contain only female individuals.
females <- filter(heights2, heights2$sex == "Female")
length( which(heights2$sex == "Female") )
mean( females$ht_cm )

# data frame contains composition in percentage of eight fatty acids found 
# in the lipid fraction of 572 Italian olive oils.
data(olive) 
plot(olive$palmitic, olive$palmitoleic)
hist(olive$eicosenoic)
boxplot(palmitic~region,data = olive)


