library(shiny)

# tab for our report 

tab_report <- tabPanel(
  "Report",
  fluidRow(
    column(
      12,
      includeMarkdown("tabs/finalreport.md")
    )
  )
)


