library(dslabs)
library(tidyverse)
data(heights)

# dot plot showing the data
heights %>% ggplot( aes(sex, height) ) + geom_point()

# jittered, alpha blended point plot
# Jitter is adding a small random shift to each point in order to minimize the number of overlapping points. 
# To add jitter, use the  geom_jitter() geometry instead of geom_point().
heights %>% ggplot( aes(sex, height) ) + geom_jitter( width = 0.1, alpha = 0.2 )
