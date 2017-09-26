hw\_02\_gapminder\_dplyr
================
Cassandra
2017-09-26

Bring rectangular data in
=========================

-   Install and load required packages

``` r
library(gapminder)
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 3.3.2

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Warning: package 'ggplot2' was built under R version 3.3.2

    ## Warning: package 'tibble' was built under R version 3.3.2

    ## Warning: package 'tidyr' was built under R version 3.3.2

    ## Warning: package 'readr' was built under R version 3.3.2

    ## Warning: package 'purrr' was built under R version 3.3.2

    ## Warning: package 'dplyr' was built under R version 3.3.2

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
library(dplyr)
```

Smell test the data
===================

-   Is it a data.frame, a matrix, a vector, a list?

A data.frame is a list of vectors

``` r
data <- gapminder
typeof(data)
```

    ## [1] "list"

-   What’s its class?

The class of the data.frame is a table or "tibble".

``` r
class(data)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

-   How many variables/columns? There are 6 variables/columns in the gapminder data set.

``` r
ncol(data)
```

    ## [1] 6

-   How many rows/observations?

There are 1704 rows/observations in the gapminder data set.

``` r
nrow(data)
```

    ## [1] 1704

-   Can you get these facts about “extent” or “size” in more than one way? Can you imagine different functions being useful in different contexts?

Get dimmensions of the data set using dim(). This would be good if we want a really quick overview of the size of the dataset

``` r
dim(data)
```

    ## [1] 1704    6

Get length of object - in this case the length of the list of vectors (rows). This would be useful if we only wanted to know the number of rows (similar function to the nrow() function)

``` r
length(data)
```

    ## [1] 6

Get the names of the columns - we can see that there are 6 in total. This is useful if we not only want the number of columns, but also their names.

``` r
names(data)
```

    ## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"

-   What data type is each variable?

Use the typeof() function to find the data type of each variable. We can use the column names given above ...

country:

``` r
typeof(data$country)
```

    ## [1] "integer"

continent:

``` r
typeof(data$continent)
```

    ## [1] "integer"

year:

``` r
typeof(data$year)
```

    ## [1] "integer"

lifeExp:

``` r
typeof(data$lifeExp)
```

    ## [1] "double"

pop:

``` r
typeof(data$pop)
```

    ## [1] "integer"

gdpPercap:

``` r
typeof(data$gdpPercap)
```

    ## [1] "double"

Explore individual variables
============================

-   Pick at least one categorical variable and at least one quantitative variable to explore. I chose to use the variables **"continent"** and **gdpPercap**
-   What are possible values (or range, whichever is appropriate) of each variable?
-   What values are typical? What’s the spread? What’s the distribution? Etc., tailored to the variable at hand. Feel free to use summary stats, tables, figures. We’re NOT expecting high production value (yet).

The possible values and frequency of each value for continent are shown in the summary output. In addition there is a plot with the frequency of each value of continent.

``` r
summary(data$continent)
```

    ##   Africa Americas     Asia   Europe  Oceania 
    ##      624      300      396      360       24

``` r
ggplot(data.frame(data$continent), aes(x=data$continent)) + xlab("Continent") + ylab("Frequency") +
  geom_bar()
```

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-15-1.png)

The summary function shows that the minimum gdpPercap is 241.2 and the maximum is 113500.0. The mean is 7215.0. The histogram shows the distribution of values. Values under 10000 seem to be the most common.

``` r
summary(data$gdpPercap)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##    241.2   1202.0   3532.0   7215.0   9325.0 113500.0

``` r
hist(data$gdpPercap)
```

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-16-1.png)

Explore various plot types
==========================

``` r
ggplot(gapminder, aes(gdpPercap, lifeExp, colour=continent)) + geom_point() + scale_x_log10()
```

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-17-1.png)

``` r
filter(gapminder,
       ((continent == "Americas") & year %in% 1950:2000)|
           ((continent == "Europe") & year %in% 1950:2000)) %>%
select(year, gdpPercap,country,continent) %>%
ggplot(aes(year, gdpPercap, group=country, colour=continent)) + geom_point() + geom_smooth(se=FALSE, method="loess", span=5)
```

    ## Warning: package 'bindrcpp' was built under R version 3.3.2

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-18-1.png)

``` r
ggplot(gapminder, aes(year, lifeExp, colour=continent)) + geom_smooth() 
```

    ## `geom_smooth()` using method = 'loess'

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-19-1.png)

``` r
ggplot(gapminder, aes(year, gdpPercap, colour=continent)) + geom_smooth() 
```

    ## `geom_smooth()` using method = 'loess'

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-20-1.png)

``` r
filter(gapminder, year == 1992) %>%
select (country, continent, gdpPercap) %>%
ggplot(aes(continent, gdpPercap)) + geom_col()
```

![](hw_02_gapminder_dplyr_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-21-1.png) \# But I want to do more!

``` r
filter(gapminder, country == c("Rwanda","Afghanistan"))
```

    ## # A tibble: 12 x 6
    ##        country continent  year lifeExp      pop gdpPercap
    ##         <fctr>    <fctr> <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan      Asia  1957  30.332  9240934  820.8530
    ##  2 Afghanistan      Asia  1967  34.020 11537966  836.1971
    ##  3 Afghanistan      Asia  1977  38.438 14880372  786.1134
    ##  4 Afghanistan      Asia  1987  40.822 13867957  852.3959
    ##  5 Afghanistan      Asia  1997  41.763 22227415  635.3414
    ##  6 Afghanistan      Asia  2007  43.828 31889923  974.5803
    ##  7      Rwanda    Africa  1952  40.000  2534927  493.3239
    ##  8      Rwanda    Africa  1962  43.000  3051242  597.4731
    ##  9      Rwanda    Africa  1972  44.600  3992121  590.5807
    ## 10      Rwanda    Africa  1982  46.218  5507565  881.5706
    ## 11      Rwanda    Africa  1992  23.599  7290203  737.0686
    ## 12      Rwanda    Africa  2002  43.413  7852401  785.6538

Perhaps the first code filters through the dataset by comparing each row in the dataset to one item in the list. This would mean that everysecond row in the Afghanistan data, for example, would be compared to Rwanda and therefore it would be FALSE. The same would apply for Rwanda.

This could be re-written as the following:

``` r
filter(gapminder, country == "Rwanda" | country == "Afghanistan")
```

    ## # A tibble: 24 x 6
    ##        country continent  year lifeExp      pop gdpPercap
    ##         <fctr>    <fctr> <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan      Asia  1952  28.801  8425333  779.4453
    ##  2 Afghanistan      Asia  1957  30.332  9240934  820.8530
    ##  3 Afghanistan      Asia  1962  31.997 10267083  853.1007
    ##  4 Afghanistan      Asia  1967  34.020 11537966  836.1971
    ##  5 Afghanistan      Asia  1972  36.088 13079460  739.9811
    ##  6 Afghanistan      Asia  1977  38.438 14880372  786.1134
    ##  7 Afghanistan      Asia  1982  39.854 12881816  978.0114
    ##  8 Afghanistan      Asia  1987  40.822 13867957  852.3959
    ##  9 Afghanistan      Asia  1992  41.674 16317921  649.3414
    ## 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
    ## # ... with 14 more rows

This selects all rows where the country is equal to Afghanistan OR Rwanda as intended.

That is all of 'the more' that I would like to do!

Report your process
===================
