library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(shinyWidgets)

#introduction
#page_one <- tabPanel()

#interactive page 1 
#page_two <- tabPanel()
#page_three <- tabPanel(
#h1("Bar Chart"),
#shinyUI(fluidPage(
#theme = shinytheme("journal"),
#titlePanel("Suicide Rates Between Genders"),
#sidebarLayout(
#sidebarPanel(
#uiOutput("selectgender")
#), 
#mainPanel(
#plotOutput(outputId = "genderchart")
# )
#)
#))
#)

#interactive page 2 

interactive_chart <- sidebarPanel( 
  selectInput(
    inputId = "sex", 
    label = "Choose Sex", 
    choices = list("Male" = "male", "Female" = "female"),
    selected = "Male"
  )
)


page_three <- tabPanel(
  "Gender Rates",
  setBackgroundColor(
    color = "ghostwhite"
  ),
  sidebarLayout(
    sidebarPanel (
      interactive_chart
    ), 
    mainPanel(
      h2("Suicide Rates Between Genders"), 
      plotlyOutput(outputId = "selectgender"), 
      p(em(strong("This chart showcases the suicide rates of a gender when selected, over the 
        years (1980-2015)"))),
      p("Our group also recognizes our data has only provided us with limited binary gender options, 
        and is not inclusive to all genders.")
    )
  )
)

page_six <- tabPanel(
  "Report",
  fluidPage(
    uiOutput("report")
  )
)


ui <- navbarPage(
  theme = shinytheme("journal"),
  "Final", 
  page_three,
  page_six
)















#interactive page 3
#page_four <- tabPanel()

#summary page 
#page_five <- tabPanel()

#report page 


#ui <- navbarPage(
  #tags$title("Suicide Rates Within the U.S"),
  #page_one,
  #page_second, 
  #page_three)
  #fourth_page,
  #fifth_page,
  #sixth_page

