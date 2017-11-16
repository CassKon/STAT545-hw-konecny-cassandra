#Import the data created in the first script.
gapminderData <- readRDS("gapminder_reordered.tsv")

#Make sure your new continent order is still in force. You decide the details.
levels(gapminderData$continent)

#Fit a linear regression of life expectancy on year within each country. Write the estimated intercepts, slopes, and residual error variance (or sd) to file. The R package broom may be useful here.
summaryStats<-ddply(gapminderData, ~country,function(i){
  lm<-lm(model <- lifeExp ~ year, data = i)
  out <- c( lm$coefficients[1],
            lm$coefficients[2],
            length(lm$model$y),
            summary(lm)$coefficients[2,2],
            pf(summary(lm)$fstatistic[1], summary(lm)$fstatistic[2],
               summary(lm)$fstatistic[3], lower.tail = FALSE),
            summary(lm)$r.squared)
  names(out) <- c("intercept","slope","n","slope.SE","p.value","r.squared")
  return(out)
})

continents <- unique(gapminderData[,1:2])
summaryStats <- merge(summaryStats,continents,by="country")
write.table(summaryStats,"SummarryStats.tsv")


#Find the 3 or 4 “worst” and “best” countries for each continent. You decide the details.

Best<-ddply(summaryStats, ~continent,function(i){
  head(arrange(i,desc(slope)), n = 3) %>%
    select(continent, country)
})

Worst <- Top<-ddply(summaryStats, ~continent,function(i){
  head(arrange(i,desc(slope)), n = 3) %>%
    select(continent, country)
})

#Create a figure for each continent, and write one file per continent, with an informative name. The figure should give scatterplots of life expectancy vs. year, faceting on country, fitted line overlaid.
ddply(gapminderData, ~continent, function(i){
  con <- i$continent[1]
  p<-ggplot(i,aes(year, lifeExp)) +
    labs(x = 'Year', y = 'Life Expectancy') +
    facet_wrap(~ country,scales="free_x") +
    geom_point(colour="#9966CC", alpha=0.2) + geom_smooth(span=2, colour="#666699", se=FALSE)+
    theme_bw() +
    theme(axis.title = element_text(color="#777777", face="bold", size=12))
  print(p)
  con <- gsub(" ", "-", con)
  ggsave(paste0("lifeExp_country_facet_by_continentpng",con,".png"))
})