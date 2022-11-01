## R has built in functions for many basic probability 
## distributions.
## E.g. for normal distribution, try 
?dnorm

## As we can see, dnorm provides the pdf (i.e. density)
##of the normal distribution
dnorm(0) == 1/sqrt(2*pi)
dnorm(1) == exp(-1/2)/sqrt(2*pi)

## with general normal distribution
dnorm(x=-2,mean=1,sd=sqrt(3))

## critical values
qnorm(p=.025,lower.tail=FALSE)
qnorm(p=1-.025)
qnorm(p=.025,lower.tail=FALSE, mean=1,sd=sqrt(3))
sqrt(3)*qnorm(p=.025,lower.tail=FALSE)+1

## Cumulative distribution function Phi
pnorm(q=1.96)
pnorm(q=4.395, mean=1,sd=sqrt(3))


## generating random variables
x = rnorm(n=1000,mean=1,sd=sqrt(3))
x
hist(x,prob=TRUE)
curve(dnorm(x, mean=1, sd=sqrt(3)), add=TRUE)
summary(x)


## curve function
curve(x^3)
curve(x^3,from=-10,to=10)



## Graphics into PDF file
## You can save a plot into a pdf file.
pdf("samplePlot.pdf")
plot(x=cars$speed, y=cars$dist,xlab="Speed",ylab="Stopping
Distance",main="Sample Plot")
dev.off()

## For Loop
y = numeric(10) # prepare result vector with all zero elements
y
for(i in 1:10){
   y[i] = i # store i in the ith element of vector y
   print(i) # print i 
}
y

## CLT

par(mfrow=c(2,1)) 
# 2 by 2 panels for plots, 
# use par(mfrow=c(1,1)) to change to default

n = 30
#set the size of the random sample


## Normally distributed sample
xbars = numeric(n) # initialize result vector with n zeros
normal.mean=1
normal.sigma=sqrt(3)
for(i in 1:3000){
   dataSet = rnorm(n=n,mean=normal.mean,sd=normal.sigma) 
   # generate a random sample of size n
   xbars[i] = mean(dataSet) 
   # compute sample mean of x
}
zs = (xbars-normal.mean)/(normal.sigma/sqrt(n)) 
# standardization
hist(zs,prob=TRUE,ylim=c(0,.6),xlim=c(-4,4),
     main="Normal Distribution, n=30",xlab="") 
curve(dnorm(x,mean=0,sd=1), add=TRUE)

## The same with Poisson random sample
xbars = numeric(n) 
lambda = 1
for(i in 1:3000){
   dataSet = rpois(n=n,lambda=lambda) 
   xbars[i] = mean(dataSet)
}
zs = (xbars-lambda)/(sqrt(lambda)/sqrt(n)) 
# Mind the standardization! We use Poisson distribution
hist(zs,prob=TRUE,ylim=c(0,.6),xlim=c(-4,4),
     main="Poisson Distribution, n=30",xlab="") 
curve(dnorm(x,mean=0,sd=1), add=TRUE)


## Real data sets

install.packages("openintro")
#Installing package of OpenInotro textbook
library(openintro)
#loading package
?openintro
?fcid
par(mfrow=c(1,1))
plot(fcid)
#Question: are male heights normally distributed?
#How to quantitatively assess such a question?
#See later...
