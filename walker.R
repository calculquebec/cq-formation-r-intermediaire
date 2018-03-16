num_walkers <- 100000
num_paths <- 200

x <- matrix(0,num_paths,num_walkers)
x2 <- rep(0,num_paths)

# Launch random walkers, all starting from x = 0
set.seed(47)
ts <- proc.time()
for(i in 1:num_walkers) 
{
	# A walker completes its walk
	for(k in 2:num_paths)
	{
		x[k,i] <- x[k-1,i] + rnorm(1,0,1)
	}
}
proc.time() - ts

# Compute the variance
for(k in 1:num_paths)
{
	x2[k] <- sum(x[k,]*x[k,])/num_walkers
}

# Plot a path
plot(x[,1],type='l',xlab='Steps',ylab='Displacement')

# Plot the variance
plot(1:num_paths,x2,xlab='Displacement',ylab='Variance')

# Plot the distribution of displacements at last step
hist(x[num_paths,],freq=TRUE)

save(x,x2,file="vars.rdata")

