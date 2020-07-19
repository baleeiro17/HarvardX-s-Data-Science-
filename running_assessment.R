
# Mandi, Amy, Nicole, and Olivia all ran different distances in different time intervals. Their distances (in
# miles) and times (in minutes) are as follows:
name <- c("Mandi", "Amy", "Nicole", "Olivia")
distance <- c(0.8, 3.1, 2.8, 4.0)
time <- c(10, 30, 40, 50)

# code to convert time to hours
time <- time/60


# code to calculate the speed of each runner in miles per hour. Speed is distance divided by time.
speed <- distance / time

# create dataframe to solve problem.
data_runners <- data.frame(name=name,speed=speed,hours=time)
data_runners

