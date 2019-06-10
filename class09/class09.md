Class 09 Unsupervised Learning
================
Frank Lee
5/1/2019

Q1: What type of object is returned from the read.csv function? Check the right in the wisc.df data. It's a data frame.

``` r
fna.data <- "data/WisconsinCancer.csv"
wisc.df <- read.csv("WisconsinCancer.csv")
head(wisc.df)
```

    ##         id diagnosis radius_mean texture_mean perimeter_mean area_mean
    ## 1   842302         M       17.99        10.38         122.80    1001.0
    ## 2   842517         M       20.57        17.77         132.90    1326.0
    ## 3 84300903         M       19.69        21.25         130.00    1203.0
    ## 4 84348301         M       11.42        20.38          77.58     386.1
    ## 5 84358402         M       20.29        14.34         135.10    1297.0
    ## 6   843786         M       12.45        15.70          82.57     477.1
    ##   smoothness_mean compactness_mean concavity_mean concave.points_mean
    ## 1         0.11840          0.27760         0.3001             0.14710
    ## 2         0.08474          0.07864         0.0869             0.07017
    ## 3         0.10960          0.15990         0.1974             0.12790
    ## 4         0.14250          0.28390         0.2414             0.10520
    ## 5         0.10030          0.13280         0.1980             0.10430
    ## 6         0.12780          0.17000         0.1578             0.08089
    ##   symmetry_mean fractal_dimension_mean radius_se texture_se perimeter_se
    ## 1        0.2419                0.07871    1.0950     0.9053        8.589
    ## 2        0.1812                0.05667    0.5435     0.7339        3.398
    ## 3        0.2069                0.05999    0.7456     0.7869        4.585
    ## 4        0.2597                0.09744    0.4956     1.1560        3.445
    ## 5        0.1809                0.05883    0.7572     0.7813        5.438
    ## 6        0.2087                0.07613    0.3345     0.8902        2.217
    ##   area_se smoothness_se compactness_se concavity_se concave.points_se
    ## 1  153.40      0.006399        0.04904      0.05373           0.01587
    ## 2   74.08      0.005225        0.01308      0.01860           0.01340
    ## 3   94.03      0.006150        0.04006      0.03832           0.02058
    ## 4   27.23      0.009110        0.07458      0.05661           0.01867
    ## 5   94.44      0.011490        0.02461      0.05688           0.01885
    ## 6   27.19      0.007510        0.03345      0.03672           0.01137
    ##   symmetry_se fractal_dimension_se radius_worst texture_worst
    ## 1     0.03003             0.006193        25.38         17.33
    ## 2     0.01389             0.003532        24.99         23.41
    ## 3     0.02250             0.004571        23.57         25.53
    ## 4     0.05963             0.009208        14.91         26.50
    ## 5     0.01756             0.005115        22.54         16.67
    ## 6     0.02165             0.005082        15.47         23.75
    ##   perimeter_worst area_worst smoothness_worst compactness_worst
    ## 1          184.60     2019.0           0.1622            0.6656
    ## 2          158.80     1956.0           0.1238            0.1866
    ## 3          152.50     1709.0           0.1444            0.4245
    ## 4           98.87      567.7           0.2098            0.8663
    ## 5          152.20     1575.0           0.1374            0.2050
    ## 6          103.40      741.6           0.1791            0.5249
    ##   concavity_worst concave.points_worst symmetry_worst
    ## 1          0.7119               0.2654         0.4601
    ## 2          0.2416               0.1860         0.2750
    ## 3          0.4504               0.2430         0.3613
    ## 4          0.6869               0.2575         0.6638
    ## 5          0.4000               0.1625         0.2364
    ## 6          0.5355               0.1741         0.3985
    ##   fractal_dimension_worst  X
    ## 1                 0.11890 NA
    ## 2                 0.08902 NA
    ## 3                 0.08758 NA
    ## 4                 0.17300 NA
    ## 5                 0.07678 NA
    ## 6                 0.12440 NA

Q2: How many patients are there? Use nrow to count the number of rows. 569

``` r
numPatients <- nrow(wisc.df)
numCol <- ncol(wisc.df)
```

Q3: How many observations have a malignant diagnosis? 212

``` r
table(wisc.df$diagnosis)
```

    ## 
    ##   B   M 
    ## 357 212

Q4: How many variables/features in the data are suffixed with \_mean? 10

``` r
grep("_mean", colnames(wisc.df))
```

    ##  [1]  3  4  5  6  7  8  9 10 11 12

``` r
length(grep("_mean", colnames(wisc.df)))
```

    ## [1] 10

Q5: Why do you think we're using the indices 3:32 here? The first 2 columns and the last column are not numerical values, but string values.

``` r
head(wisc.df)
```

    ##         id diagnosis radius_mean texture_mean perimeter_mean area_mean
    ## 1   842302         M       17.99        10.38         122.80    1001.0
    ## 2   842517         M       20.57        17.77         132.90    1326.0
    ## 3 84300903         M       19.69        21.25         130.00    1203.0
    ## 4 84348301         M       11.42        20.38          77.58     386.1
    ## 5 84358402         M       20.29        14.34         135.10    1297.0
    ## 6   843786         M       12.45        15.70          82.57     477.1
    ##   smoothness_mean compactness_mean concavity_mean concave.points_mean
    ## 1         0.11840          0.27760         0.3001             0.14710
    ## 2         0.08474          0.07864         0.0869             0.07017
    ## 3         0.10960          0.15990         0.1974             0.12790
    ## 4         0.14250          0.28390         0.2414             0.10520
    ## 5         0.10030          0.13280         0.1980             0.10430
    ## 6         0.12780          0.17000         0.1578             0.08089
    ##   symmetry_mean fractal_dimension_mean radius_se texture_se perimeter_se
    ## 1        0.2419                0.07871    1.0950     0.9053        8.589
    ## 2        0.1812                0.05667    0.5435     0.7339        3.398
    ## 3        0.2069                0.05999    0.7456     0.7869        4.585
    ## 4        0.2597                0.09744    0.4956     1.1560        3.445
    ## 5        0.1809                0.05883    0.7572     0.7813        5.438
    ## 6        0.2087                0.07613    0.3345     0.8902        2.217
    ##   area_se smoothness_se compactness_se concavity_se concave.points_se
    ## 1  153.40      0.006399        0.04904      0.05373           0.01587
    ## 2   74.08      0.005225        0.01308      0.01860           0.01340
    ## 3   94.03      0.006150        0.04006      0.03832           0.02058
    ## 4   27.23      0.009110        0.07458      0.05661           0.01867
    ## 5   94.44      0.011490        0.02461      0.05688           0.01885
    ## 6   27.19      0.007510        0.03345      0.03672           0.01137
    ##   symmetry_se fractal_dimension_se radius_worst texture_worst
    ## 1     0.03003             0.006193        25.38         17.33
    ## 2     0.01389             0.003532        24.99         23.41
    ## 3     0.02250             0.004571        23.57         25.53
    ## 4     0.05963             0.009208        14.91         26.50
    ## 5     0.01756             0.005115        22.54         16.67
    ## 6     0.02165             0.005082        15.47         23.75
    ##   perimeter_worst area_worst smoothness_worst compactness_worst
    ## 1          184.60     2019.0           0.1622            0.6656
    ## 2          158.80     1956.0           0.1238            0.1866
    ## 3          152.50     1709.0           0.1444            0.4245
    ## 4           98.87      567.7           0.2098            0.8663
    ## 5          152.20     1575.0           0.1374            0.2050
    ## 6          103.40      741.6           0.1791            0.5249
    ##   concavity_worst concave.points_worst symmetry_worst
    ## 1          0.7119               0.2654         0.4601
    ## 2          0.2416               0.1860         0.2750
    ## 3          0.4504               0.2430         0.3613
    ## 4          0.6869               0.2575         0.6638
    ## 5          0.4000               0.1625         0.2364
    ## 6          0.5355               0.1741         0.3985
    ##   fractal_dimension_worst  X
    ## 1                 0.11890 NA
    ## 2                 0.08902 NA
    ## 3                 0.08758 NA
    ## 4                 0.17300 NA
    ## 5                 0.07678 NA
    ## 6                 0.12440 NA

``` r
View(wisc.df)
wisc.data <- as.matrix(wisc.df[,3:32])
head(wisc.data)
```

    ##      radius_mean texture_mean perimeter_mean area_mean smoothness_mean
    ## [1,]       17.99        10.38         122.80    1001.0         0.11840
    ## [2,]       20.57        17.77         132.90    1326.0         0.08474
    ## [3,]       19.69        21.25         130.00    1203.0         0.10960
    ## [4,]       11.42        20.38          77.58     386.1         0.14250
    ## [5,]       20.29        14.34         135.10    1297.0         0.10030
    ## [6,]       12.45        15.70          82.57     477.1         0.12780
    ##      compactness_mean concavity_mean concave.points_mean symmetry_mean
    ## [1,]          0.27760         0.3001             0.14710        0.2419
    ## [2,]          0.07864         0.0869             0.07017        0.1812
    ## [3,]          0.15990         0.1974             0.12790        0.2069
    ## [4,]          0.28390         0.2414             0.10520        0.2597
    ## [5,]          0.13280         0.1980             0.10430        0.1809
    ## [6,]          0.17000         0.1578             0.08089        0.2087
    ##      fractal_dimension_mean radius_se texture_se perimeter_se area_se
    ## [1,]                0.07871    1.0950     0.9053        8.589  153.40
    ## [2,]                0.05667    0.5435     0.7339        3.398   74.08
    ## [3,]                0.05999    0.7456     0.7869        4.585   94.03
    ## [4,]                0.09744    0.4956     1.1560        3.445   27.23
    ## [5,]                0.05883    0.7572     0.7813        5.438   94.44
    ## [6,]                0.07613    0.3345     0.8902        2.217   27.19
    ##      smoothness_se compactness_se concavity_se concave.points_se
    ## [1,]      0.006399        0.04904      0.05373           0.01587
    ## [2,]      0.005225        0.01308      0.01860           0.01340
    ## [3,]      0.006150        0.04006      0.03832           0.02058
    ## [4,]      0.009110        0.07458      0.05661           0.01867
    ## [5,]      0.011490        0.02461      0.05688           0.01885
    ## [6,]      0.007510        0.03345      0.03672           0.01137
    ##      symmetry_se fractal_dimension_se radius_worst texture_worst
    ## [1,]     0.03003             0.006193        25.38         17.33
    ## [2,]     0.01389             0.003532        24.99         23.41
    ## [3,]     0.02250             0.004571        23.57         25.53
    ## [4,]     0.05963             0.009208        14.91         26.50
    ## [5,]     0.01756             0.005115        22.54         16.67
    ## [6,]     0.02165             0.005082        15.47         23.75
    ##      perimeter_worst area_worst smoothness_worst compactness_worst
    ## [1,]          184.60     2019.0           0.1622            0.6656
    ## [2,]          158.80     1956.0           0.1238            0.1866
    ## [3,]          152.50     1709.0           0.1444            0.4245
    ## [4,]           98.87      567.7           0.2098            0.8663
    ## [5,]          152.20     1575.0           0.1374            0.2050
    ## [6,]          103.40      741.6           0.1791            0.5249
    ##      concavity_worst concave.points_worst symmetry_worst
    ## [1,]          0.7119               0.2654         0.4601
    ## [2,]          0.2416               0.1860         0.2750
    ## [3,]          0.4504               0.2430         0.3613
    ## [4,]          0.6869               0.2575         0.6638
    ## [5,]          0.4000               0.1625         0.2364
    ## [6,]          0.5355               0.1741         0.3985
    ##      fractal_dimension_worst
    ## [1,]                 0.11890
    ## [2,]                 0.08902
    ## [3,]                 0.08758
    ## [4,]                 0.17300
    ## [5,]                 0.07678
    ## [6,]                 0.12440

Q6. True or False? The data need to be scaled before PCA. TRUE

``` r
row.names(wisc.data) <- wisc.df$id

diagnosis <- wisc.df$diagnosis
diagnosis
```

    ##   [1] M M M M M M M M M M M M M M M M M M M B B B M M M M M M M M M M M M M
    ##  [36] M M B M M M M M M M M B M B B B B B M M B M M B B B B M B M M B B B B
    ##  [71] M B M M B M B M M B B B M M B M M M B B B M B B M M B B B M M B B B B
    ## [106] M B B M B B B B B B B B M M M B M M B B B M M B M B M M B M M B B M B
    ## [141] B M B B B B M B B B B B B B B B M B B B B M M B M B B M M B B M M B B
    ## [176] B B M B B M M M B M B M B B B M B B M M B M M M M B M M M B M B M B B
    ## [211] M B M M M M B B M M B B B M B B B B B M M B B M B B M M B M B B B B M
    ## [246] B B B B B M B M M M M M M M M M M M M M M B B B B B B M B M B B M B B
    ## [281] M B M M B B B B B B B B B B B B B M B B M B M B B B B B B B B B B B B
    ## [316] B B M B B B M B M B B B B M M M B B B B M B M B M B B B M B B B B B B
    ## [351] B M M M B B B B B B B B B B B M M B M M M B M M B B B B B M B B B B B
    ## [386] M B B B M B B M M B B B B B B M B B B B B B B M B B B B B M B B M B B
    ## [421] B B B B B B B B B B M B M M B M B B B B B M B B M B M B B M B M B B B
    ## [456] B B B B B M M B B B B B B M B B B B B B B B B B M B B B B B B B M B M
    ## [491] B B M B B B B B M M B M B M B B B B B M B B M B M B M M B B B M B B B
    ## [526] B B B B B B B B M B M M B B B B B B B B B B B B B B B B B B B B B B B
    ## [561] B B M M M M M M B
    ## Levels: B M

Now the next step is to perform principal component analysis (PCA) on wisc.data.

Do I need to scale the data before PCA? Check the col means and standard deviations.

``` r
# Find the means
# Use round to avoid scientific notation. The second input is the number of sig figs you want. 
round(colMeans(wisc.data), 1)
```

    ##             radius_mean            texture_mean          perimeter_mean 
    ##                    14.1                    19.3                    92.0 
    ##               area_mean         smoothness_mean        compactness_mean 
    ##                   654.9                     0.1                     0.1 
    ##          concavity_mean     concave.points_mean           symmetry_mean 
    ##                     0.1                     0.0                     0.2 
    ##  fractal_dimension_mean               radius_se              texture_se 
    ##                     0.1                     0.4                     1.2 
    ##            perimeter_se                 area_se           smoothness_se 
    ##                     2.9                    40.3                     0.0 
    ##          compactness_se            concavity_se       concave.points_se 
    ##                     0.0                     0.0                     0.0 
    ##             symmetry_se    fractal_dimension_se            radius_worst 
    ##                     0.0                     0.0                    16.3 
    ##           texture_worst         perimeter_worst              area_worst 
    ##                    25.7                   107.3                   880.6 
    ##        smoothness_worst       compactness_worst         concavity_worst 
    ##                     0.1                     0.3                     0.3 
    ##    concave.points_worst          symmetry_worst fractal_dimension_worst 
    ##                     0.1                     0.3                     0.1

``` r
# 1 means you apply the function across the rows
# 2 means you apply the function across the columns

# Now find the standard deviations
round(apply(wisc.data,2,sd), 1)
```

    ##             radius_mean            texture_mean          perimeter_mean 
    ##                     3.5                     4.3                    24.3 
    ##               area_mean         smoothness_mean        compactness_mean 
    ##                   351.9                     0.0                     0.1 
    ##          concavity_mean     concave.points_mean           symmetry_mean 
    ##                     0.1                     0.0                     0.0 
    ##  fractal_dimension_mean               radius_se              texture_se 
    ##                     0.0                     0.3                     0.6 
    ##            perimeter_se                 area_se           smoothness_se 
    ##                     2.0                    45.5                     0.0 
    ##          compactness_se            concavity_se       concave.points_se 
    ##                     0.0                     0.0                     0.0 
    ##             symmetry_se    fractal_dimension_se            radius_worst 
    ##                     0.0                     0.0                     4.8 
    ##           texture_worst         perimeter_worst              area_worst 
    ##                     6.1                    33.6                   569.4 
    ##        smoothness_worst       compactness_worst         concavity_worst 
    ##                     0.0                     0.2                     0.2 
    ##    concave.points_worst          symmetry_worst fractal_dimension_worst 
    ##                     0.1                     0.1                     0.0

``` r
# You could also find the means like this
round(apply(wisc.data,2, mean), 1)
```

    ##             radius_mean            texture_mean          perimeter_mean 
    ##                    14.1                    19.3                    92.0 
    ##               area_mean         smoothness_mean        compactness_mean 
    ##                   654.9                     0.1                     0.1 
    ##          concavity_mean     concave.points_mean           symmetry_mean 
    ##                     0.1                     0.0                     0.2 
    ##  fractal_dimension_mean               radius_se              texture_se 
    ##                     0.1                     0.4                     1.2 
    ##            perimeter_se                 area_se           smoothness_se 
    ##                     2.9                    40.3                     0.0 
    ##          compactness_se            concavity_se       concave.points_se 
    ##                     0.0                     0.0                     0.0 
    ##             symmetry_se    fractal_dimension_se            radius_worst 
    ##                     0.0                     0.0                    16.3 
    ##           texture_worst         perimeter_worst              area_worst 
    ##                    25.7                   107.3                   880.6 
    ##        smoothness_worst       compactness_worst         concavity_worst 
    ##                     0.1                     0.3                     0.3 
    ##    concave.points_worst          symmetry_worst fractal_dimension_worst 
    ##                     0.1                     0.3                     0.1

Based on these results, we need to scale the data because the means and sd's are quite different.

Generally (as in this case) variables are scaled to have a standard deviation of one and a mean of zero. Such scaling is particular recommended when variables are measured using different scales or when the original mean and/or standard deviation of variables is largely different.

Now, perform PCA on wisc.data by completing the following code.

``` r
wisc.pr <- prcomp(wisc.data, scale = TRUE)
summary(wisc.pr)
```

    ## Importance of components:
    ##                           PC1    PC2     PC3     PC4     PC5     PC6
    ## Standard deviation     3.6444 2.3857 1.67867 1.40735 1.28403 1.09880
    ## Proportion of Variance 0.4427 0.1897 0.09393 0.06602 0.05496 0.04025
    ## Cumulative Proportion  0.4427 0.6324 0.72636 0.79239 0.84734 0.88759
    ##                            PC7     PC8    PC9    PC10   PC11    PC12
    ## Standard deviation     0.82172 0.69037 0.6457 0.59219 0.5421 0.51104
    ## Proportion of Variance 0.02251 0.01589 0.0139 0.01169 0.0098 0.00871
    ## Cumulative Proportion  0.91010 0.92598 0.9399 0.95157 0.9614 0.97007
    ##                           PC13    PC14    PC15    PC16    PC17    PC18
    ## Standard deviation     0.49128 0.39624 0.30681 0.28260 0.24372 0.22939
    ## Proportion of Variance 0.00805 0.00523 0.00314 0.00266 0.00198 0.00175
    ## Cumulative Proportion  0.97812 0.98335 0.98649 0.98915 0.99113 0.99288
    ##                           PC19    PC20   PC21    PC22    PC23   PC24
    ## Standard deviation     0.22244 0.17652 0.1731 0.16565 0.15602 0.1344
    ## Proportion of Variance 0.00165 0.00104 0.0010 0.00091 0.00081 0.0006
    ## Cumulative Proportion  0.99453 0.99557 0.9966 0.99749 0.99830 0.9989
    ##                           PC25    PC26    PC27    PC28    PC29    PC30
    ## Standard deviation     0.12442 0.09043 0.08307 0.03987 0.02736 0.01153
    ## Proportion of Variance 0.00052 0.00027 0.00023 0.00005 0.00002 0.00000
    ## Cumulative Proportion  0.99942 0.99969 0.99992 0.99997 1.00000 1.00000

Q7. From your results, what proportion of the original variance is captured by the first principal components (PC1)? 0.4427

Q8. How many principal components (PCs) are required to describe at least 70% of the original variance in the data? 3

Q9. How many principal components (PCs) are required to describe at least 90% of the original variance in the data? 7

Now you will use some visualizations to better understand your PCA model. A common visualization for PCA results is the so-called biplot.

Q10. What stands out to you about this plot? Is it easy or difficult to understand? Why?

``` r
biplot(wisc.pr)
```

![](class09_files/figure-markdown_github/unnamed-chunk-9-1.png) It is quite crap really! This default plot is only helpful for relatively small datasets in my experience.

Q11. Generate a PC1 vs PC2 plot as described above colored by diagnosis. What do the points in this plot represent? What are the red points? Where did this coloring come from and why were these colors chosen by R?

``` r
plot(wisc.pr$x[,1], wisc.pr$x[,2], col = diagnosis, xlab = "PC1", ylab = "PC2")
```

![](class09_files/figure-markdown_github/unnamed-chunk-10-1.png) Grey = malignant, Red = benign. Each point in this plot is a patient.

Q12. Generate a similar plot for principal components 1 and 3. What do you notice about these plots?

``` r
plot(wisc.pr$x[,1], wisc.pr$x[,3], col = diagnosis, 
     xlab = "PC1", ylab = "PC3")
```

![](class09_files/figure-markdown_github/unnamed-chunk-11-1.png) Because principal component 2 explains more variance in the original data than principal component 3, you can see that the first plot has a cleaner cut separating the two subgroups.

``` r
plot(wisc.pr$x[,2], wisc.pr$x[,3], col = diagnosis, 
     xlab = "PC2", ylab = "PC3")
```

![](class09_files/figure-markdown_github/unnamed-chunk-12-1.png)

PC3 only captures 9% of the variance (based on the proportion of variance). PC1 vs. PC2 demonstrates the best plot.

Calculate the variance of each component.

``` r
pr.var <- wisc.pr$sdev^2
head(pr.var)
```

    ## [1] 13.281608  5.691355  2.817949  1.980640  1.648731  1.207357

Now look at the variance explained by each principal component divided by the total variance explained of all principal components.

``` r
pve <-  pr.var/sum(pr.var)

plot(pve, xlab = "Principal Component", 
     ylab = "Proportion of Variance Explained", 
     ylim = c(0, 1), type = "o")
```

![](class09_files/figure-markdown_github/unnamed-chunk-14-1.png)

Alternative scree plot of the same data, note data driven y-axis

``` r
barplot(pve, ylab = "Precent of Variance Explained",
     names.arg=paste0("PC",1:length(pve)), las=2, axes = FALSE)
axis(2, at=pve, labels=round(pve,2)*100 )
```

![](class09_files/figure-markdown_github/unnamed-chunk-15-1.png)

In this section we will check your understanding of the PCA results, in particular the loadings and variance explained. The loadings, represented as vectors, explain the mapping from the original features to the principal components. The principal components are naturally ordered from the most variance explained to the least variance explained.

Q13. For the first principal component, and using two significant figures , what is the component of the loading vector (i.e. wisc.pr$rotation\[,1\]) for the feature radius\_mean? -0.22

``` r
round(wisc.pr$rotation[,1], 2)
```

    ##             radius_mean            texture_mean          perimeter_mean 
    ##                   -0.22                   -0.10                   -0.23 
    ##               area_mean         smoothness_mean        compactness_mean 
    ##                   -0.22                   -0.14                   -0.24 
    ##          concavity_mean     concave.points_mean           symmetry_mean 
    ##                   -0.26                   -0.26                   -0.14 
    ##  fractal_dimension_mean               radius_se              texture_se 
    ##                   -0.06                   -0.21                   -0.02 
    ##            perimeter_se                 area_se           smoothness_se 
    ##                   -0.21                   -0.20                   -0.01 
    ##          compactness_se            concavity_se       concave.points_se 
    ##                   -0.17                   -0.15                   -0.18 
    ##             symmetry_se    fractal_dimension_se            radius_worst 
    ##                   -0.04                   -0.10                   -0.23 
    ##           texture_worst         perimeter_worst              area_worst 
    ##                   -0.10                   -0.24                   -0.22 
    ##        smoothness_worst       compactness_worst         concavity_worst 
    ##                   -0.13                   -0.21                   -0.23 
    ##    concave.points_worst          symmetry_worst fractal_dimension_worst 
    ##                   -0.25                   -0.12                   -0.13

``` r
# For the feature radius_mean:
# Access the contribution of one variable on PC1
round(wisc.pr$rotation["radius_mean",1], 2)
```

    ## [1] -0.22

Q14. For the first principal component, and using two significant figures, what is the component of the loading vector (i.e. wisc.pr$rotation\[,1\]) for the feature smoothness\_se? -0.01

``` r
# Access the contribution of one variable on PC1
round(wisc.pr$rotation["smoothness_se",1], 2)
```

    ## [1] -0.01

Q15. Which original variable contributes most to PC1? concave points\_mean

``` r
# Sort the loadings values by their absolute contribution to PC1
order <- sort(abs(wisc.pr$rotation[,1]), decreasing = TRUE)
order[1]
```

    ## concave.points_mean 
    ##           0.2608538

Hierarchal Clustering
---------------------

Scale the wisc.data and assign the result to data.scaled

``` r
data.scaled <- scale(wisc.data)
head(data.scaled)
```

    ##          radius_mean texture_mean perimeter_mean  area_mean
    ## 842302     1.0960995   -2.0715123      1.2688173  0.9835095
    ## 842517     1.8282120   -0.3533215      1.6844726  1.9070303
    ## 84300903   1.5784992    0.4557859      1.5651260  1.5575132
    ## 84348301  -0.7682333    0.2535091     -0.5921661 -0.7637917
    ## 84358402   1.7487579   -1.1508038      1.7750113  1.8246238
    ## 843786    -0.4759559   -0.8346009     -0.3868077 -0.5052059
    ##          smoothness_mean compactness_mean concavity_mean
    ## 842302         1.5670875        3.2806281     2.65054179
    ## 842517        -0.8262354       -0.4866435    -0.02382489
    ## 84300903       0.9413821        1.0519999     1.36227979
    ## 84348301       3.2806668        3.3999174     1.91421287
    ## 84358402       0.2801253        0.5388663     1.36980615
    ## 843786         2.2354545        1.2432416     0.86554001
    ##          concave.points_mean symmetry_mean fractal_dimension_mean
    ## 842302             2.5302489   2.215565542              2.2537638
    ## 842517             0.5476623   0.001391139             -0.8678888
    ## 84300903           2.0354398   0.938858720             -0.3976580
    ## 84348301           1.4504311   2.864862154              4.9066020
    ## 84358402           1.4272370  -0.009552062             -0.5619555
    ## 843786             0.8239307   1.004517928              1.8883435
    ##           radius_se texture_se perimeter_se    area_se smoothness_se
    ## 842302    2.4875451 -0.5647681    2.8305403  2.4853907    -0.2138135
    ## 842517    0.4988157 -0.8754733    0.2630955  0.7417493    -0.6048187
    ## 84300903  1.2275958 -0.7793976    0.8501802  1.1802975    -0.2967439
    ## 84348301  0.3260865 -0.1103120    0.2863415 -0.2881246     0.6890953
    ## 84358402  1.2694258 -0.7895490    1.2720701  1.1893103     1.4817634
    ## 843786   -0.2548461 -0.5921406   -0.3210217 -0.2890039     0.1562093
    ##          compactness_se concavity_se concave.points_se symmetry_se
    ## 842302       1.31570389    0.7233897        0.66023900   1.1477468
    ## 842517      -0.69231710   -0.4403926        0.25993335  -0.8047423
    ## 84300903     0.81425704    0.2128891        1.42357487   0.2368272
    ## 84348301     2.74186785    0.8187979        1.11402678   4.7285198
    ## 84358402    -0.04847723    0.8277425        1.14319885  -0.3607748
    ## 843786       0.44515196    0.1598845       -0.06906279   0.1340009
    ##          fractal_dimension_se radius_worst texture_worst perimeter_worst
    ## 842302             0.90628565    1.8850310   -1.35809849       2.3015755
    ## 842517            -0.09935632    1.8043398   -0.36887865       1.5337764
    ## 84300903           0.29330133    1.5105411   -0.02395331       1.3462906
    ## 84348301           2.04571087   -0.2812170    0.13386631      -0.2497196
    ## 84358402           0.49888916    1.2974336   -1.46548091       1.3373627
    ## 843786             0.48641784   -0.1653528   -0.31356043      -0.1149083
    ##          area_worst smoothness_worst compactness_worst concavity_worst
    ## 842302    1.9994782        1.3065367         2.6143647       2.1076718
    ## 842517    1.8888270       -0.3752817        -0.4300658      -0.1466200
    ## 84300903  1.4550043        0.5269438         1.0819801       0.8542223
    ## 84348301 -0.5495377        3.3912907         3.8899747       1.9878392
    ## 84358402  1.2196511        0.2203623        -0.3131190       0.6126397
    ## 843786   -0.2441054        2.0467119         1.7201029       1.2621327
    ##          concave.points_worst symmetry_worst fractal_dimension_worst
    ## 842302              2.2940576      2.7482041               1.9353117
    ## 842517              1.0861286     -0.2436753               0.2809428
    ## 84300903            1.9532817      1.1512420               0.2012142
    ## 84348301            2.1738732      6.0407261               4.9306719
    ## 84358402            0.7286181     -0.8675896              -0.3967505
    ## 843786              0.9050914      1.7525273               2.2398308

Calculate the (Euclidean) distances between all pairs of observations in the new scaled dataset and assign the result to data.dist.

``` r
data.dist <-dist(data.scaled)
head(data.dist)
```

    ## [1] 10.309426  6.771675 10.463467  8.663413  8.402233  9.843286

Create a hierarchical clustering model using complete linkage. Manually specify the method argument to hclust() and assign the results to wisc.hclust.

``` r
wisc.hclust <- hclust(data.dist, method = "complete")
head(wisc.hclust)
```

    ## $merge
    ##        [,1] [,2]
    ##   [1,]  -80 -363
    ##   [2,] -458 -459
    ##   [3,] -272 -391
    ##   [4,]   -7 -318
    ##   [5,]  -91 -546
    ##   [6,] -299 -478
    ##   [7,]  -75 -138
    ##   [8,] -108 -498
    ##   [9,] -426 -523
    ##  [10,] -159 -295
    ##  [11,] -212 -481
    ##  [12,] -335 -347
    ##  [13,] -134 -407
    ##  [14,] -372 -512
    ##  [15,] -368 -464
    ##  [16,]  -59 -286
    ##  [17,] -126 -365
    ##  [18,]  -99 -121
    ##  [19,]  -94    1
    ##  [20,]  -70 -326
    ##  [21,] -345 -489
    ##  [22,] -150 -482
    ##  [23,] -241 -435
    ##  [24,] -196 -455
    ##  [25,] -227 -547
    ##  [26,]  -85 -269
    ##  [27,]  -82 -216
    ##  [28,] -156 -400
    ##  [29,] -385 -476
    ##  [30,]  -50 -543
    ##  [31,] -361 -430
    ##  [32,] -375   24
    ##  [33,] -166 -279
    ##  [34,] -225 -465
    ##  [35,] -328 -429
    ##  [36,] -358 -439
    ##  [37,] -309 -310
    ##  [38,]  -17 -172
    ##  [39,] -325   17
    ##  [40,] -453 -555
    ##  [41,] -170 -484
    ##  [42,] -155 -293
    ##  [43,] -362 -495
    ##  [44,] -205 -524
    ##  [45,]  -53 -252
    ##  [46,] -421 -428
    ##  [47,] -514   13
    ##  [48,] -533   39
    ##  [49,] -207 -223
    ##  [50,] -271 -388
    ##  [51,] -262 -275
    ##  [52,] -250 -423
    ##  [53,] -396   36
    ##  [54,] -487   22
    ##  [55,] -115 -526
    ##  [56,] -144 -448
    ##  [57,] -449 -515
    ##  [58,]  -21 -222
    ##  [59,] -406 -531
    ##  [60,] -438   23
    ##  [61,] -313 -387
    ##  [62,]  -71 -366
    ##  [63,]  -20 -171
    ##  [64,] -242 -307
    ##  [65,] -188   20
    ##  [66,] -143 -339
    ##  [67,] -395 -516
    ##  [68,] -317 -351
    ##  [69,] -483   58
    ##  [70,] -189 -420
    ##  [71,]  -52 -440
    ##  [72,] -296   10
    ##  [73,] -256 -341
    ##  [74,] -132 -329
    ##  [75,] -364 -496
    ##  [76,] -105 -471
    ##  [77,]  -67  -81
    ##  [78,] -294 -311
    ##  [79,] -265    4
    ##  [80,] -228 -473
    ##  [81,] -343 -479
    ##  [82,]  -44 -224
    ##  [83,] -217 -357
    ##  [84,] -124 -454
    ##  [85,] -160 -334
    ##  [86,] -312   33
    ##  [87,] -409 -517
    ##  [88,]  -40 -436
    ##  [89,] -383 -451
    ##  [90,] -180 -327
    ##  [91,] -145 -190
    ##  [92,] -103    2
    ##  [93,] -416   67
    ##  [94,] -154 -277
    ##  [95,]    8   11
    ##  [96,]  -55   38
    ##  [97,] -520   21
    ##  [98,] -254 -445
    ##  [99,] -235 -349
    ## [100,] -544 -553
    ## [101,]  -47 -468
    ## [102,] -404    7
    ## [103,] -378 -463
    ## [104,] -100 -537
    ## [105,] -530    3
    ## [106,] -136 -491
    ## [107,]  -41 -264
    ## [108,]  -89 -201
    ## [109,]  -86 -493
    ## [110,]  -48 -513
    ## [111,] -285 -398
    ## [112,] -246 -417
    ## [113,] -142 -168
    ## [114,] -116 -545
    ## [115,] -443   90
    ## [116,]   31   68
    ## [117,] -437   28
    ## [118,] -292 -424
    ## [119,]  -11   51
    ## [120,] -412   66
    ## [121,]  -49   18
    ## [122,] -268   43
    ## [123,]  -45 -527
    ## [124,] -290 -410
    ## [125,] -280   41
    ## [126,]  -74 -497
    ## [127,]  -65  -66
    ## [128,] -528   29
    ## [129,] -141 -176
    ## [130,] -104 -535
    ## [131,] -255 -283
    ## [132,]   34   71
    ## [133,] -488 -500
    ## [134,] -122 -499
    ## [135,] -503   97
    ## [136,]  -68   12
    ## [137,]    5   30
    ## [138,] -549  136
    ## [139,] -149   73
    ## [140,] -137 -298
    ## [141,] -411  106
    ## [142,] -221 -419
    ## [143,] -348   47
    ## [144,] -477   57
    ## [145,] -316   37
    ## [146,] -342 -427
    ## [147,] -101 -386
    ## [148,]  -51   16
    ## [149,]  -58   82
    ## [150,] -321 -432
    ## [151,]  -18 -118
    ## [152,] -304 -525
    ## [153,]   45  117
    ## [154,]  -14  -92
    ## [155,] -382   32
    ## [156,]   52   63
    ## [157,]  -37 -542
    ## [158,]   26   78
    ## [159,]   44  108
    ## [160,]  -95 -178
    ## [161,] -288   50
    ## [162,] -267 -302
    ## [163,] -202   98
    ## [164,] -128 -322
    ## [165,]   64   85
    ## [166,] -305   91
    ## [167,] -300 -554
    ## [168,]   48   72
    ## [169,] -414  118
    ## [170,] -245 -434
    ## [171,]  -19 -450
    ## [172,]   40  100
    ## [173,] -125  111
    ## [174,] -247   53
    ## [175,]   74   87
    ## [176,] -131   42
    ## [177,]  -93   54
    ## [178,]  -42 -107
    ## [179,] -397  104
    ## [180,] -360  152
    ## [181,]  -96 -534
    ## [182,]  -57  131
    ## [183,] -541  150
    ## [184,]  -38 -320
    ## [185,]   15  102
    ## [186,] -244 -403
    ## [187,]   60   65
    ## [188,] -507 -532
    ## [189,]   35  165
    ## [190,] -402  121
    ## [191,]  132  177
    ## [192,] -306 -550
    ## [193,]   -8 -502
    ## [194,] -135   79
    ## [195,] -206 -379
    ## [196,] -186 -274
    ## [197,] -509   14
    ## [198,]  -90 -129
    ## [199,] -236   92
    ## [200,] -405 -494
    ## [201,] -370 -522
    ## [202,]   95  185
    ## [203,]   -3 -536
    ## [204,] -127 -185
    ## [205,] -148 -408
    ## [206,] -133 -183
    ## [207,] -446 -561
    ## [208,]   19  187
    ## [209,] -384 -475
    ## [210,] -551  148
    ## [211,]   49  120
    ## [212,]  -30  113
    ## [213,] -331  160
    ## [214,] -376   69
    ## [215,] -229 -467
    ## [216,] -548  130
    ## [217,] -238   62
    ## [218,]  -12  -35
    ## [219,] -218 -552
    ## [220,] -399  189
    ## [221,] -248 -466
    ## [222,] -233 -460
    ## [223,]  -56   70
    ## [224,] -511   61
    ## [225,]   81  105
    ## [226,] -208  164
    ## [227,] -442 -567
    ## [228,] -114  183
    ## [229,]  128  142
    ## [230,]   25   94
    ## [231,] -232  103
    ## [232,]   80  143
    ## [233,]   27  110
    ## [234,] -393  151
    ## [235,] -234 -261
    ## [236,]    6   86
    ## [237,]   46   76
    ## [238,]  153  155
    ## [239,]   88  126
    ## [240,] -374 -518
    ## [241,] -151 -350
    ## [242,] -161   83
    ## [243,] -287   89
    ## [244,]   -6   -9
    ## [245,] -210  197
    ## [246,]   93  158
    ## [247,] -164   77
    ## [248,]  -24  171
    ## [249,]  -31  -33
    ## [250,] -337  224
    ## [251,]   99  101
    ## [252,] -184 -356
    ## [253,]  -36 -371
    ## [254,]   59  140
    ## [255,] -239 -456
    ## [256,] -195 -480
    ## [257,] -381  135
    ## [258,]  190  229
    ## [259,] -112 -270
    ## [260,]  116  161
    ## [261,] -474 -558
    ## [262,]  -28 -336
    ## [263,] -209 -332
    ## [264,] -237 -340
    ## [265,]  114  159
    ## [266,] -470 -538
    ## [267,] -163 -394
    ## [268,] -249  141
    ## [269,]  122  137
    ## [270,] -111 -174
    ## [271,]  129  230
    ## [272,] -323   84
    ## [273,] -281  133
    ## [274,] -230  244
    ## [275,] -187  163
    ## [276,]  124  223
    ## [277,]  -60   55
    ## [278,] -219  181
    ## [279,]  199  269
    ## [280,] -199 -338
    ## [281,] -557  167
    ## [282,] -157  170
    ## [283,]  -34  -73
    ## [284,] -556 -560
    ## [285,]  125  168
    ## [286,]  123  204
    ## [287,]  -54  109
    ## [288,]   96  147
    ## [289,]   -2  240
    ## [290,]   56  238
    ## [291,] -355 -359
    ## [292,] -284  213
    ## [293,] -175 -308
    ## [294,]  145  260
    ## [295,]  -98  180
    ## [296,]  -62  112
    ## [297,] -197 -354
    ## [298,]  -22  -97
    ## [299,]  166  174
    ## [300,]   75  144
    ## [301,] -297  200
    ## [302,]  -16  -27
    ## [303,] -559  173
    ## [304,]  107  236
    ## [305,] -346  270
    ## [306,]  127  149
    ## [307,]  139  214
    ## [308,]  228  259
    ## [309,]  156  272
    ## [310,] -130  249
    ## [311,] -447  235
    ## [312,]    9  138
    ## [313,]  219  237
    ## [314,]  194  206
    ## [315,]  208  285
    ## [316,] -146 -508
    ## [317,]  188  265
    ## [318,] -110  216
    ## [319,]  196  251
    ## [320,] -211 -367
    ## [321,] -273 -301
    ## [322,] -119 -401
    ## [323,] -422  198
    ## [324,] -179  231
    ## [325,]  288  300
    ## [326,]  169  215
    ## [327,] -501 -519
    ## [328,]  146  209
    ## [329,]  -46 -433
    ## [330,] -282  291
    ## [331,]  157  263
    ## [332,]  210  312
    ## [333,] -303 -564
    ## [334,]  172  279
    ## [335,]  -61 -425
    ## [336,]  -29  302
    ## [337,]   -5  134
    ## [338,] -231  175
    ## [339,]  162  242
    ## [340,]  115  220
    ## [341,]  191  299
    ## [342,]  195  232
    ## [343,]  176  257
    ## [344,]  -87  154
    ## [345,]  246  276
    ## [346,] -278  275
    ## [347,]  -63 -431
    ## [348,]  262  282
    ## [349,]  -76  212
    ## [350,] -333  296
    ## [351,]  202  315
    ## [352,]  182  203
    ## [353,] -457  284
    ## [354,] -314  290
    ## [355,] -169 -257
    ## [356,] -158 -198
    ## [357,]  225  309
    ## [358,]  -32  274
    ## [359,]  211  298
    ## [360,] -182 -568
    ## [361,] -194  193
    ## [362,]  -88  280
    ## [363,]  179  207
    ## [364,]  233  306
    ## [365,] -472  192
    ## [366,] -200  286
    ## [367,] -485  307
    ## [368,]  201  264
    ## [369,]  247  295
    ## [370,]  -25 -461
    ## [371,] -263  278
    ## [372,] -102 -392
    ## [373,] -165  248
    ## [374,] -140 -276
    ## [375,]  119  325
    ## [376,] -251  333
    ## [377,]  317  318
    ## [378,]  217  289
    ## [379,]  326  363
    ## [380,]  184  301
    ## [381,] -319 -486
    ## [382,] -226  349
    ## [383,]  178  266
    ## [384,]  273  310
    ## [385,]  250  328
    ## [386,] -415  365
    ## [387,]  294  340
    ## [388,] -181 -353
    ## [389,]  258  357
    ## [390,]  292  338
    ## [391,] -106 -258
    ## [392,] -369 -504
    ## [393,]  218  253
    ## [394,]  241  335
    ## [395,] -152 -243
    ## [396,]  329  352
    ## [397,]  -15 -380
    ## [398,] -167  271
    ## [399,]  205  243
    ## [400,] -529  374
    ## [401,] -441  221
    ## [402,]  342  367
    ## [403,]  293  332
    ## [404,]  320  371
    ## [405,] -192  330
    ## [406,]  268  345
    ## [407,]  256  323
    ## [408,]  186  304
    ## [409,] -173  234
    ## [410,]  252  303
    ## [411,]  341  387
    ## [412,]  321  355
    ## [413,] -330  297
    ## [414,]  287  348
    ## [415,] -492  245
    ## [416,] -373  337
    ## [417,]  239  331
    ## [418,]  226  346
    ## [419,]  -78 -418
    ## [420,]  255  353
    ## [421,] -452 -566
    ## [422,]  -23 -352
    ## [423,] -240  311
    ## [424,] -569  222
    ## [425,] -510  361
    ## [426,] -220 -266
    ## [427,]  351  389
    ## [428,]  308  339
    ## [429,]  281  369
    ## [430,] -253  322
    ## [431,]  267  384
    ## [432,]  373  378
    ## [433,] -562  261
    ## [434,] -113 -377
    ## [435,]  227  344
    ## [436,]  334  386
    ## [437,]  343  359
    ## [438,] -344  404
    ## [439,]  366  417
    ## [440,]  -83 -203
    ## [441,]  362  370
    ## [442,] -413  313
    ## [443,]  380  403
    ## [444,]  354  427
    ## [445,]  319  398
    ## [446,]  391  409
    ## [447,]  377  437
    ## [448,]  254  429
    ## [449,] -204  425
    ## [450,] -260  336
    ## [451,]  -64 -444
    ## [452,]  314  390
    ## [453,]  -77  316
    ## [454,] -521  453
    ## [455,]  305  350
    ## [456,]  358  397
    ## [457,] -147 -215
    ## [458,] -539  372
    ## [459,] -120 -490
    ## [460,]  324  408
    ## [461,]   -1  -26
    ## [462,]  396  416
    ## [463,]  406  442
    ## [464,]  382  418
    ## [465,]  376  412
    ## [466,]  375  435
    ## [467,]  327  379
    ## [468,] -389  401
    ## [469,]  283  430
    ## [470,]  399  410
    ## [471,]  364  439
    ## [472,]  385  447
    ## [473,] -162 -565
    ## [474,]  -84 -390
    ## [475,]  -72 -177
    ## [476,] -540  395
    ## [477,]  368  388
    ## [478,] -505 -506
    ## [479,]  414  438
    ## [480,]  402  444
    ## [481,] -469  419
    ## [482,] -563  450
    ## [483,]  356  464
    ## [484,]  405  451
    ## [485,]  411  415
    ## [486,]  448  463
    ## [487,]  407  413
    ## [488,]  277  445
    ## [489,]  421  423
    ## [490,]  428  472
    ## [491,]  393  452
    ## [492,]  431  469
    ## [493,]  455  458
    ## [494,]  424  436
    ## [495,]  347  446
    ## [496,]  381  434
    ## [497,]  360  440
    ## [498,]  432  441
    ## [499,]  465  481
    ## [500,]  443  460
    ## [501,]  420  466
    ## [502,]  467  490
    ## [503,]  422  457
    ## [504,]  394  454
    ## [505,] -193  433
    ## [506,]  462  498
    ## [507,] -324  461
    ## [508,]  486  502
    ## [509,]  392  473
    ## [510,]  468  470
    ## [511,] -315  493
    ## [512,]  383  449
    ## [513,] -117 -289
    ## [514,]  487  491
    ## [515,]  479  506
    ## [516,]  459  483
    ## [517,]  400  484
    ## [518,]  -13  -43
    ## [519,] -291  475
    ## [520,]  480  488
    ## [521,] -109 -259
    ## [522,]  456  482
    ## [523,]  471  514
    ## [524,]  494  500
    ## [525,]  -10 -191
    ## [526,]  -39  501
    ## [527,]  474  499
    ## [528,]  492  495
    ## [529,]  508  520
    ## [530,] -139  503
    ## [531,]  513  517
    ## [532,]  426  489
    ## [533,]  504  511
    ## [534,]  497  521
    ## [535,] -213 -462
    ## [536,]  509  515
    ## [537,]  512  523
    ## [538,]  485  524
    ## [539,]  476  496
    ## [540,]   -4  525
    ## [541,]  507  528
    ## [542,]  510  529
    ## [543,]  516  538
    ## [544,]  532  536
    ## [545,]  -79 -123
    ## [546,]  526  543
    ## [547,]  518  527
    ## [548,]  519  539
    ## [549,]  531  533
    ## [550,]  522  537
    ## [551,]  534  547
    ## [552,]  -69 -153
    ## [553,]  530  541
    ## [554,]  542  546
    ## [555,]  477  544
    ## [556,]  478  548
    ## [557,]  550  553
    ## [558,]  505  549
    ## [559,]  554  558
    ## [560,]  551  555
    ## [561,] -214  556
    ## [562,]  557  560
    ## [563,]  540  545
    ## [564,]  559  561
    ## [565,]  552  563
    ## [566,]  562  564
    ## [567,]  565  566
    ## [568,]  535  567
    ## 
    ## $height
    ##   [1]  1.005230  1.026711  1.096132  1.100008  1.119867  1.146701  1.147702
    ##   [8]  1.209527  1.215177  1.216937  1.228931  1.268268  1.271313  1.298518
    ##  [15]  1.320791  1.324071  1.331997  1.341092  1.350120  1.356226  1.358986
    ##  [22]  1.367199  1.367246  1.367406  1.376013  1.382132  1.390225  1.392998
    ##  [29]  1.406426  1.419157  1.429975  1.436004  1.443621  1.450628  1.477401
    ##  [36]  1.485766  1.488450  1.530763  1.533372  1.534547  1.536138  1.547617
    ##  [43]  1.565400  1.569854  1.574260  1.592749  1.595827  1.598243  1.598859
    ##  [50]  1.599830  1.606257  1.609077  1.609248  1.629422  1.651875  1.652908
    ##  [57]  1.654239  1.659267  1.665912  1.666256  1.668353  1.670058  1.687105
    ##  [64]  1.695445  1.701228  1.702677  1.711957  1.723258  1.733826  1.737552
    ##  [71]  1.739122  1.742630  1.743912  1.747820  1.749839  1.751217  1.766804
    ##  [78]  1.767422  1.773438  1.773856  1.774662  1.779741  1.781768  1.787211
    ##  [85]  1.788921  1.796730  1.799357  1.807758  1.814891  1.816495  1.817372
    ##  [92]  1.821606  1.823033  1.823518  1.825508  1.826941  1.827691  1.844635
    ##  [99]  1.849461  1.853010  1.858688  1.864548  1.869756  1.871654  1.871735
    ## [106]  1.880079  1.887728  1.888468  1.890715  1.891311  1.891798  1.893887
    ## [113]  1.904939  1.909234  1.909783  1.911427  1.924116  1.926464  1.929332
    ## [120]  1.930438  1.934275  1.939516  1.944477  1.946280  1.974602  1.975521
    ## [127]  1.994537  1.999286  2.011384  2.016180  2.022058  2.029413  2.032216
    ## [134]  2.034585  2.034885  2.040434  2.044159  2.066417  2.067314  2.076174
    ## [141]  2.083890  2.084520  2.084771  2.084820  2.086478  2.089702  2.095683
    ## [148]  2.100539  2.109334  2.110946  2.113200  2.117617  2.118580  2.120169
    ## [155]  2.124586  2.125511  2.127216  2.131799  2.136624  2.142092  2.149496
    ## [162]  2.160120  2.161211  2.178885  2.179267  2.183077  2.197286  2.201076
    ## [169]  2.218892  2.219137  2.221416  2.239867  2.260189  2.269696  2.275244
    ## [176]  2.279286  2.291714  2.301881  2.301984  2.306024  2.317967  2.319906
    ## [183]  2.331793  2.344151  2.346238  2.352106  2.359622  2.361766  2.370875
    ## [190]  2.375271  2.375881  2.388371  2.391336  2.391725  2.415227  2.417728
    ## [197]  2.435423  2.437448  2.440903  2.445407  2.448525  2.448843  2.449386
    ## [204]  2.453962  2.461195  2.464110  2.464552  2.464566  2.466033  2.467459
    ## [211]  2.473961  2.473991  2.475809  2.482193  2.488075  2.491304  2.491913
    ## [218]  2.493406  2.498459  2.513145  2.515798  2.518534  2.522818  2.530981
    ## [225]  2.540393  2.545612  2.557633  2.558287  2.559306  2.573835  2.576955
    ## [232]  2.578323  2.604644  2.613944  2.625244  2.635215  2.650621  2.673002
    ## [239]  2.673349  2.673644  2.675693  2.686567  2.689533  2.692775  2.694214
    ## [246]  2.700272  2.700679  2.702083  2.705661  2.709335  2.715197  2.719637
    ## [253]  2.722153  2.728442  2.738493  2.743977  2.744633  2.749743  2.750247
    ## [260]  2.755635  2.756343  2.763187  2.765535  2.767643  2.778366  2.781427
    ## [267]  2.781566  2.787540  2.816533  2.819703  2.822625  2.837623  2.838141
    ## [274]  2.839211  2.844678  2.847168  2.847694  2.853021  2.854981  2.856284
    ## [281]  2.867143  2.877951  2.887432  2.890137  2.891428  2.893594  2.900583
    ## [288]  2.907303  2.910030  2.910749  2.933666  2.951909  2.953352  2.956051
    ## [295]  2.956285  2.958726  2.960002  2.964908  2.968782  2.976127  2.988419
    ## [302]  2.992190  2.997087  3.008613  3.020787  3.022405  3.033286  3.036721
    ## [309]  3.040079  3.052697  3.056811  3.057908  3.072395  3.078508  3.081995
    ## [316]  3.089342  3.090875  3.099869  3.106389  3.107299  3.109140  3.112594
    ## [323]  3.144882  3.157014  3.159963  3.161172  3.165804  3.168631  3.188078
    ## [330]  3.193575  3.197490  3.202124  3.213407  3.225338  3.242815  3.248166
    ## [337]  3.251482  3.285321  3.290650  3.291670  3.307359  3.313863  3.318986
    ## [344]  3.344213  3.352336  3.352402  3.354084  3.385203  3.387703  3.394852
    ## [351]  3.399973  3.441553  3.458219  3.460710  3.464911  3.466990  3.468893
    ## [358]  3.479058  3.488304  3.496882  3.562544  3.566301  3.566351  3.579221
    ## [365]  3.596959  3.613420  3.624016  3.628544  3.646693  3.664820  3.673423
    ## [372]  3.674342  3.686850  3.691358  3.708899  3.737276  3.744325  3.759048
    ## [379]  3.759811  3.777131  3.790839  3.797925  3.813528  3.822259  3.825173
    ## [386]  3.826515  3.829305  3.829965  3.830055  3.831017  3.865220  3.896544
    ## [393]  3.908290  3.913497  3.913563  3.926535  3.929015  3.930831  3.945084
    ## [400]  3.948747  3.996948  4.014483  4.044007  4.063300  4.067046  4.068461
    ## [407]  4.089437  4.100528  4.115785  4.129474  4.133223  4.145537  4.169407
    ## [414]  4.170211  4.189956  4.195116  4.197808  4.216784  4.236865  4.242305
    ## [421]  4.242779  4.262300  4.273223  4.306003  4.315373  4.329950  4.359855
    ## [428]  4.360679  4.361214  4.367910  4.376070  4.383003  4.401181  4.409695
    ## [435]  4.438712  4.448294  4.454908  4.464907  4.498061  4.593197  4.600040
    ## [442]  4.602226  4.629016  4.641532  4.670503  4.689338  4.717133  4.745250
    ## [449]  4.769450  4.776486  4.776545  4.787026  4.814873  4.826310  4.834212
    ## [456]  4.840763  4.841758  4.857763  4.869967  4.873945  4.906745  4.924646
    ## [463]  4.932525  4.940799  4.975046  4.999032  5.007626  5.009415  5.066402
    ## [470]  5.085591  5.086201  5.199286  5.218275  5.234202  5.252211  5.276128
    ## [477]  5.312915  5.356423  5.360096  5.364566  5.390627  5.392103  5.448860
    ## [484]  5.526307  5.598938  5.626338  5.626645  5.659072  5.676613  5.702048
    ## [491]  5.771244  5.805293  5.850696  5.869093  5.926479  5.991276  6.005960
    ## [498]  6.019395  6.127199  6.131595  6.242541  6.276511  6.277634  6.330833
    ## [505]  6.355761  6.454382  6.489883  6.494109  6.522278  6.529232  6.580286
    ## [512]  6.617581  6.703568  6.783072  6.817585  6.876998  6.925925  6.962872
    ## [519]  6.980563  7.023077  7.029478  7.097307  7.168460  7.258934  7.406942
    ## [526]  7.534671  7.566726  7.646292  7.827652  8.073957  8.077915  8.140482
    ## [533]  8.209893  8.213918  8.261273  8.265040  8.277593  8.360934  8.440802
    ## [540]  8.472046  8.661494  8.910477  9.446100  9.483452  9.512115  9.601947
    ## [547]  9.707425  9.995552 10.110130 10.386553 10.440182 10.466865 10.686962
    ## [554] 10.982812 11.100405 11.409358 12.306988 12.436039 12.828040 13.042946
    ## [561] 14.290358 14.959469 16.543516 16.986102 18.636581 20.243301 23.705661
    ## [568] 26.858388
    ## 
    ## $order
    ##   [1] 213 462  69 153   4  10 191  79 123  32 230   6   9  15 380 563 260
    ##  [18]  29  16  27  42 107 470 538 204 510 194   8 502  82 216  48 513  65
    ##  [35]  66  58  44 224 200  45 527 127 185  40 436  74 497  37 542 209 332
    ##  [52] 195 480 422  90 129 330 197 354  12  35  36 371 135 265   7 318 133
    ##  [69] 183 284 331  95 178 231 132 329 409 517 139  23 352 147 215 324   1
    ##  [86]  26 163 394 281 488 500 130  31  33  34  73 253 119 401  63 431 106
    ## [103] 258 173 393  18 118 182 568  83 203 109 259  13  43  84 390 251 303
    ## [120] 564 273 301 169 257 469  78 418 370 522 237 340 181 353 220 266 452
    ## [137] 566 240 447 234 261 369 504 162 565  54  86 493  28 336 157 245 434
    ## [154] 344 211 367 263 219  96 534  46 433  57 255 283   3 536 373   5 122
    ## [171] 499 165  24  19 450 238  71 366   2 374 518  88 199 338  25 461 389
    ## [188] 441 248 466 148 408 287 383 451 184 356 559 125 285 398 406 531 137
    ## [205] 298 557 300 554 164  67  81  98 360 304 525 249 411 136 491 416 395
    ## [222] 516  85 269 294 311 290 410  56 189 420 413 218 552 421 428 105 471
    ## [239] 501 519 414 292 424 229 467 397 100 537 446 561 114 541 321 432 112
    ## [256] 270 267 302 161 217 357 337 511 313 387 342 427 384 475 507 532 116
    ## [273] 545 205 524  89 201 110 548 104 535 131 155 293 381 503 520 345 489
    ## [290] 207 223 412 143 339  22  97 206 379 228 473 348 514 134 407 485 149
    ## [307] 256 341 376 483  21 222 314 144 448  53 252 437 156 400 382 375 196
    ## [324] 455 108 498 212 481 368 464 404  75 138  94  80 363 438 241 435 188
    ## [341]  70 326 280 170 484 533 325 126 365 296 159 295 402  49  99 121 528
    ## [358] 385 476 221 419 343 479 530 272 391 250 423  20 171 323 124 454  60
    ## [375] 115 526 186 274 235 349  47 468 167 141 176 227 547 154 277  39 239
    ## [392] 456 457 556 560  11 262 275  55  17 172 101 386 364 496 477 449 515
    ## [409] 442 567  87  14  92 120 490 158 198 226  76  30 142 168 208 128 322
    ## [426] 278 187 202 254 445 225 465  52 440  93 487 150 482 305 145 190 247
    ## [443] 396 358 439 316 309 310 361 430 317 351 288 271 388 443 180 327 399
    ## [460] 328 429 242 307 160 334 492 210 509 372 512 569 233 460 453 555 544
    ## [477] 553 236 103 458 459 268 362 495  91 546  50 543 415 472 306 550  38
    ## [494] 320 297 405 494 175 308 551  51  59 286 426 523 549  68 335 347 179
    ## [511] 232 378 463 244 403  41 264 299 478 312 166 279 193 562 474 558 117
    ## [528] 289 529 140 276 192 282 355 359  64 444 151 350  61 425 521  77 146
    ## [545] 508 315 346 111 174 333  62 246 417 539 102 392 214 505 506 291  72
    ## [562] 177 540 152 243 319 486 113 377
    ## 
    ## $labels
    ##   [1] "842302"    "842517"    "84300903"  "84348301"  "84358402" 
    ##   [6] "843786"    "844359"    "84458202"  "844981"    "84501001" 
    ##  [11] "845636"    "84610002"  "846226"    "846381"    "84667401" 
    ##  [16] "84799002"  "848406"    "84862001"  "849014"    "8510426"  
    ##  [21] "8510653"   "8510824"   "8511133"   "851509"    "852552"   
    ##  [26] "852631"    "852763"    "852781"    "852973"    "853201"   
    ##  [31] "853401"    "853612"    "85382601"  "854002"    "854039"   
    ##  [36] "854253"    "854268"    "854941"    "855133"    "855138"   
    ##  [41] "855167"    "855563"    "855625"    "856106"    "85638502" 
    ##  [46] "857010"    "85713702"  "85715"     "857155"    "857156"   
    ##  [51] "857343"    "857373"    "857374"    "857392"    "857438"   
    ##  [56] "85759902"  "857637"    "857793"    "857810"    "858477"   
    ##  [61] "858970"    "858981"    "858986"    "859196"    "85922302" 
    ##  [66] "859283"    "859464"    "859465"    "859471"    "859487"   
    ##  [71] "859575"    "859711"    "859717"    "859983"    "8610175"  
    ##  [76] "8610404"   "8610629"   "8610637"   "8610862"   "8610908"  
    ##  [81] "861103"    "8611161"   "8611555"   "8611792"   "8612080"  
    ##  [86] "8612399"   "86135501"  "86135502"  "861597"    "861598"   
    ##  [91] "861648"    "861799"    "861853"    "862009"    "862028"   
    ##  [96] "86208"     "86211"     "862261"    "862485"    "862548"   
    ## [101] "862717"    "862722"    "862965"    "862980"    "862989"   
    ## [106] "863030"    "863031"    "863270"    "86355"     "864018"   
    ## [111] "864033"    "86408"     "86409"     "864292"    "864496"   
    ## [116] "864685"    "864726"    "864729"    "864877"    "865128"   
    ## [121] "865137"    "86517"     "865423"    "865432"    "865468"   
    ## [126] "86561"     "866083"    "866203"    "866458"    "866674"   
    ## [131] "866714"    "8670"      "86730502"  "867387"    "867739"   
    ## [136] "868202"    "868223"    "868682"    "868826"    "868871"   
    ## [141] "868999"    "869104"    "869218"    "869224"    "869254"   
    ## [146] "869476"    "869691"    "86973701"  "86973702"  "869931"   
    ## [151] "871001501" "871001502" "8710441"   "87106"     "8711002"  
    ## [156] "8711003"   "8711202"   "8711216"   "871122"    "871149"   
    ## [161] "8711561"   "8711803"   "871201"    "8712064"   "8712289"  
    ## [166] "8712291"   "87127"     "8712729"   "8712766"   "8712853"  
    ## [171] "87139402"  "87163"     "87164"     "871641"    "871642"   
    ## [176] "872113"    "872608"    "87281702"  "873357"    "873586"   
    ## [181] "873592"    "873593"    "873701"    "873843"    "873885"   
    ## [186] "874158"    "874217"    "874373"    "874662"    "874839"   
    ## [191] "874858"    "875093"    "875099"    "875263"    "87556202" 
    ## [196] "875878"    "875938"    "877159"    "877486"    "877500"   
    ## [201] "877501"    "877989"    "878796"    "87880"     "87930"    
    ## [206] "879523"    "879804"    "879830"    "8810158"   "8810436"  
    ## [211] "881046502" "8810528"   "8810703"   "881094802" "8810955"  
    ## [216] "8810987"   "8811523"   "8811779"   "8811842"   "88119002" 
    ## [221] "8812816"   "8812818"   "8812844"   "8812877"   "8813129"  
    ## [226] "88143502"  "88147101"  "88147102"  "88147202"  "881861"   
    ## [231] "881972"    "88199202"  "88203002"  "88206102"  "882488"   
    ## [236] "88249602"  "88299702"  "883263"    "883270"    "88330202" 
    ## [241] "88350402"  "883539"    "883852"    "88411702"  "884180"   
    ## [246] "884437"    "884448"    "884626"    "88466802"  "884689"   
    ## [251] "884948"    "88518501"  "885429"    "8860702"   "886226"   
    ## [256] "886452"    "88649001"  "886776"    "887181"    "88725602" 
    ## [261] "887549"    "888264"    "888570"    "889403"    "889719"   
    ## [266] "88995002"  "8910251"   "8910499"   "8910506"   "8910720"  
    ## [271] "8910721"   "8910748"   "8910988"   "8910996"   "8911163"  
    ## [276] "8911164"   "8911230"   "8911670"   "8911800"   "8911834"  
    ## [281] "8912049"   "8912055"   "89122"     "8912280"   "8912284"  
    ## [286] "8912521"   "8912909"   "8913"      "8913049"   "89143601" 
    ## [291] "89143602"  "8915"      "891670"    "891703"    "891716"   
    ## [296] "891923"    "891936"    "892189"    "892214"    "892399"   
    ## [301] "892438"    "892604"    "89263202"  "892657"    "89296"    
    ## [306] "893061"    "89344"     "89346"     "893526"    "893548"   
    ## [311] "893783"    "89382601"  "89382602"  "893988"    "894047"   
    ## [316] "894089"    "894090"    "894326"    "894329"    "894335"   
    ## [321] "894604"    "894618"    "894855"    "895100"    "89511501" 
    ## [326] "89511502"  "89524"     "895299"    "8953902"   "895633"   
    ## [331] "896839"    "896864"    "897132"    "897137"    "897374"   
    ## [336] "89742801"  "897604"    "897630"    "897880"    "89812"    
    ## [341] "89813"     "898143"    "89827"     "898431"    "89864002" 
    ## [346] "898677"    "898678"    "89869"     "898690"    "899147"   
    ## [351] "899187"    "899667"    "899987"    "9010018"   "901011"   
    ## [356] "9010258"   "9010259"   "901028"    "9010333"   "901034301"
    ## [361] "901034302" "901041"    "9010598"   "9010872"   "9010877"  
    ## [366] "901088"    "9011494"   "9011495"   "9011971"   "9012000"  
    ## [371] "9012315"   "9012568"   "9012795"   "901288"    "9013005"  
    ## [376] "901303"    "901315"    "9013579"   "9013594"   "9013838"  
    ## [381] "901549"    "901836"    "90250"     "90251"     "902727"   
    ## [386] "90291"     "902975"    "902976"    "903011"    "90312"    
    ## [391] "90317302"  "903483"    "903507"    "903516"    "903554"   
    ## [396] "903811"    "90401601"  "90401602"  "904302"    "904357"   
    ## [401] "90439701"  "904647"    "904689"    "9047"      "904969"   
    ## [406] "904971"    "905189"    "905190"    "90524101"  "905501"   
    ## [411] "905502"    "905520"    "905539"    "905557"    "905680"   
    ## [416] "905686"    "905978"    "90602302"  "906024"    "906290"   
    ## [421] "906539"    "906564"    "906616"    "906878"    "907145"   
    ## [426] "907367"    "907409"    "90745"     "90769601"  "90769602" 
    ## [431] "907914"    "907915"    "908194"    "908445"    "908469"   
    ## [436] "908489"    "908916"    "909220"    "909231"    "909410"   
    ## [441] "909411"    "909445"    "90944601"  "909777"    "9110127"  
    ## [446] "9110720"   "9110732"   "9110944"   "911150"    "911157302"
    ## [451] "9111596"   "9111805"   "9111843"   "911201"    "911202"   
    ## [456] "9112085"   "9112366"   "9112367"   "9112594"   "9112712"  
    ## [461] "911296201" "911296202" "9113156"   "911320501" "911320502"
    ## [466] "9113239"   "9113455"   "9113514"   "9113538"   "911366"   
    ## [471] "9113778"   "9113816"   "911384"    "9113846"   "911391"   
    ## [476] "911408"    "911654"    "911673"    "911685"    "911916"   
    ## [481] "912193"    "91227"     "912519"    "912558"    "912600"   
    ## [486] "913063"    "913102"    "913505"    "913512"    "913535"   
    ## [491] "91376701"  "91376702"  "914062"    "914101"    "914102"   
    ## [496] "914333"    "914366"    "914580"    "914769"    "91485"    
    ## [501] "914862"    "91504"     "91505"     "915143"    "915186"   
    ## [506] "915276"    "91544001"  "91544002"  "915452"    "915460"   
    ## [511] "91550"     "915664"    "915691"    "915940"    "91594602" 
    ## [516] "916221"    "916799"    "916838"    "917062"    "917080"   
    ## [521] "917092"    "91762702"  "91789"     "917896"    "917897"   
    ## [526] "91805"     "91813701"  "91813702"  "918192"    "918465"   
    ## [531] "91858"     "91903901"  "91903902"  "91930402"  "919537"   
    ## [536] "919555"    "91979701"  "919812"    "921092"    "921362"   
    ## [541] "921385"    "921386"    "921644"    "922296"    "922297"   
    ## [546] "922576"    "922577"    "922840"    "923169"    "923465"   
    ## [551] "923748"    "923780"    "924084"    "924342"    "924632"   
    ## [556] "924934"    "924964"    "925236"    "925277"    "925291"   
    ## [561] "925292"    "925311"    "925622"    "926125"    "926424"   
    ## [566] "926682"    "926954"    "927241"    "92751"    
    ## 
    ## $method
    ## [1] "complete"
    ## 
    ## $call
    ## hclust(d = data.dist, method = "complete")

Q16. Using the plot() and abline() functions, what is the height at which the clustering model has 4 clusters? Height of 19

``` r
plot(wisc.hclust)
abline(h=19, col="red", lty=2)
```

![](class09_files/figure-markdown_github/unnamed-chunk-22-1.png)

``` r
wisc.hclust.clusters <- cutree(wisc.hclust, k=4)

# This does the same thing as the code above, since four clusters form at height 19
wisc.hclust.clusters <- cutree(wisc.hclust, h=19)
table(wisc.hclust.clusters)
```

    ## wisc.hclust.clusters
    ##   1   2   3   4 
    ## 177   7 383   2

``` r
table(wisc.hclust.clusters, diagnosis)
```

    ##                     diagnosis
    ## wisc.hclust.clusters   B   M
    ##                    1  12 165
    ##                    2   2   5
    ##                    3 343  40
    ##                    4   0   2

Q17. Can you find a better cluster vs diagnoses match by cutting into a different number of clusters between 2 and 10? How would you determine what better is in this context?

``` r
wisc.hclust.clusters <-  cutree(wisc.hclust, 7)
table(wisc.hclust.clusters, diagnosis)
```

    ##                     diagnosis
    ## wisc.hclust.clusters   B   M
    ##                    1  12 165
    ##                    2   0   3
    ##                    3 331  39
    ##                    4   2   0
    ##                    5  12   1
    ##                    6   0   2
    ##                    7   0   2

We can think in terms of TRUE positive, TRUE negative, FALSE positive and FALSE negative as we discussed back in an earlier class. Also recall that we discussed the concepts of sensitivity, specificity and ROC/AUC analysis.

Sensitivity refers to a test's ability to correctly detect ill patients who do have the condition. In our example here the sensitivity is the total number of samples in the cluster identified as predominantly malignant (cancerous) divided by the total number of known malignant samples.

Specificity relates to a test's ability to correctly reject healthy patients without a condition. In our example specificity is the proportion of benign (not cancerous) samples in the cluster identified as predominantly benign that are known to be benign.

Take-home. There is a judgment call here on your part: Which of your analysis procedures resulted in a clustering model with the best specificity? How about sensitivity? Which would you prefer to optimize for in this particular case?

Skipping to section 5: Combining methods (PCA + hclust)
-------------------------------------------------------

In this final section, you will put together several steps you used earlier and, in doing so, you will experience some of the creativity and open endedness that is typical in unsupervised learning.

Using the minimum number of principal components required to describe at least 90% of the variability in the data, create a hierarchical clustering model with the linkage method="ward.D2". We use Ward's criterion here because it is based on multidimensional variance like principal components analysis. Assign the results to wisc.pr.hclust.

I am going to start with the PCs that capture 90% of the original variance in the dataset (i.e. PC1 to PC7).

``` r
wisc.pr$x[,1:7]
```

    ##                    PC1           PC2          PC3          PC4
    ## 842302     -9.18475521  -1.946870030 -1.122178766  3.630536408
    ## 842517     -2.38570263   3.764859063 -0.528827374  1.117280773
    ## 84300903   -5.72885549   1.074228589 -0.551262540  0.911280840
    ## 84348301   -7.11669126 -10.266555635 -3.229947535  0.152412923
    ## 84358402   -3.93184247   1.946358977  1.388544953  2.938054169
    ## 843786     -2.37815462  -3.946456430 -2.932296681  0.940209586
    ## 844359     -2.23691506   2.687666414 -1.638471247  0.149208600
    ## 84458202   -2.14141428  -2.338186649 -0.871180715 -0.126931171
    ## 844981     -3.17213315  -3.388831138 -3.117243065 -0.600768440
    ## 84501001   -6.34616284  -7.720380945 -4.338098744 -3.372234369
    ## 845636      0.80970132   2.656937673 -0.488400053 -1.671096176
    ## 84610002   -2.64876984  -0.066509405 -1.525113359  0.051216497
    ## 846226     -8.17783882  -2.698602007  5.725193241 -1.111278747
    ## 846381     -0.34182514   0.967428026  1.715661982 -0.594479872
    ## 84667401   -4.33856172  -4.856809832 -2.813639832 -1.453278303
    ## 84799002   -4.07207318  -2.974443983 -3.122526655 -2.455909915
    ## 848406     -0.22985277   1.563382114 -0.801813642 -0.650010973
    ## 84862001   -4.41412695  -1.417423150 -2.268323145 -0.186108659
    ## 849014     -4.94435304   4.110716528 -0.314472408 -0.088128974
    ## 8510426     1.23597583   0.188049490 -0.592761930  1.594942716
    ## 8510653     1.57677384  -0.572304625 -1.799863016  1.124286473
    ## 8510824     3.55420904  -1.661487969  0.450790799  2.071941593
    ## 8511133    -4.72904972  -3.302058265 -1.465247427  2.039355666
    ## 851509     -4.20482441   5.123858059 -0.751740573 -0.861951843
    ## 852552     -4.94528075   1.542395143 -1.711687827  0.046718059
    ## 852631     -7.09232236  -2.016835734 -0.028984132  2.585675482
    ## 852763     -3.50717666  -2.169715994 -3.891122637 -1.294620549
    ## 852781     -3.06136021   1.874902631  2.579478032  0.128371462
    ## 852973     -4.00374127  -0.536769860 -2.759197831 -1.896718595
    ## 853201     -1.71380176   1.522365502  0.146058578  1.909706071
    ## 853401     -6.05411853   0.756511800 -0.348932376 -1.063281958
    ## 853612     -2.89968469  -4.001774373 -2.998823809 -0.325030387
    ## 85382601   -4.55077848  -0.337239419 -0.753637681 -0.699714306
    ## 854002     -4.98621538   1.131593223 -2.575118337 -1.216191663
    ## 854039     -2.98271631  -0.757756497 -3.490690279  0.054212589
    ## 854253     -2.76393718   0.354044421 -1.895295337 -0.533786198
    ## 854268     -1.29505925  -0.912393466 -1.574383382 -1.042249570
    ## 854941      3.74601730   1.412230504  1.730784885 -0.564945456
    ## 855133      0.99719148   3.348346731  4.301788720 -0.560716245
    ## 855138     -0.76459136  -0.885464837 -2.702540362 -0.274538185
    ## 855167      2.14906252   1.922300194 -1.179446370 -1.112219391
    ## 855563      0.09324934  -2.258764532 -1.903051997 -1.441039161
    ## 855625     -9.08001023  -2.016898441  2.139343894 -1.068304028
    ## 856106     -0.98958304  -0.984064148 -2.308702241 -0.276582144
    ## 85638502    0.29328849   0.136978564 -3.299029123 -1.008898141
    ## 857010     -5.37620991   0.134758404 -1.677366657  1.506369463
    ## 85713702    4.57790860  -1.482915508  0.042037623  0.295968708
    ## 85715      -1.69851237  -2.350203862 -3.075383081 -0.065962912
    ## 857155      2.13456708  -0.095745364 -1.491099878  1.120077655
    ## 857156      1.56610099   1.207370855 -0.368834570 -1.474331566
    ## 857343      3.53979091   1.281368110  1.017315805 -0.607621596
    ## 857373      3.15503795   1.687473796 -0.495857416  0.193841543
    ## 857374      3.44745515   0.497780720 -0.152383875  0.574980496
    ## 857392     -3.29964761   1.129943574  0.825666100  0.981853085
    ## 857438      0.67402621   2.114549137 -1.394992302 -1.042221635
    ## 85759902    2.85564577  -0.152588874  0.428557855  0.482635650
    ## 857637     -4.64465207   2.308301508 -0.728168145  0.639379104
    ## 857793     -2.17494916  -0.971261438 -1.942179421 -0.736670095
    ## 857810      3.71818738   1.786070097  1.278807604  0.115464169
    ## 858477      4.13232693  -2.401679261 -1.241865694  2.046545722
    ## 858970      2.38373822  -2.755233814  1.213018303  1.792911568
    ## 858981      2.57661610  -3.135912650  1.399049169 -0.763194998
    ## 858986     -4.75492832  -3.009032875 -0.166094576 -0.605295233
    ## 859196      2.31209785  -3.265116721  2.793766025  0.565229094
    ## 85922302   -1.69012080  -1.539322116 -1.798262954 -1.389367072
    ## 859283     -1.81071217  -0.722104815 -1.464960560 -1.197676214
    ## 859464      2.78347559  -2.308617372  0.472309720 -1.605747397
    ## 859465      3.51555502   0.657730736  0.590855071 -0.010793189
    ## 859471     -4.32619605  -9.194435552  1.491650337  0.319666023
    ## 859487      3.25841241   0.937013647  0.204949679  1.089113223
    ## 859575     -2.70221851   4.433240985  0.307075192  0.488263229
    ## 859711      0.30758513  -7.381317396  3.815728542  2.131680166
    ## 859717     -5.49886689  -0.937500513 -2.208188675 -1.522456429
    ## 859983      0.36139121  -0.119633821 -2.039161544  1.057953093
    ## 8610175     2.62766457   0.696696349 -0.583428281  0.337884296
    ## 8610404    -1.42691206   1.965372092  1.110961327  0.752248984
    ## 8610629     0.83378424  -1.963876860  0.789737653  3.434609101
    ## 8610637    -6.22541880  -0.919260690  0.089748341  2.536926544
    ## 8610862   -11.65845644  -4.744442593  2.004115633  0.318768543
    ## 8610908     2.01980045   0.254675746 -0.647302452  0.059199217
    ## 861103      1.63694460  -1.714440587  0.433824539 -1.526622964
    ## 8611161    -1.16643527  -2.512305286 -1.904043397  0.637750373
    ## 8611555   -10.75977535   2.255997858  0.038801648 -0.389043228
    ## 8611792    -5.03038488  -0.773728357  2.679979922 -1.665039071
    ## 8612080     2.17255269  -0.496441169 -0.948257444  0.207037052
    ## 8612399    -3.28534463   1.666770480  0.146802675  0.437108401
    ## 86135501   -0.60707378  -0.162071919  1.635935419 -1.113531850
    ## 86135502   -3.58041324   2.204721916 -1.703037100 -0.800589442
    ## 861597      0.93333687  -0.926885919 -0.040128345 -1.352209082
    ## 861598     -1.25849730  -1.014684255 -0.080521995  2.049531496
    ## 861648      1.58686770   1.618232954  0.309726682 -1.091038889
    ## 861799     -0.25227559   0.530884425  0.588809736 -0.110441165
    ## 861853      2.84492835   2.891103732  0.527524677  0.598290300
    ## 862009      1.96322268   0.964308498 -0.081136715 -0.093998029
    ## 862028     -2.77342525  -0.557509977 -0.605238702  0.499390598
    ## 86208      -4.39236314   2.121640892  0.579000549 -0.776729960
    ## 86211       2.58980407  -0.213446120  1.034701089  0.661423462
    ## 862261      3.90090576  -1.189020421  1.550616806 -0.934952821
    ## 862485      2.81575365  -0.367560567 -1.350247556  1.736886645
    ## 862548     -0.61573908  -0.638349988 -0.199743121 -1.096533937
    ## 862717      0.43247968   1.390820523 -0.082646762 -1.933578565
    ## 862722      4.55102442  -3.525683788 -0.215074716  1.090925794
    ## 862965      3.44515217   1.423370040 -0.088646005 -1.709223842
    ## 862980      2.11410008  -1.847747782 -0.556184595 -0.463948150
    ## 862989      2.68898618  -1.418813334  0.968298772 -0.002857011
    ## 863030     -3.21109134  -4.043198634 -2.712997305  1.327457319
    ## 863031      0.74861266  -1.796058175 -0.567866143 -0.560006237
    ## 863270      3.15622889   1.034838878 -1.489373670 -0.592646911
    ## 86355     -13.04464395  -0.980650357  0.598286247  1.471636087
    ## 864018      2.22672053  -0.666823902 -1.090600727 -1.077353762
    ## 864033      2.49063954  -2.596401708  1.668257671  0.632929090
    ## 86408       0.10325957  -2.278139015  2.107708229 -0.351536677
    ## 86409      -3.58813694  -3.922881433  2.045207163 -0.231562584
    ## 864292      1.34776279  -3.553098748  1.730668471 -0.046949434
    ## 864496      2.50791098  -3.248461200 -1.686140767  1.188915291
    ## 864685      2.04423086  -0.304616836 -0.533369397 -0.489411120
    ## 864726      2.09522559  -3.663872062  3.629007335  1.538433194
    ## 864729     -3.10779316  -1.568009873 -2.611638159  0.617924024
    ## 864877     -4.95236801  -2.382749650 -1.933405900 -0.610304229
    ## 865128     -0.85026612   2.304707468  0.566963050 -0.043586897
    ## 865137      2.96339173  -0.371179883 -2.064716427  2.070684315
    ## 86517      -3.33120209   1.324392029  0.727373652  1.002316780
    ## 865423    -12.88327621  -2.314585873  6.323133317  1.940496559
    ## 865432      0.77006610   0.064052860 -1.133411514  2.508256103
    ## 865468      2.20057925   0.734958544  0.266845303 -0.037586447
    ## 86561       3.14064881   1.875758557 -0.669779705  0.303065257
    ## 866083      0.63831885   0.910564828 -2.140840449 -2.139033534
    ## 866203     -1.91744627   3.534971966  1.253821297  0.335703696
    ## 866458     -1.40762980  -1.303782215  0.640864876  1.885297508
    ## 866674     -4.63960895   1.480714297 -1.169651383 -1.217534223
    ## 866714      1.87581684  -1.421979452 -1.069870821  1.707830258
    ## 8670       -1.43081046   1.048681220 -1.260901861  0.532720319
    ## 86730502   -1.35143790   1.153126842 -1.208729712 -0.827378497
    ## 867387      0.70849143   1.566853657 -0.669405084  1.685780647
    ## 867739     -2.16950708   2.823776101 -0.561613332 -0.660250673
    ## 868202      1.97510247   0.419018755 -0.380240597 -1.737931013
    ## 868223      2.59850310   0.481911436  1.870726668 -0.437633248
    ## 868682      3.25514318   0.417953651 -0.691197447  0.659273518
    ## 868826     -3.77870160  -0.859625218  3.667773435  2.046019895
    ## 868871      1.99028348  -1.328186508  1.134246527  2.044634146
    ## 868999      5.01059989  -0.574194748 -0.841697543  2.167755281
    ## 869104     -1.34383800   1.273650278  0.555354894  0.574366142
    ## 869218      2.45380972  -0.897665441  0.352823033 -0.367668079
    ## 869224      1.83566648   0.090946742 -1.444010288  0.671957291
    ## 869254      4.34266862   0.892786708  0.638694049  0.425252734
    ## 869476      0.73216868  -3.698927716  0.657926113  2.234161633
    ## 869691     -2.39788795  -4.833735642 -1.027253164  0.342615376
    ## 86973701   -0.39275308  -1.082115915  2.245629588 -0.461452569
    ## 86973702    0.41196533   0.389288784 -1.044851048  1.365044596
    ## 869931      3.04724369   2.235817239 -0.469040276  0.182614048
    ## 871001501   1.44129554  -0.305601552  0.551062974  0.355761009
    ## 871001502  -0.08311297  -7.144073768 -0.059957215 -1.801496676
    ## 8710441    -7.08707084 -12.562140869  7.352238887  1.224264329
    ## 87106       3.74011364  -0.250281306 -0.097297641  1.930448497
    ## 8711002     0.96832079  -0.944113582 -0.890028129  1.095568323
    ## 8711003     2.41659356  -0.005547532 -0.797678511 -0.070829748
    ## 8711202    -4.09718264   0.378470806  1.445046044  0.701751100
    ## 8711216     0.75094226   3.067949187  1.447907672 -0.952587697
    ## 871122      3.65143365   0.674055644 -0.906188637  1.509832817
    ## 871149      4.67609710   1.102886823 -0.257081973  1.245379911
    ## 8711561     0.59725624  -1.784081072  1.480433343 -0.177715866
    ## 8711803    -3.38435289   2.908477953  3.004594027  2.825801426
    ## 871201     -6.14447970   2.015878994 -1.564766888  0.970791871
    ## 8712064     1.32386648  -1.468002337  0.847675513 -1.141761837
    ## 8712289    -5.48932277   4.162167037 -0.600732185  0.149568094
    ## 8712291     2.99476813   2.736453261 -0.161042080 -0.412806573
    ## 87127       4.38287625  -0.006866240 -0.947274735  2.795545994
    ## 8712729    -1.21256768   2.037246395  0.979834026  0.238756035
    ## 8712766    -5.06520424   1.783582969  1.172615291 -0.693122956
    ## 8712853     1.97596280   1.841159394 -0.277115927  0.549266608
    ## 87139402    2.51266554  -0.114151857 -0.496186180  2.352277364
    ## 87163       0.94665494   1.683272444 -0.350877607 -0.576703303
    ## 87164      -2.81688978  -1.263990953 -2.151251366  2.706077979
    ## 871641      3.48092345  -1.618268077  2.673117328  1.252511728
    ## 871642      4.65463399   0.222718846  1.557987797  0.510643007
    ## 872113      5.34691339  -1.025855214  0.324700222  1.367479190
    ## 872608     -1.16986842  -7.008319996  4.268106508 -0.332347396
    ## 87281702   -2.95370292  -0.705800822 -1.041419103 -0.521690540
    ## 873357      4.97132782   3.383227983  0.439451738 -1.576183104
    ## 873586      4.06045289   1.245070643  0.573972801  1.703893823
    ## 873592     -9.50430706   5.598558052 -0.636679193  0.224024081
    ## 873593     -8.99924714  -0.580520281 -3.131959404 -0.861511555
    ## 873701     -0.75821134   1.607118481 -1.513763762 -1.075114038
    ## 873843      2.65702172  -0.539461132  1.705514033  1.200694830
    ## 873885      0.38967611   0.988372689 -2.582896564 -0.783837500
    ## 874158      3.88564657  -0.815354285  1.014824328  0.824193256
    ## 874217     -0.36455538   3.571318842 -2.222023387  0.222971846
    ## 874373      2.83339783   0.398379162 -0.347139642  0.812532578
    ## 874662      3.30737348  -0.155604280  0.541002917 -0.512033374
    ## 874839      3.35435293   1.102762109  0.151956099  0.827459950
    ## 874858     -6.51738201  -8.004126824 -0.326136731 -2.769361777
    ## 875093      1.71622508   0.542688019  3.295475582 -0.087253972
    ## 875099      5.56084294   0.477427493  4.123834207 -2.350422636
    ## 875263     -1.77809695  -2.774146213 -0.941934046 -3.071649469
    ## 87556202   -2.60918908  -1.560049030 -0.217995141 -0.492342056
    ## 875878      2.81656023   0.969257722 -0.382255094  0.463382873
    ## 875938     -2.49624245  -2.276479790  1.318318594 -1.179800454
    ## 877159     -1.27590451   2.441111044  2.464148795 -0.129776372
    ## 877486     -3.47014398   2.275846405 -1.237595112 -1.112162383
    ## 877500     -1.25557034  -0.382057094 -3.834946034 -0.716289870
    ## 877501      1.47213604  -0.116787496 -0.214479145 -0.490377374
    ## 877989     -1.64801062   2.100442902 -0.974414210  0.187878371
    ## 878796     -9.02864522   0.654596849  0.221085545 -0.764058327
    ## 87880      -4.55058603  -3.083925626 -2.268408346 -2.189192919
    ## 87930       0.78050321  -0.652275325 -0.643091145  0.214279700
    ## 879523      0.22289648   0.701204504 -2.268765765  0.997753580
    ## 879804      3.45185811  -1.305789765 -0.029238791  0.330213202
    ## 879830     -0.44615183   2.785257008  0.443991604  0.471613571
    ## 8810158    -0.31416180  -2.075734301 -2.081480386 -1.067600421
    ## 8810436     2.05738166   2.470613908 -1.460433790  1.866439637
    ## 881046502  -4.80474158   3.026440019  2.741606351  0.283114502
    ## 8810528     2.99607430   0.396429212 -0.595941573 -0.207862040
    ## 8810703   -12.27421974   7.536778599 10.103533703  5.189703614
    ## 881094802  -3.36923202  -2.585550416  7.085840019 -0.367171665
    ## 8810955    -2.50656080  -2.612349885  0.206198902 -1.893080135
    ## 8810987    -1.31690973  -2.152585453 -1.785061911 -0.010160725
    ## 8811523     0.38841453  -2.274796314  0.626780574 -0.429349217
    ## 8811779     2.75450931  -1.085879226  1.705737291 -0.516377016
    ## 8811842    -4.93923501   2.845820436  0.913075404  0.334889341
    ## 88119002   -4.29429880   4.662172958 -0.006834994 -3.650173128
    ## 8812816     2.37141521   0.732757814 -1.524685925  1.851700285
    ## 8812818     0.96634003  -0.438052741 -1.446423567  1.988611655
    ## 8812844     2.97318270  -1.809381711 -0.223238842  0.391290904
    ## 8812877    -1.80166175  -0.166314618 -2.626288708 -0.643175553
    ## 8813129     2.47618073   1.417329346 -0.316254972  0.328213945
    ## 88143502    0.82531310   1.249148354  0.267725157  2.308595141
    ## 88147101    3.89127342  -0.538097276 -0.880783727  1.037886765
    ## 88147102    0.38923560   0.613875324 -1.351679911  1.174159176
    ## 88147202    1.45604019   0.201549415 -1.097912687 -2.004011649
    ## 881861     -2.75314552  -3.462726769 -2.471875866 -1.007392449
    ## 881972     -3.25439115   0.125090426 -2.893551435  0.748931137
    ## 88199202    4.01560693   1.353056834 -0.360155815 -2.633480577
    ## 88203002    3.67318128   1.290493562  0.424237023 -4.597664394
    ## 88206102   -3.31340866   3.935689268 -0.205273062 -2.116361469
    ## 882488      4.03305870  -1.161524089  0.189581014  0.939690169
    ## 88249602    2.33218128   1.347793816  0.232482459 -1.211847619
    ## 88299702   -8.39645911   4.150252991  0.046927784 -0.551357625
    ## 883263     -2.64524110   3.947699392  1.370675284  0.207636553
    ## 883270      0.68116951   1.134992457  1.232581929 -3.861102774
    ## 88330202   -3.34735048   2.152675899 -1.107968825 -4.345184373
    ## 88350402    2.22576208   1.213931555 -0.192244621  1.469984705
    ## 883539      4.47364832   1.739598699 -0.887426246  0.763980319
    ## 883852     -1.32145867  -4.785266054 -0.661952674 -1.020298051
    ## 88411702    1.84846341   1.582735509  1.262806090 -0.801397452
    ## 884180     -3.79222888   1.025330459  0.897845626 -0.759791922
    ## 884437      2.27931254  -2.075859442  2.428512195 -1.185017124
    ## 884448      3.22593164   1.171043084  0.264431658 -1.002062865
    ## 884626     -1.02499890  -2.359186109 -1.615464155  1.144955805
    ## 88466802    2.58028546  -0.728572047 -0.547660903 -2.330028998
    ## 884689      2.48369783  -0.460191483 -0.598393817  0.997839640
    ## 884948     -7.13756174   2.073018195  1.087430513  0.715703759
    ## 88518501    3.02981522   0.648897838  0.310409540  0.579772365
    ## 885429     -7.07878207  -0.527758800 -1.278861780  0.650990489
    ## 8860702    -1.31294375   1.773865017 -1.671161321  0.694009370
    ## 886226     -3.70838653   2.805008998 -1.754649703  0.903310417
    ## 886452     -0.46007427  -0.393819769 -1.003815294  1.074442849
    ## 88649001   -6.38703001   1.821491443  0.479427881 -1.694969593
    ## 886776     -5.25092469  -3.891107226 -0.833120389  1.680122512
    ## 887181     -8.72618338  -3.276993966  2.901146761 -0.276944482
    ## 88725602   -3.68807276  -1.064709236 -3.512498419 -4.769000799
    ## 887549     -3.37528098   3.368264175 -1.765224543 -2.076130195
    ## 888264      0.83947101   3.497008034  0.182323228 -1.241480335
    ## 888570     -3.28148526   0.989802279  2.552140777 -0.122718992
    ## 889403      1.90709089   3.119201237 -1.062121558 -1.061133233
    ## 889719     -1.61336234   2.472397898 -1.989384336 -0.378757895
    ## 88995002   -6.61390681   5.997998811  0.988507976 -2.884219766
    ## 8910251     1.46338831  -1.685149061  1.168877382  0.325375950
    ## 8910499     2.01038350   1.102516460  1.336847795 -1.614259260
    ## 8910506     2.28233204  -0.009485293 -0.450043551  0.295519714
    ## 8910720     0.73909276  -3.149749158  1.468565664 -0.314616789
    ## 8910721     4.50260070   3.166486414 -0.187896260  0.390816184
    ## 8910748     3.15597737  -0.409941090 -1.107842420  1.969885542
    ## 8910988    -7.66940121   3.072602737  1.480656591  0.551916238
    ## 8910996     3.63593673  -1.588189625  0.715650110  0.669795890
    ## 8911163    -0.33704893   3.141609173 -0.115619749 -1.813699425
    ## 8911164     1.27546111  -0.848306563  3.067369195  1.165472001
    ## 8911230     4.34219338   0.321694999  0.388133185  1.106173921
    ## 8911670    -0.01741547   3.456302110  0.306650981  0.475151814
    ## 8911800     3.48935577   2.631766723 -0.072124181 -0.307707020
    ## 8911834     1.86490793   0.901271186 -0.870402828  1.027910020
    ## 8912049    -4.95590744   1.339944038 -1.455772409 -1.466907423
    ## 8912055     2.46855062   0.137904923  1.793307382  1.546266616
    ## 89122      -3.78173258   1.900235409 -1.742708503  0.391939754
    ## 8912280    -2.63493731  -0.576647607 -1.992946242  0.272309546
    ## 8912284     1.37147827  -0.005800358  1.547927203  0.583925361
    ## 8912521     4.13524399   1.375298123  0.877276691 -0.059803630
    ## 8912909     0.68633639  -1.693519506  1.025310679 -0.874708540
    ## 8913        4.30833870   1.976746804 -0.251085558  1.573526614
    ## 8913049    -0.40295486  -3.720160654  4.582436940  0.215721385
    ## 89143601    3.00096526  -0.353848878  1.232930128 -0.716826045
    ## 89143602   -3.13125303  -4.269702670  5.861122345  0.596058607
    ## 8915        0.41746954   0.807865734 -1.092330348 -0.089650892
    ## 891670      1.41897459  -1.392752638 -0.836251021  1.104473313
    ## 891703      2.86806475   0.268408338 -0.468574962 -0.245287741
    ## 891716      3.36288672   0.806890637 -0.806369895  1.662223414
    ## 891923      3.31208587   1.440908382 -0.583119519  1.783361666
    ## 891936      4.76551701   0.542484530  0.893082182  1.729539559
    ## 892189      2.38378528   0.823391074  1.982219343  0.055206875
    ## 892214      2.78464581   2.530807159 -0.883257225 -0.259446372
    ## 892399      3.39085817  -0.753301131  1.770235939 -0.276430081
    ## 892438     -6.58444233   1.483557076  0.361022239  1.187401386
    ## 892604      1.45405111  -0.591422478  1.145332613  0.078947827
    ## 89263202   -7.17661843  -0.055097580  2.011148288  0.082703332
    ## 892657      3.57568917  -0.890799182  0.261257526 -0.253872371
    ## 89296       3.05434514   0.179055836  0.621226832  0.261168580
    ## 893061      3.07173303   0.305789373  1.258146621 -2.206685025
    ## 89344       3.85015201   1.523386003 -1.143503482  0.814334011
    ## 89346       5.38551771  -0.555766489  0.559577694  0.471440565
    ## 893526      4.65358767   3.062692587 -0.075942289  1.507190163
    ## 893548      4.02400169   2.540671520  0.352906609  1.513056174
    ## 893783      3.34487880   0.068502773 -0.269955756 -0.627084568
    ## 89382601    3.29694105   3.135950089  0.148761476  0.741837997
    ## 89382602    2.13452598   0.004388987 -0.055090483  1.786540911
    ## 893988      4.03446724   0.240486452 -1.326959165  2.438086999
    ## 894047      3.76210430  -4.394333943  3.946735131 -0.306998155
    ## 894089      4.86695697   2.337158334 -0.168146877  0.694278950
    ## 894090      4.74307511   1.796820963  0.169570993  1.550246788
    ## 894326     -1.89365006   2.390134936 -1.675017462  0.711402276
    ## 894329     -1.57154834  -6.503377021  2.165253786  0.030049446
    ## 894335      4.02308037   1.400973753  3.183698584  0.019535088
    ## 894604      1.29372783  -3.467757378  1.108552569  0.766005357
    ## 894618     -1.83322742   4.317723823  0.316406925  0.996312898
    ## 894855      1.80878902  -0.395858988 -1.229252510  1.275533990
    ## 895100     -7.23012357   0.035670411 -2.838568987  0.038607870
    ## 89511501    3.14288478   0.741873771 -0.861593396  0.754499772
    ## 89511502    2.88472980   0.464323069 -0.475325102  0.761631787
    ## 89524       3.14688506   1.769691255 -0.035802185  1.505914596
    ## 895299      4.62431058   1.834004631  0.064174505  0.094110332
    ## 8953902    -2.24853190   0.348229535 -1.063814825 -0.231555660
    ## 895633     -2.10594822  -1.120987593  1.773597643  0.262444379
    ## 896839     -1.78437991   0.268984957 -1.721001037  1.031779098
    ## 896864      0.52723271  -1.264758769 -0.919631937  0.429094010
    ## 897132      3.21067592  -1.102473082  1.610564041 -0.486005834
    ## 897137      4.38256677   0.760434627 -0.400245248  0.586341023
    ## 897374      3.80666840   0.909118626  0.442778081 -0.949587668
    ## 89742801   -3.31675558   1.575666422  1.359532256 -0.693532863
    ## 897604      2.39117199  -0.989160421 -0.756844005  1.553615921
    ## 897630     -4.67605183   0.967741443 -0.291016193 -1.073327945
    ## 897880      3.06499827  -1.134839030  0.374293207 -0.626302932
    ## 89812      -7.34675421   5.238014242  0.316677175  0.431659928
    ## 89813      -0.29505357  -0.226735533 -1.088458865  0.946589841
    ## 898143      1.93726491  -2.542750760 -1.000543159  0.025717223
    ## 89827       2.07535283  -1.804931340 -1.166053416  1.141225718
    ## 898431     -4.97078859   1.331400687  0.870211875 -1.290995242
    ## 89864002    2.17500311  -0.958068260 -0.234058923  1.852842435
    ## 898677      2.42941383  -3.444173357  3.453905770  0.493225969
    ## 898678      3.36500493   0.562434015 -0.192404359 -0.569877839
    ## 89869       1.20553704   1.315886497 -0.929922572  1.703291193
    ## 898690      3.32315522  -0.474753848 -0.897496041  0.812772706
    ## 899147      1.92709976  -1.460184989 -0.100554033  1.819163615
    ## 899187      4.03828183   1.355724562  0.537868401  0.833178809
    ## 899667     -6.17684877  -5.103514894  0.520682438  0.939912167
    ## 899987    -10.92468559   3.699998472 -0.890910165  2.341447352
    ## 9010018    -2.11663452  -0.296368297  0.866722769 -1.449012414
    ## 901011      3.00954689  -0.243545681  1.981989096  1.678249015
    ## 9010258     0.98178471  -0.796551513  2.367338148  0.156784682
    ## 9010259    -0.35757923  -2.125968004  0.707586438  0.184582384
    ## 901028      3.19111003   1.847526445  0.099310968 -0.022762481
    ## 9010333     2.99060189  -1.629958015  2.554470244  1.344703963
    ## 901034301   3.19110631  -0.578830133  0.489333658  0.044554975
    ## 901034302   4.58792496   2.758699732  0.979680613  0.362519486
    ## 901041      2.48373073   1.187894183  0.348470172 -1.255187427
    ## 9010598     2.39655663   0.250524355 -0.326850211 -0.277129058
    ## 9010872     0.77892982   2.122475872  0.320506876  0.079179253
    ## 9010877     3.13722800   1.486714010 -1.197824530  0.453050754
    ## 901088     -2.73260737   3.941699950 -0.017154393  0.299846924
    ## 9011494    -6.22155168   1.388887616  2.731833465 -1.092200460
    ## 9011495     2.22182078   0.356846723 -1.100713817  0.186058986
    ## 9011971    -5.30247440   6.717504288  1.484358772  1.774948969
    ## 9012000    -7.24162919   3.652255530 -0.155565119  1.225750236
    ## 9012315    -4.20352196  -1.175208822 -1.588620367 -0.977982825
    ## 9012568     2.49743889   2.016761090 -0.730631718  1.983278202
    ## 9012795    -3.63181933   1.954720962 -0.828046542  1.378539602
    ## 901288     -3.51615443   3.855214937 -1.021630135  1.382926471
    ## 9013005     2.61264945   1.101505251 -1.239645246  0.908676936
    ## 901303      0.09602363   0.129733431 -1.669994689  1.526133855
    ## 901315     -2.04305926  -6.421169887  1.273001142 -0.109645013
    ## 9013579     3.06405348   2.180177374 -0.278817341 -2.935974046
    ## 9013594     1.60217670  -0.292338995 -1.584830948  0.908898609
    ## 9013838    -3.76262144  -5.980033549 -4.876070721 -1.119887331
    ## 901549      0.92475292  -2.300457270 -1.594708683  1.674764766
    ## 901836      3.28545874  -0.201134359 -0.627204410  0.612295926
    ## 90250       1.55348525  -0.978996316  1.195507876 -1.773616381
    ## 90251       0.39842934  -2.159312724 -0.944773717  0.372153562
    ## 902727      2.29854534   0.931258175 -1.128959899  1.451099756
    ## 90291       0.54242409   1.315910048  0.994879134 -1.483570015
    ## 902975      2.05700950  -0.320153445 -0.122350756  1.019962435
    ## 902976      3.42150749   2.443368505  0.045009146  0.785450794
    ## 903011      0.47199125  -3.699574203  1.952067274  0.995440694
    ## 90312      -4.69936579   0.195783486  3.753730061 -1.003344863
    ## 90317302    3.64017727  -0.786168171 -1.161124120  2.097029762
    ## 903483      3.59152918  -2.602797030  1.850401478  0.089806410
    ## 903507     -4.14544978  -0.766814129 -0.887194062 -0.008362190
    ## 903516     -7.66539681   0.859727681 -2.151756805  0.254499442
    ## 903554      2.00861205  -0.429311811 -0.103997306 -0.160151144
    ## 903811      2.91826573   1.698977554  0.295467269 -0.413812779
    ## 90401601    0.50029759  -0.106637635 -1.027843564 -0.304616687
    ## 90401602    1.90981814   0.650821226  1.449013512  0.400350786
    ## 904302      3.78177167   0.325859645 -1.057150017  0.605475000
    ## 904357      2.70601296   0.219472629 -0.314228262  0.055204339
    ## 90439701   -6.28414409  -2.034757025 -3.179284831  0.155406788
    ## 904647      3.42775463   0.991737410 -0.731051348  1.342541631
    ## 904689      1.99962900   0.293068594  0.618659534 -0.352201845
    ## 9047        2.47111877   0.334752480 -1.481058853  0.464828450
    ## 904969      3.64405137   1.240273815  1.385405524  1.612540488
    ## 904971      2.34412427  -0.682141105  1.131738080 -0.302837266
    ## 905189      1.14199209   1.960446508 -1.239628958  1.477776286
    ## 905190      1.34966974  -0.369249002  2.484489568 -1.139714833
    ## 90524101   -2.76094145   1.077685260 -1.178586912  0.413794976
    ## 905501      1.96759233   0.175693916  0.420361503 -0.785620740
    ## 905502      2.92861019   0.494421191 -1.016176763 -1.684940447
    ## 905520      2.92380175  -0.377000536 -0.886014238 -0.115243469
    ## 905539      3.99267514  -0.959012260  0.204224433 -1.508902626
    ## 905557     -0.15500167   0.437623166 -0.461040030 -1.453254393
    ## 905680      0.93326963   2.104094210  1.431657320 -2.891717258
    ## 905686      1.92792536  -0.891682104  0.042307522 -0.558392976
    ## 905978      2.62003325  -2.499901968  2.432858840 -1.876362157
    ## 90602302   -5.99833869   0.090949196  1.709697317  0.946542059
    ## 906024      2.91930912   0.009204582 -0.900511128  1.789753754
    ## 906290      3.33900683   0.022205192  0.502858739 -1.141258134
    ## 906539      2.01314368  -0.777767778  0.125468395 -0.659155792
    ## 906564     -1.98671401  -2.314011967  1.235217081  1.768220225
    ## 906616      1.66813615  -0.861560770 -1.009417991  1.322731355
    ## 906878      0.37085180  -0.113512779 -0.997485893 -0.155233295
    ## 907145      1.84733447  -2.538995601  2.003584668  0.483946194
    ## 907367      4.69890766   0.431922385  0.005300424 -1.369403704
    ## 907409      1.28205907  -2.548666752 -0.083786622  0.770833997
    ## 90745       2.31221232  -0.401678043  0.274381769 -1.668994639
    ## 90769601    4.65498928   0.781611021  0.191953023  0.493247906
    ## 90769602    3.94000659   2.028231657  0.691127602  0.512954900
    ## 907914     -4.94550694  -3.003421435 -1.752529645 -0.671769430
    ## 907915      0.91499842  -2.476833776  0.362287911  0.261736218
    ## 908194     -4.54511193   0.815283142 -0.518299038  0.915534201
    ## 908445     -4.43843746   0.991566424  1.441051113 -0.574529073
    ## 908469      2.19305464   1.803766114 -0.434726892  0.953104432
    ## 908489     -0.66385679  -0.436476802 -2.678425146 -0.728585540
    ## 908916      2.23890605   0.454189872 -0.465118333  0.188558748
    ## 909220      2.12331215   1.193746541  0.489940891  0.854644353
    ## 909231      2.61301823   1.830449830  0.763657618 -0.822442197
    ## 909410      3.20814515   2.233177743 -0.166078298  1.129064342
    ## 909411      0.30648073  -2.183077955  0.039251705 -0.486027975
    ## 909445     -2.47018342   1.498506224  0.590933256 -2.265358224
    ## 90944601    3.45168126   2.134583340  0.196989342  1.532828161
    ## 909777      3.89709781  -0.730133530  2.134193239 -0.780486142
    ## 9110127    -0.98086448   2.208486712 -1.698424795  0.970118413
    ## 9110720     1.25614629  -1.066752885  0.259247160 -1.240660490
    ## 9110732    -3.24256054   1.776795240 -1.791577273 -2.482874793
    ## 9110944     1.55585043   1.037014643 -1.300101127  0.621126067
    ## 911150      1.24815985   1.587442008 -0.326126484 -0.924508658
    ## 911157302  -4.32784530   4.045772565 -0.192336290 -0.290357973
    ## 9111596     1.07650412  -1.802032564  1.779475879 -1.627520204
    ## 9111805    -2.50954497   2.526584455  0.797500590 -0.822950476
    ## 9111843     2.21514321  -0.029865010  0.635900610 -3.373732618
    ## 911201      1.17279871   0.474422064 -0.481147553  2.142074589
    ## 911202      2.83380799   1.017230750 -1.485323075  0.456004436
    ## 9112085     1.85545330   1.570011674  0.825756166 -3.926794310
    ## 9112366     1.32744636  -0.776412499  1.255653387 -3.782215661
    ## 9112367     2.80030738   1.664836753 -0.193847761 -2.231144249
    ## 9112594     3.17177797   2.073908798  0.074834422 -1.868185223
    ## 9112712     4.08348433   0.484283961  0.630808963 -3.399741429
    ## 911296201  -3.47243837   1.671413723  0.856073545 -1.155750941
    ## 911296202 -16.30488665   7.769016888  6.229933870  2.326026514
    ## 9113156     2.55786437   2.491852880  0.170162861 -2.107901855
    ## 911320501   2.96627878   0.068786611 -0.777727248 -0.046625788
    ## 911320502   2.75500634   1.792341696 -0.757147909  0.024097077
    ## 9113239    -1.36913518  -2.108156394 -0.852969723 -0.723132156
    ## 9113455     0.41729731  -0.116417262 -0.535671262 -0.363878888
    ## 9113514     3.83502421  -0.898388162  0.699948069 -0.219746414
    ## 9113538    -5.92575082  -1.227216861  1.720074272 -0.473165926
    ## 911366     -0.64491119  -3.422999542  0.607750202  0.234280083
    ## 9113778     2.68148698  -1.442286469  0.339105123 -0.244601788
    ## 9113816     2.03986918   0.902461858  2.840741857 -2.883294431
    ## 911384      1.39806620   1.770668244 -1.478260847  1.306959009
    ## 9113846     3.53330636   1.245758018  3.382434941 -4.661948944
    ## 911391      1.98877953  -1.897792693 -2.029212586  0.911103793
    ## 911408      1.99642872   0.206189711 -1.639882150  1.038296903
    ## 911654      0.52020039   0.972512103 -0.323850426 -0.543521127
    ## 911673      3.16958159   2.087215768 -0.977945244  0.386756799
    ## 911685      2.20077374  -1.284908734 -0.886619084  0.700486694
    ## 911916     -3.82107090  -2.303209735  0.027521977  0.669669644
    ## 912193      2.98286009   0.672747298 -0.589970772 -0.593827781
    ## 91227       2.47887396   2.361880555 -0.432234246 -0.383132558
    ## 912519      1.27099312  -0.509385643 -2.237023334  1.670906156
    ## 912558      2.23319191   1.297562775 -0.900644424  0.433712494
    ## 912600      0.05613371   0.227183495 -2.253532782  2.708217480
    ## 913063     -2.31535334  -4.385275755  1.776847691  0.968563355
    ## 913102      2.28232306   2.464672105 -0.820466562 -0.040767325
    ## 913505     -4.75043499   1.488114177 -1.252648906 -0.052540766
    ## 913512      1.72479328  -0.997300316 -0.080167877  1.063711106
    ## 913535      0.74112965   2.449879331 -1.995953713 -0.457537180
    ## 91376701    2.89176621   0.977084588 -0.804935982 -1.719266485
    ## 91376702    1.65306732   4.551659142  0.751661685  1.646873743
    ## 914062     -3.10079133   1.235066483  1.286223339  0.608113830
    ## 914101      4.06069761   0.560461075  2.174771231  1.374658804
    ## 914102      2.79087498   1.076940539  0.843799658 -1.109231547
    ## 914333      1.47362330   1.589695437  0.319710133 -0.798129881
    ## 914366      0.22919297  -1.514570755 -2.214334625  0.555081328
    ## 914580      2.55101378   0.763228924 -1.607988258  0.059875184
    ## 914769     -3.71243855   1.057755506  0.521494703  1.395773631
    ## 91485      -5.09036286   2.017432706 -0.708746074 -0.082722167
    ## 914862      0.60008810   0.837717560 -0.686437977  1.154318132
    ## 91504      -2.78794673  -3.382584454 -0.752414277 -1.332009710
    ## 91505       1.40753273  -1.504446838 -0.353584900  1.120754558
    ## 915143     -7.25279714   5.490904302  1.909245947  1.894050092
    ## 915186     -1.29772469  -7.723057325 -0.688309017  2.890184346
    ## 915276     -1.07574673  -8.287483337  0.433810751  1.952471847
    ## 91544001    1.24866183  -1.594281055 -1.355282076  0.126156474
    ## 91544002    1.25582341  -4.113567176 -0.412366931  1.053246923
    ## 915452      1.16550969   1.664229389 -0.737229323  1.760617958
    ## 915460     -4.09054331  -2.800463137 -0.506987325 -1.975580106
    ## 91550       1.88597978  -1.670721680  0.119692299  1.217144238
    ## 915664      2.76500279   2.159148972 -0.021077623  1.608860107
    ## 915691     -2.22503669  -1.939927827 -2.283594176 -0.339561903
    ## 915940      1.13058210   1.409761524 -0.564556376  1.993206904
    ## 91594602    0.73312738   1.941988438 -0.274994234 -0.337526159
    ## 916221      2.33161916  -0.789451973 -0.349735677  0.440471990
    ## 916799     -2.69485257   1.942001189 -0.959719996  0.459104689
    ## 916838     -3.37604410   2.331377578 -1.200875536  0.553126259
    ## 917062      0.19969487  -1.075413752 -0.672557052  0.627893020
    ## 917080      1.17499204  -1.010481061 -0.711142576  1.065131254
    ## 917092      1.29150016  -4.959860548  0.345622908  2.238565182
    ## 91762702   -8.62316838   3.456410638 -0.178899380  1.176129200
    ## 91789       4.42556234   0.785345015 -0.473002900 -0.696004578
    ## 917896      0.61929383  -0.635789842 -0.488421490 -0.015141135
    ## 917897      3.24945659  -1.284794677 -0.218284421  0.307537632
    ## 91805       3.34997942  -2.670950443 -1.777523046  1.388364375
    ## 91813701    0.85904712  -0.096763381 -2.811570840  0.184161855
    ## 91813702    3.15384692   0.870776432 -2.193784489  1.448593014
    ## 918192     -0.34622347  -1.539870352  2.843951628  1.908132516
    ## 918465      2.45924278  -0.600319751 -1.170435277  2.209110148
    ## 91858       1.52875558  -0.404861554  0.603933344 -0.346866279
    ## 91903901    1.77202587  -0.803503014 -2.026135257 -0.686728928
    ## 91903902    2.67808519   1.483403662 -1.740162222  1.022590841
    ## 91930402   -4.02489378   2.938844225  1.658026507  0.224969353
    ## 919537      2.13447312  -1.517245623  0.178807901 -0.500336469
    ## 919555     -5.16086993   2.380108987 -0.421906048  0.882650977
    ## 91979701   -0.53546080  -0.380380451 -0.442745212 -1.877719723
    ## 919812     -0.34282174  -3.531373815  0.069607554 -1.549307121
    ## 921092      4.19339024  -2.365311059  1.325978010 -2.037710987
    ## 921362      1.14182718  -5.594535868  1.299893249 -2.186325923
    ## 921385      1.66401100  -2.387517361  1.500928782  0.875181074
    ## 921386     -1.01082308  -1.091429307 -0.632142163 -1.756972472
    ## 921644      1.29978604   1.819814057  0.372979316 -1.846544182
    ## 922296      2.37134219   1.680097929  0.384190094 -3.014076570
    ## 922297      1.66440651   0.213774641 -0.147942249 -0.196878516
    ## 922576      1.92598353   1.136739705  0.477781900 -1.156482818
    ## 922577      4.23349159  -0.184110499 -0.326131445  0.587786142
    ## 922840      2.67551655  -2.313756961 -0.053800867  0.340150357
    ## 923169      3.83312511  -0.495813665  0.922428047 -0.551386509
    ## 923465      2.54919727  -0.228129228  1.412934778 -1.969057256
    ## 923748      4.69079604   0.766803238  1.542607509 -0.778334167
    ## 923780      2.02325691  -1.260133116  0.504482203 -1.134529125
    ## 924084      2.89340232   1.450359601  0.779859803 -2.967836815
    ## 924342      3.49912218  -1.799249342  2.764024589 -0.865545694
    ## 924632      2.15201013   0.829339088  0.564300199 -3.009108230
    ## 924934      2.05327740  -1.615038205  1.837342797 -3.110797801
    ## 924964      3.87388097  -1.083301553  1.858308794 -0.433358360
    ## 925236      4.06028949  -0.122061034  3.235925374 -3.466133119
    ## 925277      0.09858059   0.213372093  0.388587548 -1.011820230
    ## 925291      1.08841850  -1.291711328  1.428122289 -3.369171941
    ## 925292      0.48134743   0.177863190  1.031200235 -2.008512908
    ## 925311      4.86602793   2.129232607  3.411187296 -5.129474909
    ## 925622     -5.91241029  -3.479575000 -3.259923297 -3.914141413
    ## 926125     -8.73365338   0.573350185  0.896301447  0.384811315
    ## 926424     -6.43365455   3.573672989  2.457324373  1.176279049
    ## 926682     -3.79004753   3.580897052  2.086640366 -2.503824654
    ## 926954     -1.25507494   1.900624364  0.562235817 -2.087390339
    ## 927241    -10.36567336  -1.670540206 -1.875379194 -2.353959892
    ## 92751       5.47042990   0.670047220  1.489132801 -2.297135901
    ##                     PC5          PC6           PC7
    ## 842302     1.1940594778  1.410183639  2.1574715203
    ## 842517    -0.6212283647  0.028631162  0.0133463502
    ## 84300903   0.1769302185  0.540976145 -0.6675790845
    ## 84348301   2.9582754313  3.050737497  1.4286536346
    ## 84358402  -0.5462667446 -1.225416405 -0.9353895017
    ## 843786     1.0551135428 -0.450642134  0.4900139551
    ## 844359    -0.0403240371 -0.128835073 -0.3013023315
    ## 84458202   1.4261817833 -1.255934103  0.9732434974
    ## 844981     1.5209521144  0.559052820 -0.2149145974
    ## 84501001  -1.7087596141 -0.723272337  2.5176245802
    ## 845636    -0.2755690974  0.127219899  0.6244628561
    ## 84610002  -0.3316592904  0.764194227  0.6655068738
    ## 846226    -1.0425531111  2.592290301  0.9406696600
    ## 846381    -0.4675990720  1.006774257 -1.7974995418
    ## 84667401  -1.2889287269 -0.349408795  0.7422274132
    ## 84799002   0.4079831402  0.495342130  0.9142524133
    ## 848406     0.4942761390 -0.761520960 -0.0867706702
    ## 84862001   1.4226094459 -0.751827782  0.4415962916
    ## 849014     0.0566653163 -1.136688687 -0.2510619539
    ## 8510426    0.4417655273 -0.048594023 -1.2006310194
    ## 8510653    0.3949222435  0.430462491  0.3381860916
    ## 8510824    0.4903150736 -0.769391365 -0.1908707908
    ## 8511133    0.0261970715  3.020386239 -1.0062943167
    ## 851509     0.4705538779 -0.595316618 -0.0747626295
    ## 852552     1.7377012054 -0.812165001  0.7996017629
    ## 852631     2.0375470912  1.183160422  0.6013244034
    ## 852763     0.0681580703  0.786665153  0.2896641020
    ## 852781     0.1165625639 -0.906797174 -0.6452669891
    ## 852973     0.5252107652  0.192679233  0.1609885641
    ## 853201    -0.5356519265  0.036227947  0.1838685926
    ## 853401     0.7454493340  0.241867529  0.4615706215
    ## 853612     0.8546038749  1.233593969  1.9763494638
    ## 85382601   1.5471839770 -0.190839648 -0.8888020606
    ## 854002    -0.6693259394  0.267243832  1.0317090641
    ## 854039    -0.1669530505  1.000905829  0.7700944229
    ## 854253     0.8832432812  2.009267717 -0.7199616429
    ## 854268    -0.4143571251  0.568095150 -0.1425954318
    ## 854941    -0.0802687991  0.290013739 -0.8043318792
    ## 855133     0.4639645611 -1.493142577  1.2791292757
    ## 855138    -0.8097169787 -1.036438899 -0.1775681622
    ## 855167    -0.4480774771  0.928295680  0.0418357439
    ## 855563     1.7038647386 -2.120772389 -0.4965417472
    ## 855625    -0.7972299505  4.307303747  0.4337837927
    ## 856106     0.6399478981  0.242568260  0.6132339088
    ## 85638502   0.0224910920  0.110049368  0.2333988676
    ## 857010    -0.1518645822  0.423532149 -0.7874816331
    ## 85713702   0.7132249498  0.575420451  0.2230057137
    ## 85715      1.0555376469 -0.281861620 -0.1604792421
    ## 857155     0.0679774156 -0.692882067  0.1971605392
    ## 857156    -0.1725985690  0.544804546 -0.6838772921
    ## 857343     0.2194428358  0.266013819  0.4536379429
    ## 857373    -1.4386516886 -0.256313209  0.4449438979
    ## 857374     0.0522688899  0.629337135  0.0607736151
    ## 857392     1.1942122234  0.707227400  0.6479398411
    ## 857438    -0.2416042153 -0.656077776 -0.2152637743
    ## 85759902   1.5092086632  1.277739611 -0.3925629141
    ## 857637     1.1573061797 -0.178434830 -0.1853434904
    ## 857793     0.3954358798  0.461927636  0.5362098378
    ## 857810     0.5258196576  0.705119501  0.4873781448
    ## 858477     1.1646276518 -0.900267281  0.4064726785
    ## 858970     3.3352233901  2.538550035  0.7457813449
    ## 858981     2.7816479152 -0.815018482 -0.3959097935
    ## 858986    -1.1406976712 -1.218994501  0.8193030850
    ## 859196     0.3814984103  2.955682829  0.2103798445
    ## 85922302   1.2116088977 -1.242117920 -0.0057834579
    ## 859283     1.4267861675 -0.727422417 -0.5309593004
    ## 859464     1.6114402596 -1.188527693  0.1693780934
    ## 859465    -0.0205709988 -0.405353080 -0.5265287503
    ## 859471    -4.7240139158  2.213816387 -2.5787909992
    ## 859487     0.4599452518 -0.433947228 -0.8493285940
    ## 859575    -0.3721675732 -0.291543973  0.2832433298
    ## 859711    -2.7083196796 -1.638316786  2.4262266414
    ## 859717    -0.9240784393 -0.539586813  1.5624901202
    ## 859983    -0.7564437850 -0.919638446  0.6971724884
    ## 8610175   -0.4671344130  0.034838302  0.1200189004
    ## 8610404    0.5394071070 -0.994688029 -0.9081210535
    ## 8610629    2.3524809639 -0.612562561 -0.7756714142
    ## 8610637   -0.0620812262  0.682870529  1.3985754634
    ## 8610862    3.3883795562  4.876508199 -1.1544779461
    ## 8610908    0.0547996477 -0.072350138  0.0536554932
    ## 861103     1.7678261507 -1.501869476  0.1435614258
    ## 8611161   -0.2359734956  0.138012244 -0.3263920580
    ## 8611555   -1.1862447821 -2.186236690  0.0355707110
    ## 8611792    0.3113456414 -1.421297891 -0.0432176692
    ## 8612080    0.8845677371  0.882263930 -0.2550878307
    ## 8612399    1.3673667927  0.967176566 -0.1536701262
    ## 86135501   0.5403198078  0.567360307 -1.6613223577
    ## 86135502  -0.3650009185  1.560091353 -0.1983680707
    ## 861597    -0.0648850467  0.223702425  0.0769126070
    ## 861598    -0.1373994614  0.842299884 -0.1736551116
    ## 861648    -0.0537268234  0.325518164  0.2995505173
    ## 861799    -0.4283042881 -0.199459121 -1.7255946363
    ## 861853    -1.4344348070 -0.292110132  0.0957807360
    ## 862009     0.5495403920 -0.321113861 -0.5677543179
    ## 862028    -0.4994662006 -1.066707998 -1.0421552988
    ## 86208      0.3035669597  1.783555798  0.0004244298
    ## 86211      0.5402889624 -0.096852967 -0.0225249946
    ## 862261     0.7074978792 -2.351934315  1.1157841763
    ## 862485    -0.2840715251 -0.430903499  0.4844971328
    ## 862548    -0.1185853914 -0.853188272 -0.5060704070
    ## 862717     0.0344302397 -0.595802895  0.0029648840
    ## 862722     2.7559240651 -0.899700995  1.4116521142
    ## 862965     0.1065229834  0.342937555 -0.2377974400
    ## 862980     0.4744968363 -0.991047162 -0.5084776263
    ## 862989     1.2554137475  0.940750946  0.1577998775
    ## 863030     0.2214783192 -2.202856495  0.5190182681
    ## 863031     0.9322757208 -1.608771501 -0.4979118440
    ## 863270    -0.5136339075  0.359599477  0.1231328050
    ## 86355      0.5993856696  1.020860934 -0.0954075198
    ## 864018     0.2988661489 -1.439608866  0.2115695617
    ## 864033     1.1557305724 -1.095444306  0.2037178296
    ## 86408     -0.6219347413 -1.458702835 -1.0401187280
    ## 86409     -5.4604591892  0.833123888  0.4111745398
    ## 864292     0.3449474850 -1.261777184  0.1057625720
    ## 864496     0.4551865326 -1.706440486  0.5119879213
    ## 864685     0.0678524055 -1.337752701  0.4595072608
    ## 864726    -2.2345636748 -2.293687595 -0.9185965070
    ## 864729     1.1807403791 -0.767555623 -0.2067958374
    ## 864877     0.1480794337 -1.492492721  0.4264319465
    ## 865128     2.0922055990  4.975158195 -0.9917687699
    ## 865137    -0.1628943517 -0.438000429  0.0569341545
    ## 86517      0.9328861016 -0.579613971 -0.2505498519
    ## 865423     3.1574494112 -0.946220851 -1.2957391097
    ## 865432    -0.0202192366  0.180693692 -0.5030415897
    ## 865468    -2.9314571580 -0.247250211 -0.1912870373
    ## 86561     -0.4077106627 -0.226920405  0.3213445519
    ## 866083     0.4287624850  0.148751350 -0.0415938395
    ## 866203    -0.5885511025  1.467236870 -0.1445960967
    ## 866458     0.0362201276 -0.533827466 -1.2652594966
    ## 866674    -0.1779160105  0.678064911 -0.7403080258
    ## 866714     0.8837714798  0.654051923  0.3144589921
    ## 8670       0.6261456617 -0.785225256 -0.6210090246
    ## 86730502   0.9859398192  0.686370956 -0.3132321125
    ## 867387    -0.3390165106  0.246141926 -0.8388130034
    ## 867739     0.4745525764 -0.384108551 -0.1387712566
    ## 868202     0.3083668329 -0.711654240 -0.3170822284
    ## 868223    -0.0160686443 -2.039215085 -0.0047169897
    ## 868682    -0.1214593563  0.067229553 -0.4386830029
    ## 868826     2.1818702714  1.472940622 -0.5628536813
    ## 868871     0.2519061287 -1.755538141 -1.3946449979
    ## 868999     0.8812268193  0.931116209  1.1324945722
    ## 869104     0.4704353120 -0.173947054  0.5618521558
    ## 869218     1.1033160270 -0.778202592  0.1691115541
    ## 869224     0.1360791853  1.073297753  0.0989681910
    ## 869254    -0.9556015217 -0.099111239  0.3467449413
    ## 869476     0.3361716375 -0.382201396  1.3607862474
    ## 869691     2.3897699977  5.129714191 -0.7872305021
    ## 86973701  -1.6901413981  1.553852814  0.6731568921
    ## 86973702  -0.8627479982 -0.352050345 -0.8854496990
    ## 869931    -1.5744606816  0.408442142  0.4895595362
    ## 871001501  2.7005428427  1.498389276 -0.8305491921
    ## 871001502 -0.7374637239 -0.563724446  1.6243774954
    ## 8710441   -7.4838486945  0.814014293 -1.6795722858
    ## 87106      1.0426741051  0.154082267 -0.5847800143
    ## 8711002    0.6129630899  0.970037522 -0.4276196991
    ## 8711003    0.0772419138  0.864745584  0.1069268147
    ## 8711202   -0.0006644087 -1.035185529 -0.3174416715
    ## 8711216   -0.8911446262  1.296096186 -0.2213926516
    ## 871122    -0.2935538042 -0.413587977  0.1419468227
    ## 871149    -0.4142538767  0.153281267  0.9054318895
    ## 8711561    1.5878294278  0.588778074 -0.0348880820
    ## 8711803   -0.5078995524  0.588871013 -0.8310914625
    ## 871201     0.3360742118  0.343422459 -0.0707133402
    ## 8712064    0.0477797028 -1.889969783  0.0290416393
    ## 8712289   -0.6250164993  1.042121842 -0.0704226922
    ## 8712291   -0.4051896121  0.723455982 -0.4223737010
    ## 87127     -0.4453390247 -1.686598428  0.2821154593
    ## 8712729   -0.0856932721  0.626105499 -0.3516309352
    ## 8712766   -0.6480853131 -1.976653127  1.5974667481
    ## 8712853    0.2067144089 -0.283614915 -0.5536495883
    ## 87139402   0.6887689035 -0.044220048 -1.0475041547
    ## 87163      0.3412418770 -0.422267087  0.0357420256
    ## 87164      0.0400092558 -0.565776004 -0.2672482462
    ## 871641     0.5984548400 -1.342695187 -1.0265266652
    ## 871642     1.8952731945  1.346133180  0.2723286751
    ## 872113     0.9178537547  0.220842652  1.1241630693
    ## 872608    -2.9068870248 -0.388805486  0.7135687514
    ## 87281702  -1.4123928506 -0.268706635 -0.9944966018
    ## 873357    -1.0328868993  0.925966830  0.4519886400
    ## 873586    -0.6153230400 -1.507807056  0.3330008518
    ## 873592     0.4061861282 -0.835878816 -0.7140340991
    ## 873593    -0.0456818494  0.725136194  0.8451468587
    ## 873701     0.0491913464  0.094248735 -0.0607585087
    ## 873843    -2.3526717446 -1.003522807 -0.2666554566
    ## 873885    -0.7336657053  0.183576123  0.6909743372
    ## 874158     2.1316971080 -0.793026617  0.4370590422
    ## 874217    -0.7778465452  0.509781798 -0.5622981929
    ## 874373     0.0392461561 -0.634963902 -0.5973256464
    ## 874662     1.7863073596  0.695238561 -0.9098868735
    ## 874839    -0.7336137377  0.692017491 -0.1875842559
    ## 874858    -1.5975261925  3.668891109  0.4667888874
    ## 875093    -0.0840995519  1.004175357  0.9998306814
    ## 875099     1.0515357688  2.091661791  1.1663610596
    ## 875263     0.6945219915 -1.200309594  0.6282875359
    ## 87556202  -1.1034164923  0.005813478 -0.8631588057
    ## 875878    -0.5513017565  1.207398464 -0.3659380358
    ## 875938     1.8980601601 -1.698608135 -0.9030444488
    ## 877159    -2.1534113490  1.216994994 -0.0181619840
    ## 877486    -1.0083717623  0.321490348  0.1679841528
    ## 877500     0.6505837048  1.218190964  0.0219492848
    ## 877501     0.7132142476 -0.540711745 -0.1667847179
    ## 877989    -0.9160201700 -0.329410354 -0.7272507563
    ## 878796    -0.5644000271 -0.331940888 -2.6682527030
    ## 87880      3.4583122917 -1.178677385  0.0130692386
    ## 87930      0.4372951306 -0.160348396  0.1870705062
    ## 879523    -0.6459195774  0.042891323  0.3408804873
    ## 879804     1.8602747487 -0.328051695 -0.4422390617
    ## 879830     0.5295236919  1.655133960 -0.1692217695
    ## 8810158    0.2176779819  1.188797426  0.8614230375
    ## 8810436   -1.8369468233 -0.524561146 -0.0988150737
    ## 881046502 -0.1937940455  0.984117981 -1.5402069105
    ## 8810528   -0.5678601226 -0.372458536  0.4026089615
    ## 8810703    3.8491201120 -0.876727724  5.4124568722
    ## 881094802 -2.7681374358 -4.214059597 -4.0810933903
    ## 8810955    2.1228977028  2.462907510 -0.7760274006
    ## 8810987   -0.1670054272  0.568593508 -0.0375813211
    ## 8811523   -0.1192752256  0.849146479 -0.9034469827
    ## 8811779   -0.8063132292  1.783916798  0.4964759023
    ## 8811842    0.4829010175  0.355062946  0.4844374568
    ## 88119002  -0.1785458275 -0.913070016  0.6709919473
    ## 8812816   -1.1820779548 -0.857117020  0.6581421465
    ## 8812818    0.0938834761  0.292755395 -0.1124577318
    ## 8812844    1.5280262811  0.046760633  0.4462389349
    ## 8812877    0.5214235661  0.569291646  0.3320511903
    ## 8813129   -0.6614306092 -0.446353582 -0.0683543013
    ## 88143502   1.0139214702  0.900837275 -0.8016182365
    ## 88147101   0.8083176466 -0.690391433  0.5062420785
    ## 88147102  -1.7883197584  0.959424511 -0.0400455864
    ## 88147202  -1.4772623926 -0.085304557  0.6038288041
    ## 881861    -0.1549996143 -0.700792123  0.2700147671
    ## 881972     0.3525453547 -0.804236090 -1.3941815505
    ## 88199202  -0.7345986421  1.516942945  0.5780963622
    ## 88203002   0.7402578603  1.038822749  0.6763976986
    ## 88206102  -0.9691280654 -0.890030772 -0.0926084812
    ## 882488     0.5651016963 -0.806029481 -0.1591975032
    ## 88249602  -0.0515295475 -1.235632066 -0.1740702317
    ## 88299702   0.2878270868 -0.506613364  0.7184808835
    ## 883263    -1.4038189712 -0.903717776 -0.3234838610
    ## 883270    -1.4270964368 -1.290293959  0.0752679863
    ## 88330202  -0.0623295495 -0.685112901 -0.2163534283
    ## 88350402  -0.0196978073 -0.058885827 -0.6896860257
    ## 883539    -0.6046080177  1.003687888  0.2324638017
    ## 883852    -2.1481343740  0.450052375  1.1164334665
    ## 88411702  -0.7107861777  1.595210063  0.0810279083
    ## 884180     0.7571812276 -0.522270310 -1.3872740609
    ## 884437     2.8564899050 -0.998150469 -1.0888060717
    ## 884448    -0.8936812738  0.628671869 -0.2497484553
    ## 884626    -4.1408350383 -0.207346366  0.7354213374
    ## 88466802   1.8336515859  0.140043001  0.1218586500
    ## 884689     0.4299455562 -0.379287969 -0.3312609399
    ## 884948    -0.8191801992  1.143542079 -0.2892828096
    ## 88518501   0.7322406058  0.571505400 -0.0084180317
    ## 885429    -1.8521950854 -1.809707548  0.5349981047
    ## 8860702   -0.1127114795 -0.087452080 -1.1187672423
    ## 886226     0.0709235923 -0.206007291 -0.2040466544
    ## 886452     0.4271589571 -0.091326697 -0.5442092996
    ## 88649001  -0.5561879657 -0.106678519  1.3410477484
    ## 886776     0.7836374535 -1.385869456 -0.1099038534
    ## 887181     1.0609133753 -0.567192615  0.7894890717
    ## 88725602   0.8017786584 -1.140588120 -0.0039648327
    ## 887549     0.5972560049 -0.490350510 -0.8241070307
    ## 888264     0.1084218681 -0.416633188 -0.2494236088
    ## 888570    -0.3505294554  1.476085254 -0.0651095050
    ## 889403    -0.9564549675  0.328246316  0.0299221763
    ## 889719     0.4428590571 -0.244151997 -0.6667984383
    ## 88995002   1.6938934564 -0.798969733  2.2856565722
    ## 8910251    0.4644646263  1.247321486  0.1156640899
    ## 8910499   -0.6911126965  0.540714416  0.0930637439
    ## 8910506    0.8031608330  1.777454961 -0.4348833906
    ## 8910720   -0.9468561582 -0.530973923 -0.2795294819
    ## 8910721   -1.3839888843  1.137777811  0.1492725906
    ## 8910748    0.0585356134 -0.282166375 -0.0791985509
    ## 8910988   -0.8854262609 -0.082454948  1.6506700297
    ## 8910996    1.5759444757 -0.744617791 -0.3062773317
    ## 8911163   -0.0352621513 -0.715582217 -0.0550843684
    ## 8911164    2.6757698121 -1.359312667 -1.6476780917
    ## 8911230    1.5020111044  0.537319419 -0.1768614746
    ## 8911670   -0.4003842967 -0.156769522 -1.8725673919
    ## 8911800   -0.5245541387  0.233184620  0.1134728330
    ## 8911834    0.2316732520  0.915502848 -0.5682843472
    ## 8912049    0.6119216765 -1.084851887 -0.1857573608
    ## 8912055    0.6967490495  1.866934703 -0.2545557542
    ## 89122      0.3389814297  0.129569928 -1.2765834790
    ## 8912280   -1.1957159307 -0.487433642  0.0393713862
    ## 8912284   -3.0022368265 -0.001371246 -0.8124335431
    ## 8912521    0.5970712749  0.831364802  0.3673441399
    ## 8912909   -2.1727638053 -0.296527349  0.8403551858
    ## 8913      -1.9816674884  0.467795801  0.2450200664
    ## 8913049   -0.8070907499  1.824521023 -2.4466982524
    ## 89143601   1.3114083326  1.995111435 -0.4474969098
    ## 89143602  -4.1973346842  0.870504292  1.4288153440
    ## 8915      -0.2568431865  0.245372994 -0.2532806962
    ## 891670     0.3640802623  0.089387450 -0.2632432645
    ## 891703     0.5574288140  0.414086721 -0.6568800189
    ## 891716    -0.0505417655 -0.656055820 -0.1831651809
    ## 891923     0.0192555651  0.629424293 -0.0059656014
    ## 891936    -1.0008319932  0.962920440  0.2364685754
    ## 892189     0.5052838506 -0.988693412  0.5669876696
    ## 892214    -1.6463839898  0.942635213  0.7515115049
    ## 892399     1.0849483019 -0.028761357 -0.4132414468
    ## 892438     0.1208047145 -0.892012107  1.1708230247
    ## 892604    -1.0867825344  1.057049565  0.0641942198
    ## 89263202   0.6651964595  0.424230119  0.8009641178
    ## 892657     0.5990662990 -1.764318755 -0.3089463278
    ## 89296     -0.8959467593 -0.524107614  0.7087397770
    ## 893061     0.6058786167  2.355994261  0.0138795016
    ## 89344     -0.4926180820  0.287352467  1.0458411839
    ## 89346      0.3994468273  1.475361121  0.9496661823
    ## 893526    -1.2716964644  0.555206557  0.5520636775
    ## 893548    -0.6669118526 -0.096172883  0.8390301222
    ## 893783     1.1246979202  1.348798860 -0.3750342427
    ## 89382601  -0.3941040424  0.640709233 -0.1712752620
    ## 89382602  -1.2993021931 -0.063062086  0.4144020234
    ## 893988    -0.2771454326  1.692163170  0.4138464332
    ## 894047     4.7854456445  0.965426537  0.0242816003
    ## 894089    -0.8202171408 -0.823767200  0.2426330221
    ## 894090    -0.5346670358  0.790884787  0.0580936404
    ## 894326    -0.3830648490 -0.392077864 -0.5981913512
    ## 894329    -1.0524851013  1.107967691  0.2535400835
    ## 894335    -0.1794905224  0.918487309 -0.2108079992
    ## 894604    -0.2103251163 -0.839717979  0.2101197168
    ## 894618    -0.2544647520  1.653345461 -0.7582083636
    ## 894855    -0.0070705863 -1.780840926 -0.1290603427
    ## 895100     2.4525784786  2.497823419 -0.8609207404
    ## 89511501  -0.2998611546 -0.165391824  0.6992422401
    ## 89511502   0.8524662824 -0.306019363 -0.4082098698
    ## 89524     -0.3529936101 -1.161994329 -0.0940292730
    ## 895299    -0.7997554706 -0.169471369  0.8785198528
    ## 8953902    1.0036176419 -0.873783104 -0.8699189934
    ## 895633     0.9599662498  0.056799921 -0.8509265272
    ## 896839    -1.1840685475 -0.130364002 -0.5498907189
    ## 896864    -0.5602900988  1.251070642  0.4213268531
    ## 897132     3.4562087554  0.859009322 -0.8427620321
    ## 897137     0.3762481427  0.535295153  0.7321018980
    ## 897374     0.3513268837 -0.277500386 -0.1028043410
    ## 89742801   0.9081313503 -1.171186789 -0.3369893508
    ## 897604    -1.4301998125 -0.342888793  1.2080801113
    ## 897630     0.1324405011  0.503248640  0.1330836287
    ## 897880     1.4424249065 -0.191668549 -0.1697594667
    ## 89812      0.7054132905 -1.262075777  0.1690277622
    ## 89813     -0.7284538257  0.579500486  0.1083178964
    ## 898143    -1.2050388549  0.731456554  0.8157567587
    ## 89827      0.4132078419  0.118133276 -0.0990057335
    ## 898431     0.9611232170  2.579043663 -1.2321200879
    ## 89864002   1.4804780811 -0.768666415 -0.3893955715
    ## 898677     1.0448376978 -1.007952827 -0.3752347168
    ## 898678     0.3514194212 -0.040227674  0.4880610951
    ## 89869     -0.7180879050  0.637627242  0.1715272186
    ## 898690     0.5848648524 -0.881613711  0.0840694378
    ## 899147     1.9342391900  1.313127920  0.1202364501
    ## 899187    -0.1785899127  0.990838126  0.5648967235
    ## 899667     0.6059916654  2.459430541 -1.4669198274
    ## 899987     0.4883558953  0.196263785 -0.1096444713
    ## 9010018    0.5390360723 -1.731849219 -0.2168000270
    ## 901011    -1.7021761518  1.848179158  0.4979044533
    ## 9010258   -1.5450702314 -0.253099881 -0.9257667152
    ## 9010259    0.1024797906  0.562703391 -0.9865070284
    ## 901028    -0.1788449118 -0.492383289  0.1775429194
    ## 9010333   -0.0407045185  0.616447564  0.5127726501
    ## 901034301  0.7229711106 -1.036485505  1.2894520107
    ## 901034302 -0.2198878361  0.689897235  0.3410957237
    ## 901041     0.1292803966  0.539107939 -0.1461860392
    ## 9010598    0.3545026443  0.019355922 -0.2921769518
    ## 9010872    0.0857346246 -0.892345371 -0.8858311167
    ## 9010877   -0.8401627046  0.322633323  0.1555598145
    ## 901088    -0.2830181364 -0.576806951 -0.6629676646
    ## 9011494    0.5821459417  0.988060282 -0.7970441849
    ## 9011495    0.2390645934  0.398140618 -0.0645026624
    ## 9011971    1.0726100091 -0.832344744  1.4919773252
    ## 9012000   -0.2973284171 -0.477923128  0.8442636938
    ## 9012315    0.1174778025  2.667823055 -0.9407899084
    ## 9012568   -1.1349569236  0.617275952 -0.4793053363
    ## 9012795   -0.9935467144  0.253631779 -1.1782462018
    ## 901288    -0.3203822623 -1.030121857 -0.7467180332
    ## 9013005   -0.3781480185  1.617443807  0.0938490707
    ## 901303    -0.4027131208  0.775977838 -0.2614574286
    ## 901315    -4.5986701548 -0.062587840 -0.3217196360
    ## 9013579   -0.4728184934  0.048936764  0.3139548052
    ## 9013594   -1.2347827015  1.034252471  0.2979977108
    ## 9013838    0.5637410178 -0.931622121  0.5558930985
    ## 901549     1.4257318574 -0.413238965 -0.3265681118
    ## 901836    -0.1706180435  1.511904788  0.1107862663
    ## 90250     -3.4960491469  0.311959374  0.6410425845
    ## 90251     -1.0117604959 -0.535690225  0.8239055160
    ## 902727    -1.5542727004  0.514203265 -0.1400589671
    ## 90291     -0.2027995563 -0.634221424 -1.2036581988
    ## 902975    -2.0773397982  0.836900468  0.5372471084
    ## 902976    -1.6017729103  1.269631553  0.3369059661
    ## 903011    -3.8110426797 -0.903282021  0.7048671644
    ## 90312     -0.3283619127 -0.252360512 -2.5925659101
    ## 90317302   0.4236952100  0.156093205  0.3242076866
    ## 903483     2.4403924824 -1.848848148  1.5475878305
    ## 903507     0.6044479220 -1.016195655 -0.0050197039
    ## 903516     0.2362625219  0.485646865 -0.4029431540
    ## 903554     1.5081790902 -0.076639013 -0.5411420517
    ## 903811    -0.3635999269  0.386466855 -0.6426712317
    ## 90401601  -0.1389987468 -0.744129779 -1.0668559939
    ## 90401602  -2.0611887662  0.203701388 -0.0995017006
    ## 904302    -1.5248138903  0.073042200  1.2376399689
    ## 904357     0.0482116178  0.168954300  0.6871762127
    ## 90439701  -0.2023110488 -1.256879923 -0.2859010637
    ## 904647    -0.2356318119 -0.691195823 -0.0520373351
    ## 904689    -1.1637958353  2.427978134  0.2056036891
    ## 9047      -0.0489496329  0.937091754  0.0225694328
    ## 904969     0.1728393129  0.596538718 -0.2936325230
    ## 904971     0.5411994776 -1.417278885  0.0553933955
    ## 905189    -0.4837568556  0.304102683 -0.5350338384
    ## 905190    -1.9041890533  0.930130928  0.7878753397
    ## 90524101   0.1644668356 -0.458760443 -0.7423665358
    ## 905501     0.8604953761  1.585292486 -0.5745969577
    ## 905502     0.5652328718 -0.468516238 -0.0341846701
    ## 905520     0.9848137147 -0.334162053 -0.0186481656
    ## 905539    -1.7077458028 -0.285445134  1.2889735007
    ## 905557    -0.8550878945  1.241782183  0.1692927893
    ## 905680     1.2742945854  1.625262058 -0.5471226180
    ## 905686     1.2792046734  0.116726716 -0.4680111924
    ## 905978     3.1480466996 -0.782964929 -0.1884663582
    ## 90602302   1.1740030698 -0.855452257  2.5023943225
    ## 906024    -0.5764724361 -0.239599175  0.6754089610
    ## 906290     1.5633857813  0.167610330  0.0754607928
    ## 906539     0.0219104429  0.688714769  0.0754987298
    ## 906564    -0.1438692164  0.133478398  0.3651157986
    ## 906616     0.2813203167 -0.239186164 -0.7274351177
    ## 906878    -1.4746581730  0.475543714 -0.0888980901
    ## 907145     3.5055609223  0.534064618  0.6990198575
    ## 907367     0.0850247711 -0.329783732  0.9938632467
    ## 907409    -0.5564209652  0.269764170  0.5109650849
    ## 90745      0.5362392557  0.507927890 -0.1387719046
    ## 90769601  -0.5356508029  0.225843093  0.2262523820
    ## 90769602  -0.3398155529 -0.065040152  0.0501820538
    ## 907914    -2.8622552978 -0.306811042 -0.6492623125
    ## 907915    -0.1383500423 -0.990364525 -0.0511584766
    ## 908194     0.0714231738 -0.930064293 -2.2544646797
    ## 908445     0.3572756344 -0.029941068 -0.3229932215
    ## 908469    -0.5533135626 -0.168463334 -0.2352388721
    ## 908489     0.0277629459 -1.081099413 -0.0010498906
    ## 908916     0.8275650396  0.952481157  0.6728863814
    ## 909220     0.1058427332  0.195170967 -0.0034491992
    ## 909231     0.3005228170  0.089858744  0.1462143751
    ## 909410    -1.2590809462 -0.103500301 -0.2351662467
    ## 909411    -2.0876130896 -1.103172853 -0.1347436553
    ## 909445    -1.4046042766 -0.964009904 -0.8135868399
    ## 90944601  -0.9420463979 -0.936292265  0.6826624088
    ## 909777     0.8318195830  0.897031883 -0.8902959516
    ## 9110127   -1.1822180725  0.143526659 -0.4567092765
    ## 9110720    0.3928701037 -0.699155425 -0.4977435511
    ## 9110732   -0.5498682865 -0.598086185 -0.4691884880
    ## 9110944    0.3790198963  1.534348384 -0.2905432068
    ## 911150    -1.5340001134  0.012054627 -0.1010876325
    ## 911157302 -0.6103038017 -1.422336801 -0.6695517414
    ## 9111596   -3.7384644652  0.342133611  0.9291469178
    ## 9111805    0.4288865709 -1.829924638 -2.4021852235
    ## 9111843   -0.4795727546 -0.484220288  0.0429605111
    ## 911201     0.2430866392 -0.482435963 -0.5070647518
    ## 911202    -0.1146041549  0.972979646 -0.1503289773
    ## 9112085    0.2206325260 -1.198785425  0.3364916499
    ## 9112366    1.2439684480 -0.225426032 -0.7491044280
    ## 9112367    0.2050662449 -0.571668797 -0.3612489115
    ## 9112594    0.2091427763 -0.482141691 -0.1794272022
    ## 9112712    0.0182086861 -0.309548924  0.2304236421
    ## 911296201  1.3813559853 -0.999041862  1.1146528459
    ## 911296202  1.7079531344 -1.123832614  4.9581336925
    ## 9113156   -0.9783779753  0.488325468 -0.0462299464
    ## 911320501 -0.2280062503  0.344589192 -0.0765341769
    ## 911320502 -1.2827836689 -0.658253511 -0.3129584449
    ## 9113239   -3.8210171185  0.223223930  1.4700860059
    ## 9113455   -1.5121265752 -0.555212156 -0.2170958245
    ## 9113514    1.3359873635  0.076677038  0.6404792504
    ## 9113538   -2.8810043579 -1.099270464  2.0225405128
    ## 911366     1.2086350824 -2.425717007 -0.9408861129
    ## 9113778    0.7919949893  0.924815954  0.4955679709
    ## 9113816    1.0158156443  0.104368624  0.3193046533
    ## 911384    -1.8037276563  0.614923390  0.2799737367
    ## 9113846    1.8740788308  0.889614864  0.9246961441
    ## 911391    -1.2304717877 -0.419258899  1.2867603886
    ## 911408    -0.9034160493  0.367305570 -0.3444775333
    ## 911654    -1.4281800593 -0.049155752  0.2225068454
    ## 911673    -1.4182276802  1.337188809  0.5365858519
    ## 911685    -0.1796630638 -0.024030956  0.2726963978
    ## 911916    -1.2886313605  0.808383394 -1.5668970121
    ## 912193    -0.4615631694 -0.544923618  0.6168567753
    ## 91227     -1.0372087673 -0.020448924  0.5596010017
    ## 912519     0.1175030515 -0.015465239  0.0341998123
    ## 912558    -0.1827652155 -0.163288967 -0.2363141916
    ## 912600    -0.8010805172 -0.959725312 -1.0374933742
    ## 913063    -2.6430509823  1.555748208 -0.0074068986
    ## 913102    -1.0918206156 -0.100925216 -0.2480033888
    ## 913505     0.0965398306 -0.355060598 -0.6249667494
    ## 913512     1.4343549437 -0.865293960 -0.3426305869
    ## 913535    -0.2610613824  3.200742182  0.1681848622
    ## 91376701   0.0289580691  0.211717707  0.6719224926
    ## 91376702  -1.4018393993 -0.552916738  0.1223216364
    ## 914062     1.1212732858  0.929231997 -0.1972060738
    ## 914101    -0.1992898120  0.564240369  0.2686459455
    ## 914102    -0.0048653882  0.565106052  0.4685793512
    ## 914333    -0.1579186103 -0.437681039 -1.0429086282
    ## 914366    -0.2509810467 -0.602030766  0.4096827364
    ## 914580    -0.5054003068  0.213609008  0.0982391416
    ## 914769    -0.3682903454 -1.103639415  0.6339022355
    ## 91485     -0.3834794788 -1.446663003 -0.5729903088
    ## 914862    -0.9815689274 -0.852480433  0.7049106403
    ## 91504      1.5841377430 -0.507970681  0.2069805672
    ## 91505      1.8100776146 -0.241932508 -1.0452388229
    ## 915143    -0.3960294570  0.066333057  1.1529703725
    ## 915186     2.0135831354 -2.200919526  1.0250951989
    ## 915276     1.3946448821 -3.508790828  0.6042606963
    ## 91544001  -0.0233994859 -0.484723076 -0.1359505647
    ## 91544002   1.1385251781 -1.947329468  0.4881934312
    ## 915452    -0.7377031703 -0.833977551 -1.4088879023
    ## 915460    -0.1327084112 -1.602111794 -1.0533691956
    ## 91550     -2.5658122684  0.253668588  0.5472551225
    ## 915664    -0.7157489170  0.032979942 -0.8752970956
    ## 915691     0.5363853531 -0.136700223  0.3929176231
    ## 915940    -0.5280229629  0.072494321 -0.1758143289
    ## 91594602  -0.6604100570 -0.773624515 -0.1454686759
    ## 916221     1.4212995780  0.046608047 -1.0005231004
    ## 916799     0.5839845732 -0.491293222 -0.5167539200
    ## 916838    -0.5274167311 -1.017677377 -0.0261084918
    ## 917062     0.8395117260 -1.286369931  0.7480548590
    ## 917080     1.4206509043 -0.265206232  0.1942744924
    ## 917092     3.8371535988 -0.548135411 -0.8140726857
    ## 91762702   0.0228851505 -0.006685146  0.9611743974
    ## 91789     -0.1037131678  0.097095633  0.7218828231
    ## 917896     0.1063131129 -0.600188263  0.1391868086
    ## 917897     0.0993416275 -1.401965911  0.9527774834
    ## 91805      0.3541295063 -1.210209018  0.8160391133
    ## 91813701   0.6295214724 -0.364718273 -0.0462160782
    ## 91813702  -0.4310565911  0.325770470 -0.0944504391
    ## 918192     0.5713316529 -1.686010994 -1.7109061685
    ## 918465     0.6913036191 -0.851940525 -0.0288485824
    ## 91858      0.7853562456 -1.101161685  0.0869517853
    ## 91903901   0.6155504122 -0.289073515  0.4730366470
    ## 91903902  -0.2972072410 -0.197903630  0.4337496082
    ## 91930402   0.5131432277  1.934520374 -0.7275859760
    ## 919537    -0.6824469628 -1.550311718 -0.7176961616
    ## 919555     0.2092240560  0.578720770 -0.5430102167
    ## 91979701  -0.2266699710 -0.523378449 -1.1495594767
    ## 919812     1.9552004887 -2.337461193 -0.4830815304
    ## 921092     1.7603677988  0.042391707  2.1668488112
    ## 921362    -0.7649016389 -1.158207647  0.1913668076
    ## 921385    -0.4841195986 -1.188472456 -0.6771595730
    ## 921386    -1.0459061568  0.425520296  0.3979358310
    ## 921644    -0.1994515741  0.765081147 -0.4663049042
    ## 922296     0.0382130321  0.068753051 -0.4148574879
    ## 922297    -0.5559910407 -0.930763180  0.5238585798
    ## 922576     0.2021640255  0.114797260 -0.1161527345
    ## 922577     0.7040073381 -0.145962831  0.2596286888
    ## 922840    -0.4502519824 -0.677751360  0.0640445882
    ## 923169    -0.0799652223 -0.112569772  0.4740694793
    ## 923465     1.4550448383  0.854769667  1.0210226174
    ## 923748     0.7842069600  0.850625097  0.7520064103
    ## 923780     0.1141621816  1.783207929  0.3901520318
    ## 924084     0.3568359788 -0.582689902 -0.6178681677
    ## 924342     0.6248149194  0.411907169 -0.3073955477
    ## 924632    -0.5653278607 -0.549918834 -0.4839795902
    ## 924934    -0.2108571316 -1.640362885 -1.0878956916
    ## 924964     1.6859553304 -0.814176294 -0.4706597676
    ## 925236     2.2399371646  0.174755382  1.0763071056
    ## 925277    -2.9864399976  0.012441261 -0.2900018002
    ## 925291    -0.9465087393 -1.724352624 -0.3536636324
    ## 925292    -0.3268156112 -0.991190143 -0.0485030055
    ## 925311     0.4884909563 -1.109815814  0.4879418774
    ## 925622    -1.7148732547  1.012707855  0.2712037562
    ## 926125    -0.6784463175 -0.300488375  0.0947410215
    ## 926424     0.0747585153 -2.373104852 -0.5956056075
    ## 926682     0.5102735378 -0.246493221 -0.7156966020
    ## 926954    -1.8084001296 -0.533977345 -0.1925887705
    ## 927241     0.0337122683  0.567437190  0.2228855560
    ## 92751      0.1845409324  1.616415088  1.6974579729

``` r
wisc.pr.hclust <- hclust(dist(wisc.pr$x[,1:7]), method = "ward.D2")
plot(wisc.pr.hclust)
```

![](class09_files/figure-markdown_github/unnamed-chunk-25-1.png)

``` r
grps <- cutree(wisc.pr.hclust, k=2)
table(grps)
```

    ## grps
    ##   1   2 
    ## 216 353

Q19. How well does the newly created model with four clusters separate out the two diagnoses?

``` r
table(grps, diagnosis)
```

    ##     diagnosis
    ## grps   B   M
    ##    1  28 188
    ##    2 329  24

Q20. How well do the k-means and hierarchical clustering models you created in previous sections (i.e. before PCA) do in terms of separating the diagnoses? Again, use the table() function to compare the output of each model (wisc.km$cluster and wisc.hclust.clusters) with the vector containing the actual diagnoses.

``` r
#table(wisc.km$cluster, diagnosis)
#table(wisc.hclust.clusters, diagnosis)
```

``` r
plot(wisc.pr$x[,1], wisc.pr$x[,2], col=grps)
```

![](class09_files/figure-markdown_github/unnamed-chunk-29-1.png)

``` r
# This does the same thing
# plot(wisc.pr$x[,1:2], col=grps)
```

``` r
plot(wisc.pr$x[,1:2], col=diagnosis)
```

![](class09_files/figure-markdown_github/unnamed-chunk-30-1.png)

Note the color swap here as the hclust cluster 1 is mostly "M" and cluster 2 is mostly "B" as we saw from the results of calling table(grps, diagnosis). To match things up we can turn our groups into a factor and reorder the levels so cluster 2 comes first

``` r
g <- as.factor(grps)
levels(g)
```

    ## [1] "1" "2"

``` r
g <- relevel(g,2)
levels(g)
```

    ## [1] "2" "1"

``` r
plot(wisc.pr$x[,1:2], col=g)
```

![](class09_files/figure-markdown_github/unnamed-chunk-33-1.png)

Attempt at Section 4
--------------------

``` r
library(rgl)
plot3d(wisc.pr$x[,1:3], xlab="PC 1", ylab="PC 2", zlab="PC 3", cex=1.5, size=1, type="s", col=grps)
```

``` r
wisc.km <- kmeans(wisc.pr$x, centers=2, nstart= 20)
table(wisc.km$cluster, diagnosis)
```

    ##    diagnosis
    ##       B   M
    ##   1  14 175
    ##   2 343  37

``` r
table(wisc.hclust.clusters, wisc.km$cluster)
```

    ##                     
    ## wisc.hclust.clusters   1   2
    ##                    1 160  17
    ##                    2   3   0
    ##                    3  12 358
    ##                    4   2   0
    ##                    5   8   5
    ##                    6   2   0
    ##                    7   2   0
