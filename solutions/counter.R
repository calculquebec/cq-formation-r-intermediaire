#Define the counter closure
counter <- function () 
{
    #Set the local variable ctr to 0
    ctr <- 0
    f <- function() 
    {
        #increment ctr using superassignment operator
        ctr <<- ctr + 1
	#print value of ctr
        print(ctr)
    }
    #return the function
    return(f)
}

#Test the closure
c1 <- counter()
c2 <- counter()
c1() #expected 1
c2() #expected 1
c1() #expected 2
c2() #expected 2
c2() #expected 3
c2() #expected 4
c1() #expected 3