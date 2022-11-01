
n = 5

lambda = 2

xbars = numeric(n)
for(i in 1:2000){
  dataSet = rexp(n = n, rate = lambda)
  xbars[i] = mean(dataSet)
}

zs = (xbars-(1/lambda))/((1/lambda)/sqrt(n)) 

hist(zs,prob=TRUE,ylim=c(0,.6),xlim=c(-4,4),main="Exponential Distribution, n=5",xlab="")
curve(dnorm(x,mean=0,sd=1), add=TRUE)


## --------
n = 10

lambda = 2

xbars = numeric(n)
for(i in 1:2000){
  dataSet = rexp(n = n, rate = lambda)
  xbars[i] = mean(dataSet)
}

zs = (xbars-(1/lambda))/((1/lambda)/sqrt(n)) 

hist(zs,prob=TRUE,ylim=c(0,.6),xlim=c(-4,4),main="Exponential Distribution, n=10",xlab="")
curve(dnorm(x,mean=0,sd=1), add=TRUE)

## --------
n = 20

lambda = 2

xbars = numeric(n)
for(i in 1:2000){
  dataSet = rexp(n = n, rate = lambda)
  xbars[i] = mean(dataSet)
}

zs = (xbars-(1/lambda))/((1/lambda)/sqrt(n)) 

hist(zs,prob=TRUE,ylim=c(0,.6),xlim=c(-4,4),main="Exponential Distribution, n=20",xlab="")
curve(dnorm(x,mean=0,sd=1), add=TRUE)

## --------
n = 40

lambda = 2

xbars = numeric(n)
for(i in 1:2000){
  dataSet = rexp(n = n, rate = lambda)
  xbars[i] = mean(dataSet)
}

zs = (xbars-(1/lambda))/((1/lambda)/sqrt(n)) 

hist(zs,prob=TRUE,ylim=c(0,.6),xlim=c(-4,4),main="Exponential Distribution, n=40",xlab="")
curve(dnorm(x,mean=0,sd=1), add=TRUE)
