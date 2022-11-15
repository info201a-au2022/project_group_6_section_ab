# Load ggplot2 and data
library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/who_suicide_statistics.csv")
View(data)

View(us_data)

# Creating a scatterplot of the 'us_data' dataset to compare the year vs. suicide number

plot(x = us_data$year, y = us_data$suicides) 

library(ggplot2)
ggplot(data = us_data) +
  geom_point(mapping = aes(x = year, y = suicides)) +
  labs(title = "Suicide Rates Over The Years")

