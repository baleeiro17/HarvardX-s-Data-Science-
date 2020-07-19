library(dplyr)
library(dslabs)
library(ggplot2)
data(heights)

# Now we are going to make density plots for males and females separate using
# group argument:
heights %>% 
  ggplot( aes( height, group = sex ) ) + geom_density( )

# or we can use:
# Using color has the added benefit that it uses color to distinguish the groups:
heights %>% 
  ggplot( aes(height, color = sex ) ) + geom_density( )

# However, here the second density is drawn over the other. 
# We can change this by using something called alpha.
heights %>% 
  ggplot( aes(height, fill = sex) ) + 
  geom_density( alpha = 0.2 ) 