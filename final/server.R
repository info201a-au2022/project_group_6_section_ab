library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(shinyWidgets)
library(plotly)
library(knitr)
library(scales)
us_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/us_data.csv")

gender_data <- us_data %>%
  filter(sex %in% c("male", "female"))

age_data <- us_data %>%
  filter(age %in% c("5-14 years", "15-24 years", 
                    "25-34 years", "35-54 years", 
                    "55-74 years", "75+ years"))

server <- (function(input, output) {
#Chart 1 
  output$agescatter <- renderPlotly({
    scatterplot <- age_data %>%
      drop_na(suicides) %>%
      filter(age %in% input$age)%>%
      select(year, suicides, age)
    plot_scatter <- ggplot(scatterplot, 
                           aes(x= year, y= suicides),
                               color= age) +
                    geom_bar(stat = "identity")+
                    labs(title = "Suicide Rates Between Age Groups")
    return(plot_scatter)
  })

#Chart 2 
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
  
#Chart 3 
  output$CHART <- renderPlotly({
    read_data <- unique(us_data) %>% 
      select(year, suicides, population) %>%
      drop_na(suicides, population)
    p1 <- ggplot(data = read_data, aes(x = year, y = suicides)) +
      geom_bar(stat = "identity")+
      scale_x_continuous(limits = input$slider2) +
      scale_y_continuous("Suicides", labels = comma)+
      theme(text = element_text(family = "Arial")) 
})
  
#Reports Page 
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit("finalreport.Rmd", quiet = TRUE)))
  })
  
})
