library(tidyverse)
library(dslabs)
data("heights")
data("murders")

# For example, we may want to compute the average and standard deviation for men
# and women heights separately.
p <- heights %>% group_by( sex ) %>% summarize( mean = mean( height), 
                                                s_dev = sd( height) )

# create a dataframe new with mean and sd group by sex.
p

# create a dataframe with median rate for region.
s <- murders %>% mutate( rate = total / population * 100000 ) %>% 
  group_by( region ) %>% summarize( median_rate = median(rate)  )
s

