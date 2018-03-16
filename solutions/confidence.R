#We want to compute the 95% confidence interval
# for a normal distribution with mean=0 and sd=1

#The qnorm() (inverse cumulative density function) 
# will tell us the value under the distribution 
# given an integrated value of the distribution

#In this case, we want to know the value where
# the cumulative density function is 2.5% (the 
# left of the confidence interval) and where 
# it is 97.5% (the right of the confidence interval)

conf.interval = c(qnorm(0.025, mean=0, sd=1), qnorm(0.975, mean=0, sd=1))

print(conf.interval) 