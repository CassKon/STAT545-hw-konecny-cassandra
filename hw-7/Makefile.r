## clean out any previous work
outputs <- c("gapminder.tsv",                    
             "gapminder_reordered.tsv",
             "SummarryStats.tsv",
             list.files(pattern = "*.png$"))
file.remove(outputs)

## run my scripts
source("00_downloadData.R")
source("01_filter_reorder.R")
source("02_aggregate.R")