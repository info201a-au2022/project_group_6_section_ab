# Organizing our data in a dataset 
data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/who_suicide_statistics.csv")
View(data)

library("dplyr")
library("stringr")
library("tidyverse")

#Filtering the table to data from the U.S
us_data <- data %>%
  group_by(country, na.rm =TRUE)%>%
  filter(country == "Virgin Islands (USA)") 
View(us_data) 

#Renaming "suicides_no" column 
us_data <- us_data %>%
  rename(suicides = suicides_no)
View(us_data)

#Separating genders into its own column 
us_data <- us_data %>%
  mutate(us_data, gender_female = "female") %>%
  mutate(us_data, gender_male = "male") %>%
  subset(select = -sex)
View(us_data)

#Relocating the gender columns 
us_data <- us_data %>%
  relocate(gender_female, gender_male, .before = age)
View(us_data)

