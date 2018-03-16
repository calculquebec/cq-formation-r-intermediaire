#Choose a seed for reproducible random numbers
set.seed(1)


#Size of random matrix 
size <- 1000

#Generate random numbers and shape them 
#into a square matrix
x <- runif(size*size)
x <- matrix(x, nrow=size, ncol=size)

#Compute the coefficients of variation of each row 
print("Serial time:")
print(system.time(y <- lapply(x, function(x) sd(x)/mean(x))))