library(shiny)
<<<<<<< HEAD
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
=======
library(dplyr)
library(tidyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(shinythemes)
library(shinyWidgets)
library(knitr)
library(scales)
read_data <- read.csv("who_suicide_statistics.csv")

server <- function(input, output) {
  output$CHART <- renderPlotly({
    read_data <- read_data %>% 
      drop_na()
    p1 <- ggplot(data = read_data) +
      geom_line(mapping = aes(x = year, y = population))+
      scale_x_continuous(limits = input$slider2) +
      scale_y_continuous("Populartion", labels = comma)+
    # scale_x_continuous(limits = "slider2")+
    theme(text = element_text(family = "Arial"))
  
  # p1 + labs(title = "Suicide Rates", 
  #           x = "Year", y = "Population")
  })
  # observe(session$setCurrentTheme(
  #   if (isTRUE(input$dark_mode))
  #   
  #   output$max_suicide <- renderPlotly({
  #   line_graph <- suicide_data %>% 
  #   drop_na(suicides) %>% 
  #   filter(year %in% input$year) %>% 
  #   select(year, suicides, age)
  #   plot_line_graph <- ggplot(line_graph,
  #       aes(x = year, y = !!as.name(input$y_axis),
  #      color = age)) +
  #     })
  
  #output$deaths = renderText({
   # specific <- Read_Data[ which(Read_Data$region == input$Choose_Location & Read_Data$year == input$Choose_Year), ]
   # population <- specific[,3:7]
   # highest_num_deaths <- colnames(population)[apply(population,1,which.max)]
  #  paste(highest_num_deaths)
 # })
}
>>>>>>> 70ca13f (finished)
