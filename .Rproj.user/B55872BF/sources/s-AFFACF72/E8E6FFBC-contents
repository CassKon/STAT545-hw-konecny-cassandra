## clean out any previous work
outputs <- c("gapminder.tsv",                     # 00_download-data.R
             "gapminder_reordered.tsv",          # 01_filter-reorder-plot.R
             list.files(pattern = "*.png$"))
file.remove(outputs)

## run my scripts
source("00_downloadData.R")
source("01_filter_reorder.R")
source("02_aggregate.R")