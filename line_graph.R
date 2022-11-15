library(tidyr)
library(plotly)
library(ggplot2)

suicide_rates <- read.csv("who_suicide_statistics.csv", header = TRUE)

#This is a line graph that depicts suicide rates of people all across the world. 
#Also this line graph uses population and year to show the high and low suicide rates. 
p1 <- ggplot()+
  geom_line(aes(y = population, x = year), data = suicide_rates)+
  scale_x_continuous(breaks = seq(1983,2015,10))+
  theme(text = element_text(family = "Arial"))

p1 + labs(title = "Suicide Rates", 
         x = "Year", y = "Population")

