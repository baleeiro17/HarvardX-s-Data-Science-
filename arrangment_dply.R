library(NHANES)
data(NHANES)


# Remember that the main summarization function in R will return NA 
# if any of the entries of the input vector is an NA. Here is an example:
library(dslabs)
data(na_example)
mean(na_example)
sd(na_example)

# to change this use flag = true.
mean(na_example, na.rm = TRUE)
sd(na_example, na.rm = TRUE)

# You will determine the average and standard deviation of systolic blood pressure,
# which are stored in the BPSysAve variable in the NHANES dataset.
ref <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize( average = mean(BPSysAve,na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE) )
ref

# Within summarize, save the min and max of systolic 
# blood pressure as minbp and maxbp. 
NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>%
  summarize( minbp = min(BPSysAve, na.rm = TRUE ), maxbp = max(BPSysAve,
                                                              na.rm = TRUE) )

# We will compute the average and standard deviation of systolic 
# blood pressure for females for each age group separately.
NHANES %>%
  filter(Gender == "female") %>% group_by(AgeDecade) %>%
  summarize( average = mean( BPSysAve, na.rm = TRUE),
             standard_deviation = sd( BPSysAve, na.rm = TRUE ) )

# Calculate the average and standard deviation of systolic blood pressure 
# for males for each age group separately.
NHANES %>% filter( Gender == "male" ) %>% group_by( AgeDecade ) %>%
  summarize( average = mean(BPSysAve,na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE) )

# We can actually combine both of these summaries into a single line of code. 
NHANES %>% group_by(AgeDecade, Gender) %>% 
  summarize( average = mean(BPSysAve,na.rm = TRUE), standard_deviation = 
               sd(BPSysAve,na.rm = TRUE) )

# Now we are going to explore differences in systolic blood 
# pressure across races, as reported in the Race1 variable.
# Compute the average and standard deviation 
# for each value of Race1 for males in the age decade 40-49.
# Order the resulting table from lowest 
# to highest average systolic blood pressure.
NHANES  %>% group_by( Race1 ) %>% 
  filter( Gender == "male" & AgeDecade == " 40-49" ) %>% 
  summarize( average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE) ) %>%
  arrange(average) 



