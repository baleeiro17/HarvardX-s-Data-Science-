library(dslabs)
library(tidyverse)
data("gapminder")

# Here, we focus on the importance of describing
# the variability within the groups.
# While we do this, we'll also show you some other ggplot functions as well as
# a transformation called the logit transformation.
# As an example for this, we will focus on the relationship between country child
# survival rates and average income.
# we're going to find a few more
# regions using the case when function.
# We're going to define the West, Northern Africa, East Asia, Southern Asia, Latin
# America, Sub-Saharan Africa, and the Pacific Islands.
present_year <- 2010
gapminder <- gapminder %>%
  mutate( group = case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central America", "South America", "Caribbean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands") )


# Once we do this, we can compute the quantities
# that we're interested in for each region, We'll compute the average.
surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group)) %>%
  group_by( group ) %>%
  summarize( income = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population) )
surv_income %>% arrange(income)

# In this plot, we introduced the use of the limit argument, which
# lets us change the range of the axis.
# We would do it like this following this code.
# Finally, we introduce a new transformation,
# the logistic transformation
# x->income and y->infant_survival_rate.
# In this plot, we introduced the use of the limit argument, which
# lets us change the range of the axis.
surv_income %>% ggplot( aes(income, infant_survival_rate, label = group, color = group) ) +
  scale_x_continuous( trans = "log2", limit = c(0.25, 150) ) +
  scale_y_continuous( trans = "logit", limit = c(0.875, .9981 ),
                     breaks = c(.85, .90, .95, .99, .995, .998) ) +
  geom_label( size = 3, show.legend = FALSE ) 

