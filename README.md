
<!-- README.md is generated from README.Rmd. Please edit that file -->

# UNRCINT

<!-- badges: start -->
<!-- badges: end -->

This package is expected to help students in undertaking Unit Root
Testing. The package consist of two main functions:

- **urootp** Conducts unit root test on the entire data frame and
  generates the test statistic with it’s associated p-values

- **urootc** Conducts unit root test on the entire data frame and
  generates the test statistic with it’s associated critical values at
  1%, 5% and 10% respectively.

The package generate unit root test results based on:

- The **Augmented Dickey Fuller (ADF)** Test

- The **Phillips Perron (PP)** Test and

- The **Kwiatkowski–Phillips–Schmidt–Shin (KPSS)** test

## Installation

You can install the development version of UNRCINT from
[GitHub](https://github.com/) with:

``` r
remotes::install_github("wgcantah/UNRCINT")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(UNRCINT)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(data)
#>     organic          regular      
#>  Min.   : 82.28   Min.   : 66.35  
#>  1st Qu.:116.24   1st Qu.: 95.68  
#>  Median :164.79   Median :142.96  
#>  Mean   :163.81   Mean   :143.76  
#>  3rd Qu.:212.33   3rd Qu.:190.08  
#>  Max.   :266.70   Max.   :243.56
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

    #> Registered S3 method overwritten by 'quantmod':
    #>   method            from
    #>   as.zoo.data.frame zoo
    #> Warning in tseries::pp.test(var_data): p-value smaller than printed p-value
    #> Warning in tseries::kpss.test(var_data): p-value smaller than printed p-value
    #> Warning in tseries::kpss.test(var_data): p-value smaller than printed p-value
    #>         Variable   ADF ADF.P     PP PP.P KPSS KPSS.P
    #> organic  organic -2.26  0.47 -72.04 0.01  3.7   0.01
    #> regular  regular -1.96  0.59  -7.31 0.70  3.7   0.01

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
