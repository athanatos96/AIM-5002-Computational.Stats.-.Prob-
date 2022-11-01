##To explore the T distribution, type
help(dt)

## Plot some T pdf's
par(mfrow=c(1,1))
curve(dt(x, df=1), from = -5, to = 5,
      ylim = c(0,0.4), col = "red")
curve(dt(x, df=2), from = -5, to = 5,
      ylim = c(0,0.4), col = "orange")#, add=TRUE
curve(dt(x, df=5), from = -5, to = 5, 
      ylim = c(0,0.4), col = "green")#, add=TRUE)
curve(dt(x, df=10), from = -5, to = 5, 
      ylim = c(0,0.4), col = "blue")#, add=TRUE
curve(dt(x, df=100), from = -5, to = 5, 
      ylim = c(0,0.4), col = "violet")#, add=TRUE


## To compute some Confidence intervals, 
# we need a few more things in R...

## Conditional Statement
case = "normal"
if(case=="normal"){
    print("Normal!")
}else if(case=="clt"){
    print("CLT!")
}else if(case=="t"){
    print("t!")
}else{
    print("Choose Normal, CLT, or t")
}


## Conditional statement examples
a = 10; b = 0
if(b!=0){
    c = a/b
}

##
if(b!=0){
    c = a/b
}else{
    c = NA
}

##########
## Now we construct some confidence intervals
##########

# If you want to debug later, it is
# a good idea to fix the randomness
# with sed.seed()
set.seed(1)

# set number of experiments n
n <- 100
#set size of random sample N
N <- 6
#set confidence level
alpha <- 0.05

# Set population mean and standard deviation
populationMean <- 1
populationSd <- 2


# Simulate random sample 
# from a normally distributed population
# with given populationMean and populationSd


upperBound <- numeric(n)
lowerBound <- numeric(n)
for(i in 1:n){
  #generate random sample:
  sample = rnorm(n = N, 
                 mean = populationMean, 
                 sd = populationSd)
  #compute confidence interval:
  size = qt(1 - alpha/2, df = N - 1) * 
    sd(sample) / sqrt(N)
  upperBound[i] = mean(sample) + 
    size
  lowerBound[i] = mean(sample) - 
    size
}

# Now we plot all confidence intervals
# on one plot:
intervals <- rbind(lowerBound,upperBound)
indices <- rbind(1:n,1:n)
matplot(y=intervals,x=indices,type="l",
        lty=1,
        xlab="Experiments",
        ylab="Intervals")

# Let us check which confidence interval
# contains population mean and which does not
success <- numeric(n) 
for(i in 1:n){
    if(lowerBound[i] <= populationMean 
       & upperBound[i] >= populationMean){
        success[i] <- 1
    }
}
# proportion of good confidence intervals:
mean(success)

# For loop is sometimes slow. It is
# possible to avoid using foor loop with the
# next trick:
success <- numeric(n)
success <- ifelse(lowerBound 
                  <= populationMean 
                  & upperBound 
                  >= populationMean, 
                  1, 0)
mean(success)

# Now plot the confidence intervals again,
# but mark the bad ones:
successColor <- ifelse(success==1,1,2)
matplot(y=intervals,x=indices,
        type="l",lty=1,
        xlab="Experiments",ylab="Intervals",
        col=successColor)


