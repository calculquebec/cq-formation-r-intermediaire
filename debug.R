# This program calls a series of functions and
# intentially produces an error for the purpose
# of practicing debugging in R


func4 <- function(x)
{
    2*x + 4
}


func3 <- function(x)
{
    val <- log(x)
    if (val < 5)
        val^3 + func4(val)
    else
        val^2 - func4(val)
}

func2 <- function(x)
{
    val <- x * func3(x)
    val
}

func1 <- function(x)
{
    val <- x - func2(x)
    val
}

print("Starting program...")
a <- func1(1)
sprintf("func1(1) = %d", a)
b <- func1(-1)
sprintf("func1(-1) = %d", b)