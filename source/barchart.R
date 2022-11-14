#Preparing dataset 
data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/who_suicide_statistics.csv")
View(data)

View(us_data)

library(ggplot2)

# Creating a barchart of the 'us_data' dataset of the comparison between male and female
# suicide numbers over the years.

ggplot(us_data) +
  geom_col(
    mapping = aes(x = year, y = suicides, fill = sex), position ="dodge"
    ) +
  labs(title = "Suicide Numbers Between Genders Over the Years")

