#existing levels
levels(gapminderData$continent)

#reorder data by lifeExp in descending order
gapminderData$continent <- fct_reorder(gapminderData$continent, gapminderData$lifeExp, mean, .desc = TRUE)
levels(gapminderData$continent)

#Reorder the continents based on life expectancy. You decide the details.
gapminderData <- gapminderData %>%
  arrange(country,year)

#Save a couple descriptive plots to file with highly informative names.
p1 <- gapminderData %>%
  ggplot() + 
  stat_summary(
    mapping = aes(x = continent, y = gdpPercap),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean)+
  theme_bw() +
  theme(axis.title = element_text(color="#777777", face="bold", size=12)) + 
  labs(y = 'Per Capita GDP', x = 'Continent') 
ggsave("gdpPerCap_by_continent.png", p1)

p1

p2 <- gapminderData %>%
  mutate(lifeExp_pop = (lifeExp/pop)) %>%
  ggplot(aes(x=continent, y=lifeExp_pop)) + geom_boxplot(colour="gray10", fill="skyblue") +
  scale_y_log10() +  labs(x = 'Continent', y = 'Life Expectancy (weighted by population)') +
  theme_bw() +
  theme(axis.title = element_text(color="#777777", face="bold", size=12))
ggsave("lifeExp_popWeighted_by_continent.png", p2)

p2

# write data to file
saveRDS(gapminderData, "gapminder_reordered.tsv")