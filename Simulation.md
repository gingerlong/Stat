Statistical inference Project 1: Simulation Excercise 
========================================================

Author: Yangjing Long     
Date: 19.09.2014  

--------------------------------------
# Introduction

The aim of this simulation is to investigate the distribution of averages of 40 exponential(0.2)s. A thousand simulated averages of 40 exponentials is done.

The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter.

## Pre-processing
Set seed and intialize the parameters.



## Simulation

Each time randomly generate 40 numbers with exponential distribution with parameter 0.2, for 1000 times. Record the data and plot a histgram to observe its distribution.


```r
a<-  mean(rexp(n, lambda))
  for (i in 1:1000){
  a <- append(a, mean(rexp(n, lambda)))
  }

# histgram
hist(a, main = "Histograph of means of 40 exponential distribution", 
     xlab= "mean of 40 exponential distribution", breaks=40, col="lightgreen")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


## Question 1
Show where the distribution is centered at and compare it to the theoretical center of the distribution.


```r
cat("Theoretical Center(Mean)=",1/lambda,"Actual Center(Mean)=",mean(a),"\n")
```

```
## Theoretical Center(Mean)= 5 Actual Center(Mean)= 5.029
```

## Question 2
Show how variable it is and compare it to the theoretical variance of the distribution.


```r
cat("Theoretical Variance = ",((1/lambda)^2)/n,"Actual Variance = ",var(a),"\n")
```

```
## Theoretical Variance =  0.625 Actual Variance =  0.6164
```


## Question 3
Show that the distribution is approximately normal.

Shapiro-Wilk normality test


```r
print(shapiro.test(a))
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  a
## W = 0.9905, p-value = 4.738e-06
```

```r
qqnorm(a)
qqline(a,col="red")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

## Question 4
Evaluate the coverage of the confidence interval for 1/lambda: X¯±1.96Sn.

Theoritially, assuming the data is nomally distributed, than the 95% confidential interval is caculated as required.

and test how many of my 1000 simulation means are in this interval, it turns out that 959 out of 1001 means are in this interval.


```r
interval <- 1/lambda + c(-1,1)*1.96*(1/lambda)/sqrt(n)

quant <- sum(interval[1]<= a & a <= interval[2])

library('scales')
percent(quant / 1001)
```

```
## [1] "95.8%"
```

