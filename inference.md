Statistical inference Project 2: analyze the ToothGrowth data
========================================================


Author: Yangjing Long     
Date: 19.09.2014  


--------------------------------------------------------------------------
#Introduction

The goal of this project, is to analyze the ToothGrowth data in the R datasets package. 


## Pre-processing

At first, we load the ToothGrowth data and perform some basic exploratory data analyses.


```
##    len supp dose
## 1  4.2   VC  0.5
## 2 11.5   VC  0.5
## 3  7.3   VC  0.5
## 4  5.8   VC  0.5
## 5  6.4   VC  0.5
## 6 10.0   VC  0.5
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

The data set contains 3 colomns, there are no Null or NA values. len stands for Tooth length, which are numeric valuse. supp stands for supplements, there are two valuse: OJ for Orange Juice and VC for Vitamin C (VC). dose is a numeric variable representing the amount of supplement in milligrams.

I used boxplots to summarize the three dosages by tooth size, and the two supplement types by tooth size.  This exercise gave me a couple of useful hypotheses to work with for the T tests- namely whether the dosage has a significant impact and whether the dosage type is significant.

## Provide a basic summary of the data.
The output of the summary of the data is:



```
##       len       supp         dose     
##  Min.   : 4.2   OJ:30   Min.   :0.50  
##  1st Qu.:13.1   VC:30   1st Qu.:0.50  
##  Median :19.2           Median :1.00  
##  Mean   :18.8           Mean   :1.17  
##  3rd Qu.:25.3           3rd Qu.:2.00  
##  Max.   :33.9           Max.   :2.00
```

```
## The mean of Tooth length is 18.81 and its standard deviation is 7.649
```

The Mean of ToothGrowth with supp OJ is 20.66 and the Mean of ToothGrowth with supp VC is 16.96. The sd of ToothGrowth with supp OJ is 6.606, and the sd of ToothGrowth with supp VC is 8.266.

The Mean of ToothGrowth with dosage level 0.5mg is 10.61, 1mg is 19.73, 2 mg is 26.1. The sd of the ToothGrowth with the correspondeing dosage level are 4.5, 4.415, 3.774.

## Confidence intervals and hypothesis tests

The goal of this section is to use confidence intervals and hypothesis tests to compare tooth growth by supp and dose. 

We compare the impact of ToothGrowth lengh with difference of two supplement groups OJ and VS in dosage levals of 0.5, 1, 2. We belive that using two sample test makes more sense, but for test, I aslo did 1 sample test. The 95% confidence intervals of the difference are given for each tests. For convience, all the 0 hypethesis we made is that the two groups are different, even though base on the boxplot, for the case of dose 2, we should assume that OJ and VC for the toothgrowth are similar. Our results of the test is as follows.



```
## t-test for dose = 0.5
```

```
## [1] 3.169 7.331
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = 2.979, df = 9, p-value = 0.01547
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  1.263 9.237
## sample estimates:
## mean of x 
##      5.25
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = -3.17, df = 14.97, p-value = 0.006359
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -8.781 -1.719
## sample estimates:
## mean of x mean of y 
##      7.98     13.23
```


```
## t-test for dose = 1
```

```
## [1] 3.853 8.007
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = 3.372, df = 9, p-value = 0.008229
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  1.952 9.908
## sample estimates:
## mean of x 
##      5.93
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = -4.033, df = 15.36, p-value = 0.001038
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -9.058 -2.802
## sample estimates:
## mean of x mean of y 
##     16.77     22.70
```


```
## t-test for dose = 2
```

```
## [1] -2.298  2.138
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = -0.0426, df = 9, p-value = 0.967
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -4.329  4.169
## sample estimates:
## mean of x 
##     -0.08
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = 0.0461, df = 14.04, p-value = 0.9639
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.638  3.798
## sample estimates:
## mean of x mean of y 
##     26.14     26.06
```

## Conclusions

I did the asumption of the equal variance for 1 sample t-test and the assumption of the unequal variance for 2 sample t-test. I truly believe that when in doubt, we should assume unequal variance. But I did both in this report just for excerse. And the results for both 1 sample and 2 sample are similar, just difference with values, but it does not impact the hypothesis test results.

For conclusion, the impact of OJ and VC for the toothgrowth is significantly different for dose levels 0.5 and 1. In these cases, p values are 0.006 and 0.001 (two sample t-test), we should accept 0 hypethesis. However, in the case of dose level 2, the impact of OJ and VS are similar. the p value for two sample t-test is 0.96.

And both the increse of the dose for OJ and VC has significantly impact to the toothgrowth. And for the test of the toothgrowth lengh increase for OJ and VC, from dose level increasing of 1 to 2, the p value is 0.0252, it means that it is significantly difference, when dose level increasing from 1 to 2, VC has higher impact to the teethgrowth than OJ.

# Appendix:

This Appendix includes the code which we could not include in the main report. 


```r
# t-test for OJ
g1 <- subset(ToothGrowth, supp=="OJ" & dose == 0.5)
g2<-  subset(ToothGrowth, supp=="OJ" & dose == 1)

  difference <- g1$len - g2$len
 mn <- mean(difference)
 s <- sd(difference)
 n <- lengh(difference)
```

```
## Error: could not find function "lengh"
```

```r
 mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
```

```
## [1] -12.156  -6.784
```

```r
t.test(difference)
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = -4.163, df = 9, p-value = 0.002435
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -14.615  -4.325
## sample estimates:
## mean of x 
##     -9.47
```

```r
t.test(g2$len, g1$len, paired = FALSE)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = 5.049, df = 17.7, p-value = 8.785e-05
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##   5.524 13.416
## sample estimates:
## mean of x mean of y 
##     22.70     13.23
```


```r
# t-test for OJ
g1 <- subset(ToothGrowth, supp=="OJ" & dose == 1)
g2<-  subset(ToothGrowth, supp=="OJ" & dose == 2)

  difference <- g1$len - g2$len
 mn <- mean(difference)
 s <- sd(difference)
 n <- length(difference)

 mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
```

```
## [1] -7.2709  0.5509
```

```r
t.test(difference)
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = -1.944, df = 9, p-value = 0.08384
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -7.2709  0.5509
## sample estimates:
## mean of x 
##     -3.36
```

```r
t.test(g2$len, g1$len, paired = FALSE)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = 2.248, df = 15.84, p-value = 0.0392
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  0.1886 6.5314
## sample estimates:
## mean of x mean of y 
##     26.06     22.70
```


```r
# t-test for VC
g1 <- subset(ToothGrowth, supp=="VC" & dose == 0.5)
g2<-  subset(ToothGrowth, supp=="OJ" & dose == 1)

  difference <- g1$len - g2$len
 mn <- mean(difference)
 s <- sd(difference)
 n <- length(difference)

 mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
```

```
## [1] -17.44 -12.00
```

```r
t.test(difference)
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = -12.22, df = 9, p-value = 6.574e-07
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -17.44 -12.00
## sample estimates:
## mean of x 
##    -14.72
```

```r
t.test(g2$len, g1$len, paired = FALSE)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = 9.74, df = 16.14, p-value = 3.655e-08
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  11.52 17.92
## sample estimates:
## mean of x mean of y 
##     22.70      7.98
```



```r
# t-test for VC
g1 <- subset(ToothGrowth, supp=="VC" & dose == 1)
g2<-  subset(ToothGrowth, supp=="VC" & dose == 2)

  difference <- g1$len - g2$len
 mn <- mean(difference)
 s <- sd(difference)
 n <- length(difference)

 mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
```

```
## [1] -13.335  -5.405
```

```r
t.test(difference)
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = -5.346, df = 9, p-value = 0.0004648
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -13.335  -5.405
## sample estimates:
## mean of x 
##     -9.37
```

```r
t.test(g2$len, g1$len, paired = FALSE)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  g2$len and g1$len
## t = 5.47, df = 13.6, p-value = 9.156e-05
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##   5.686 13.054
## sample estimates:
## mean of x mean of y 
##     26.14     16.77
```



```r
# t-test for VC
g1_VC <- subset(ToothGrowth, supp=="VC" & dose == 1)
g2_VC<-  subset(ToothGrowth, supp=="VC" & dose == 2)

g1_OJ <- subset(ToothGrowth, supp=="OJ" & dose == 1)
g2_OJ<-  subset(ToothGrowth, supp=="OJ" & dose == 2)

difference_VC <- g1_VC$len - g2_VC$len
difference_OJ <- g1_OJ$len - g2_OJ$len

difference <- difference_VC - difference_OJ

 mn <- mean(difference)
 s <- sd(difference)
 n <- length(difference)

 mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
```

```
## [1] -12.8834   0.8634
```

```r
t.test(difference)
```

```
## 
## 	One Sample t-test
## 
## data:  difference
## t = -1.978, df = 9, p-value = 0.07932
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -12.8834   0.8634
## sample estimates:
## mean of x 
##     -6.01
```

```r
t.test(difference_VC, difference_OJ, paired = FALSE)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  difference_VC and difference_OJ
## t = -2.441, df = 18, p-value = 0.0252
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -11.1823  -0.8377
## sample estimates:
## mean of x mean of y 
##     -9.37     -3.36
```




# Load packages
require(knitr)
require(markdown)

# Create .md, .html, and .pdf files
knit("inference.Rmd")
markdownToHTML('inference.md', 'inference.html', options=c("use_xhml"))
system("pandoc -s inference.html -o inference.pdf")
