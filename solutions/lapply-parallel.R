#load the parallel library for 
library(parallel)

#Choose a seed for reproducible random numbers
set.seed(1)


#Size of random matrix 
size <- 1000

#Generate random numbers and shape them 
#into a square matrix
x <- runif(size*size)
x <- matrix(x, nrow=size, ncol=size)

#Compute the coefficients of variation of each row 
# first in serial
print("Serial time:")
print(system.time(y <- lapply(x, function(x) sd(x)/mean(x))))

#Create a sockets cluster with two cores on the localhost
cl <- makeCluster(type="SOCK", c("localhost", "localhost"))

#Generate and shape new random numbers
# this prevents our timing being affected 
# by caching of the previous results
x <- runif(size*size)
x <- matrix(x, nrow=size, ncol=size)

#Compute the coefficients of variation of each row
# in parallel this time
print("Parallel time:")
print(system.time(y <- parLapply(cl, x, function(x) sd(x)/mean(x))))