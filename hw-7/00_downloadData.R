# Download the raw gapminder data file
download(url = "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv", destfile = "gapminder.tsv")
gapminderData<-read.delim("gapminder.tsv")