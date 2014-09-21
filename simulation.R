#Simulation

set.seed(2000)
lambda = 0.2
n=40

a<-  mean(rexp(n, lambda))

for (i in 1:1000){
  
a <- append(a, mean(rexp(n, lambda)))
}
length(a)

png("hist.png", width = 480, height = 480)
hist(a, main = "Histograph of means of 40 exponential distribution", 
     xlab= "mean of 40 exponential distribution", breaks=40, col="lightgreen")

``` r{}
cat("Theoretical Center(Mean)=",1/lambda,"Actual Center(Mean)=",mean(a),"\n")
```

curve(dnorm(x, mean=mean, sd=std), add= T)

x   <- seq(0,10,length=1000)
y   <- dnorm(x,mean=mean, sd=std)
plot(x,y, type="l", lwd=1)

dev.off()

mean <- mean(a)
std <- sd(a)

shapiro.test(a)
