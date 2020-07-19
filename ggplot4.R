library(ggplot2)
library(dplyr)
library(dslabs)
data("murders")

# make before.
p <- murders %>% ggplot( aes(population/10^6, total, label = abb) )
#p + geom_point( size = 3 ) +
#    geom_text( nudge_x = 0.075 )  + 
#    scale_x_continuous( trans = "log10") + 
#    scale_y_continuous( trans = "log10")


# add a line that represents average muder rate for the entire country.
r <- murders %>% summarize(rate = sum(total) / sum(population) * 10^6) %>% pull(rate)

# or we can use:
p + geom_abline( intercept = log10(r), lty = 2, color = "darkgrey" ) +
  geom_point( aes(color = region ), size = 3 )  + 
  geom_text( nudge_x = 0.075 ) + 
  scale_x_log10()  + 
  scale_y_log10() +
  xlab("Population in millions(log scale)") +
  ylab("Total of murders(log scale)") +
  ggtitle("US Gun Murders in US 2010") + 
  scale_color_discrete(name = "Region") # Change legend title.


