library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(shinyWidgets)
library(plotly)
library(knitr)

us_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project_group_6_section_ab/main/data/us_data.csv")

#introduction
page_one <- tabPanel(
  "Introduction", 
  img(src="intro.png", width = "1000", height = "300"),
  h2("Introduction"), 
  p("Suicide is one of the leading causes of death within the United States. 
    Issues in regards to mental health and suicide have played an enormous role within our country, our communities, and the lives of our loved ones. 
    This is an issue that must be addressed immediately. Through this page, we hope to highlight the extent to which suicide has impacted the U.S. and 
    we hope to spread awareness by educating users of suicide rates within the past decades."), 
  
  h2("Problem Domain"), 
  p("Within the year 2020, the United States alone estimated that there were 1.20 million attempted suicides and about 46,000 actual deaths. 
  According to the CDC’s article “Facts About Suicide”, when someone does suicide and or attempts it, the mental health and well-being of friends, 
  loved ones, co-workers, and the community is negatively affected. Many times these loved ones will also experience feelings of shock, anger, guilt, 
  symptoms of depression or anxiety. The only way we can change this and protect each other is by talking about these hard topics and being there for one another. 
  It is very important for people to understand how much of an impact this has on our society as a whole."),
  p("Direct stakeholders in regards to the people who are impacted by suicide are the individuals who commit suicide themselves.
  These individuals often struggle with mental health and feel as though suicide is the only possible solution to their issues. 
  Indirect stakeholders, and people who are impacted by the suicide of others include parents, siblings, families, friends, therapists, 
  and communities of those who have committed suicide. If individuals who are struggling with mental health do not seek help from the their family, friends, therapist, 
  and community it may be difficult for indirect stakeholders to identify early signs of suicide within people who are struggling."), 
  p("Due to cultural values within various households, suicide and mental health are oftentimes subjects that are shunned upon and rarely spoken about. Religious beliefs 
  and uncomfortable conversations due contribute to the continuous suicide rate. It is important for suicide and mental health to be addressed within households because this 
  can be where the issue starts."), 
  p("The benefit to tacking the issue of suicide first hand helping others get back on their feet and changing their lives for the better. By addressing suicide, more people will 
    be willing to come forward and seek help. The harm of not tackingling the issue of suicide immediately can cause the pattern to continue. In order to prevent deaths by suicide, 
    awareness must be spread. For example, families, friends, and communities can seek resources to help them gain a better understanding on signs and symptoms of suicide to look for within 
    individuals struggling with mental health. These signs include talking about feeling trapped or in unbearable pain, talking about being a burden to others, increasing the use of alcohol or drugs, 
    acting anxious or agitated; behaving recklessly, sleeping too little or too much, withdrawing or feeling isolated, showing rage or talking about seeking revenge, and displaying extreme mood swings. 
    In addition, there are therapists and hotlines that can be used to help individuals with mental health and thoughts of suicide."), 
  
  h2("Research Questions"),
  p(em(strong("What age group has the highest suicide rate?"))), 
  p(em(strong("Is suicide more common in the male or female population?"))),
  p(em(strong("What is the trend of suicide rates over the past few years?"))),
  
  h2("Data Analyzed"), 
  p("Our dataset specifically focuses on long-time trends of suicide rates between different countries. Suicide cases has been a prevalent issue within countries worldwide; not excluding the U.S. 
    There are many factors that could lead or motivate an individual to commit suicide. These factors can be both social or political. Mental health is an important issue to recognize. Recognizing 
    these rates allows others to be aware of the trends that could be increasing and how we can make plans of actions to decrease these trends. Our problem domain is to specifically focus on suicide rates 
    within the U.S; which leads us to question and compare the trends of suicide over the years and potentially what its leading factors. Our dataset provides us with important information, alongside suicide rates, 
    the years, sex group, age range, and population of the country. In order for us to be able to answer our research questions, these variables of data provided from our dataset are essential in being able to compare 
    trending rates. With these variables we can specifically determine if suicide rates are more prevalent in relation to certain age groups, genders, or country. Overall, our goal is to fulfill the purpose of our dataset
    by spreading awareness towards these issues.")
)


#interactive page 1 
interactive_chart <- sidebarPanel(
  checkboxGroupInput(
    inputId = "age", 
    label= "Choose an Age Group", 
    choices = list("5-14 years" = "5-14 years", 
                   "15-24 years" = "15-24 years",
                   "25-34 years" = "25-34 years", 
                   "35-54 years" = "35-54 years",
                   "55-74 years" = "55-74 years", 
                   "75+ years" = "75+ years")
  )
)

page_two <- tabPanel(
  "Age Rates", 
  sidebarLayout(
    sidebarPanel (
      interactive_chart
    ),
    mainPanel(
      h2("Age Group Rates"), 
      plotlyOutput(outputId = "agescatter"), 
      p(em(strong("This chart showcases the suicide rates of an age group when selected over the 
        years (1980-2015). 
        Suicide numbers are measured in thousands (1 = 1,000 individuals)."))),
    )
  )
)

#interactive page 2 
interactive_chart2 <- sidebarPanel( 
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
      interactive_chart2
    ), 
    mainPanel(
      h2("Suicide Rates Between Genders"), 
      plotlyOutput(outputId = "selectgender"), 
      p(em(strong("This chart showcases the suicide rates of a gender when selected, over the 
        years (1980-2015). Suicide numbers are measured in thousands (1 = 1,000 individuals)")))
    )
  )
)

#interactive page 3 
page_four <- tabPanel(
  "Suicide Trends",
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider2", label = h3("Select Year"), min = 1980, sep = "", 
                  max = 2021, value = c(1980, 2021))
    ),
    mainPanel(
      h2("Suicide Trends"),
      plotlyOutput(outputId = "CHART"), 
      p(em(strong("This chart showcases the overall suicide trends over the years 
                  (1980-2021). Suicide numbers are measured in thousands (1 = 1,000 individuals)")))
    )
  )
)

#summary page 
page_five <- tabPanel(
  "Summary",
  h1("Summary"),
  p("Suicide is a serious public health problem that can
  have long-lasting effects on individuals, families,
  and communities. The message we are trying to convey 
  is that we need change, no one should ever have to take 
  their own life. Mental health is just as essential as your physical health. 
  We need to start normalizing asking others to share and talk about their own mental health. 
  Because the more we talk about it the more we can help one another with our problems and get the 
  necessary help we need. Having poor mental health can cause a lot of problems and complications in your life. 
  When people’s mental illness go untreated that is when people's lives start to go haywire more or less. Causing 
  them a whole lot of unnecessary troubles that just worsen their mental health situation, which is what inevitably 
  causes some people to consider taking their own life. At the end of the day we need change because we are losing to many 
  people to suicide and it didn’t start today it’s been going on for decades as can be seen by our dataset.")
)

#reports page 
page_six <- tabPanel(
  "Report",
  fluidPage(
    uiOutput("markdown")
  )
)

ui <- navbarPage(
  theme = shinytheme("journal"),
  "Suicides Within America",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six
)
