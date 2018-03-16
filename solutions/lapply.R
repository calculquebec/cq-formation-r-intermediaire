#Load the airquality dataset
library(datasets)
data(airquality)

#Compute the coefficient of variation for the Wind
# and Temp columns simultaneously
lapply(airquality[,c("Wind", "Temp")], function(x) sd(x)/mean(x))