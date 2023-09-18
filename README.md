
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stadlColorPaletteR

<!-- badges: start -->
<!-- badges: end -->

The goal of stadlColorPaletteR is to provide easy functions to create
your own color platttes to be used in ggplot.

## Installation

You can install the development version of stadlColorPaletteR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thgsponer/stadlColorPaletteR")
```

## Documentation

Full documentation website on:
<https://thgsponer.github.io/stadlColorPaletteR>

## Example

This is a basic example which shows you how to create a color palette.
First, lets define some colors as the basis for our palettes.

``` r
library(stadlColorPaletteR)
library(ggplot2)
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
#> ✔ tibble  3.1.8      ✔ dplyr   1.0.10
#> ✔ tidyr   1.3.0      ✔ stringr 1.5.0 
#> ✔ readr   2.1.3      ✔ forcats 0.5.2 
#> ✔ purrr   1.0.2
#> Warning: package 'tidyr' was built under R version 4.2.3
#> Warning: package 'purrr' was built under R version 4.2.3
#> Warning: package 'stringr' was built under R version 4.2.3
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()

set.seed(123)
mycolors <- tibble(color_names = sample(colors(),5), 
                   hex_code = colorRampPalette(color_names)(length(color_names)))

mycolors
#> # A tibble: 5 × 2
#>   color_names          hex_code
#>   <chr>                <chr>   
#> 1 lightgoldenrodyellow #FAFAD2 
#> 2 mediumorchid1        #E066FF 
#> 3 gray26               #424242 
#> 4 palevioletred2       #EE799F 
#> 5 gray42               #6B6B6B
```

Now we generate all possible combinations of these colors.

``` r
cols2int <- generate_colors_to_interpolate(
  mycolors,
  n = 2
)

head(cols2int)
#> $pal1
#> [1] "#FAFAD2" "#E066FF"
#> 
#> $pal2
#> [1] "#FAFAD2" "#424242"
#> 
#> $pal3
#> [1] "#FAFAD2" "#EE799F"
#> 
#> $pal4
#> [1] "#FAFAD2" "#6B6B6B"
#> 
#> $pal5
#> [1] "#E066FF" "#424242"
#> 
#> $pal6
#> [1] "#E066FF" "#EE799F"
```
