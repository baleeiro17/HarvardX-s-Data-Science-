library(ggplot2)
library(dplyr)
library(dslabs)
library(ggthemes)
library(ggrepel)
data("murders")

# first step in create the plot.
p <- murders %>% ggplot( aes(population/10^6, total, label = abb) )

# average rate murder of entire country.
r <- murders %>% summarize(rate = sum(total) / sum(population) * 10^6) %>% pull(rate)

# Add-on Packages in ggplot2 with new themes.
p <- p + geom_abline( intercept = log10(r), lty = 2, color = "darkgrey" ) +
  geom_point( aes(color = region ), size = 3 )  + 
  geom_text_repel() + 
  scale_x_log10()  + 
  scale_y_log10() +
  xlab("Population in millions(log scale)") +
  ylab("Total of murders(log scale)") +
  ggtitle("US Gun Murders in US 2010") + 
  scale_color_discrete(name = "Region") # Change legend title.

# add a layer that is defined by the theme_economist(new theme).
p <- p + theme_economist()

# we get the final plot as we wanted.
p

# The add-on package ggrepel includes a geometry
# that adds labels ensuring that they don't fall on top of each other( geom_tex
# _repel ).
