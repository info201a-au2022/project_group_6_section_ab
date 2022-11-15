library(tidyr)
library(dplyr)

suicide_rates <-read.csv("who_suicide_statistics.csv", header = TRUE, sep = ",")

#This unites the country,year,and age columns 
country_rates <-suicide_rates %>% 
  unite(country, year, age, sep = ",",na.rm = TRUE, remove = FALSE)

#This function uses prints out the year and the age of the 
#highest number of suicides across the world. 
suicide_rates_countries<- country_rates %>% 
  select(country,year,age) %>% 
  filter(year == max(year)) %>% 
  pull(country)

#Filters out the year with the highest number of suicides and returns that year
suicide_rates_year<- suicide_rates %>% 
  select(year) %>% 
  filter(year == max(year)) %>% 
  pull(year)

#This filters out the population and displays the minimum number 
#of the people's population comparing it to the number of suicides
min_living_population <- suicide_rates %>% 
  drop_na() %>% 
  select(population) %>% 
  filter(population == min(population)) %>% 
  pull(population)
  nrow()

#This filters out the population and displays the max number 
#of the people's population comparing it to the number of suicides
max_living_population<- country_rates %>% 
  drop_na() %>% 
  select(population) %>% 
  filter(population == max(population)) %>% 
  pull(population)
  nrow()



