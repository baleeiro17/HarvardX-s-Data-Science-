options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

# We use real data about a selection of 891 passengers to learn who was on the Titanic and 
# which passengers were more likely to survive. 
titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

# Make density plots of age grouped by sex.
titanic %>% ggplot( aes(Age, y = ..count.., group = Sex, color = Sex ) ) + geom_density( alpha = 0.4 )

titanic %>%
  ggplot( aes(Age, y = ..count.., fill = Sex) ) +
  geom_density(alpha = 0.2, position = "stack")


# Use geom_qq() to make a QQ-plot of passenger age and add an identity line with geom_abline(). Filter out any individuals with an age of NA first. 
# Use the following object as the dparams argument in geom_qq():

# And now we see that the Q-Q plot is plotted against a normal distribution
# with the same mean and standard deviation as our data.
params <- titanic %>%
  filter( !is.na(Age) ) %>%
  summarize( mean = mean(Age), sd = sd(Age) )

titanic %>% filter( !is.na(Age) ) %>% ggplot( aes( sample = Age ) ) +
  geom_qq( dparams = params ) + geom_abline( )

# To answer the following questions, make barplots of the Survived and Sex variables using geom_bar(). 
# Try plotting one variable and filling by the other variable. 
# You may want to try the default plot, then try adding position = position_dodge() 
# to geom_bar() to make separate bars for each group.
titanic %>% ggplot( aes(Survived ) ) + geom_bar()
titanic %>% ggplot( aes(Survived, fill = Sex) ) + geom_bar( position = position_dodge() )

# Make a density plot of age filled by survival status. 
# Change the y-axis to count and set alpha = 0.2.
titanic %>% ggplot( aes(y = ..count.., Age, fill = Survived) ) + geom_density( alpha = 0.2 )

# Filter the data to remove individuals who paid a fare of 0. 
# Make a boxplot of fare grouped by survival status. 
# Try a log2 transformation of fares. Add the data points with jitter and alpha blending.
titanic %>% filter( Fare > 0 ) %>% ggplot( aes(Survived, Fare) ) + geom_boxplot() +
  scale_y_continuous( trans = "log2") + geom_jitter( alpha = 0.2 )

# The Pclass variable corresponds to the passenger class. Make three barplots. 
# For the first, make a basic barplot of passenger class filled by survival. 
# For the second, make the same barplot but use the argument position = position_fill() 
# to show relative proportions in each group instead of counts. 
# For the third, make a barplot of survival filled by passenger class using position = position_fill().
titanic %>% ggplot( aes(Pclass) ) + geom_bar()
titanic %>% ggplot( aes(Pclass, fill = Survived) ) + geom_bar()
titanic %>% ggplot( aes(Pclass, fill = Survived) ) + geom_bar( position = position_fill() )
titanic %>% ggplot( aes(Survived, fill = Pclass) ) + geom_bar( position = position_fill() )

# Create a grid of density plots for age, filled by survival status, 
# with count on the y-axis, faceted by sex and passenger class.
titanic %>% ggplot( aes(Age, y = ..count.., fill = Survived) ) + geom_density( position = "stack") +
  facet_grid( Sex~Pclass )

# without stack.
titanic %>% ggplot( aes(Age, y = ..count.., fill = Survived) ) + geom_density( position = "stack") +
  facet_grid( Sex~Pclass )



