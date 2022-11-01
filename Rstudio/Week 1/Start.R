## INTRODUCTION TO R
## '#' is used for comments. If this line is exectuted, nothing happens.


## Arithmetic
## We can execute arithmetic expressions 

exp(1)+pi
(1*4/2)^2
abs(-5)
sqrt(4)

## Assign values of variables
x = log(4)
y <- log(5)

x

##Logical statements: return TRUE id the statement is true, FALSE otherwise
## Check equation by ==
##non-equation by !=

3 == 6/3
3 != 6/3

## & stands for 'and' while | stands for 'or'

9 == 8 & is.character("a")
9 != 8 & is.character("a")


## Vectors
x = c(1,10,6)
x

y = c("I", "love", "statistics")
z = c(TRUE,TRUE,FALSE)

## Numerical vectors
numeric(5)
w = 1:3
w

## Some operations on vectors
length(x)
x / w #division coordinat-ewise

x[1] #note that vectors are are 1-indexed


## Help files for unknown functions
help(mean)
?mean

example(mean)
