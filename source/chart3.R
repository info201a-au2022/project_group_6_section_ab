#Preparing dataset 
data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/who_suicide_statistics.csv")
View(data)

View(us_data)

library(ggplot2)

# Creating a barchart of the 'us_data' dataset and comparing the rates of suicide 
# numbers over the years. 

ggplot(data = us_data) +
  geom_col(mapping = aes(x = year, y = suicides)) +
  labs(title = "Suicide Rates Over the Years" )
