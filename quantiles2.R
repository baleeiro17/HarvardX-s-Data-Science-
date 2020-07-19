library(dslabs)
data(heights)

# show how dataset heights is well approximmated with normal distribution?
x <- heights$height[ heights$sex == "Male" ]

# calculate quantiles from our data with intervals each with 5% probability.
p <- seq(0.05, 0.95, 0.05)
our_quantile <- quantile(x,p)

# calculate quantiles from normal distribution for approximation.
n_quantile <- qnorm(p,mean(x),sd(x) )

# show each quantiles in plot for evaluate.
plot(our_quantile, n_quantile,xlab = "data set heights quantiles",
     ylab = "normal distribution")
abline(0,1)

# points fall almost on the line, meaning the normal distribution is a pretty good
# approximation.





