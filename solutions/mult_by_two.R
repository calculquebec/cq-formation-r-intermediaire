dyn.load("mult_by_two.so")

mult_test <- function(n,x) {
  out <- .C("mult_by_two",n=as.integer(n),x=as.double(x))
  return(out$x)
}

vx <- c(7.2,-1.5,0.76,-5.46) 
print(vx)
temp <- mult_test(length(vx),vx)
print(temp)

# We could also do this same calculation using a fast 
# vectorial method, e.g. 
temp2 <- ifelse(seq(length(vx)) %% 2,2*vx,vx)
print(temp2)

