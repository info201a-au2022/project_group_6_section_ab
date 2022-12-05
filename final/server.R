library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(plotly)
#library(rsconnect)

us_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/us_data.csv")

update.packages(ask = FALSE, checkBuilt = TRUE)
# Bar Chart 

gender_data <- us_data %>%
  filter(sex %in% c("male", "female"))

server <- (function(input, output) {
  
  output$selectgender <- renderPlotly({
    plot <- gender_data %>%
      drop_na(suicides)%>%
      filter(sex %in% input$sex)%>%
      select(year, suicides, sex)
    plot_data <- ggplot(plot, 
                        aes(x= year, y= suicides, 
                            color = sex)) +
      geom_bar(stat = "identity", col= "blue") 
    return(plot_data)
  })
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit("finalreport.Rmd", quiet = TRUE)))
  })
})
