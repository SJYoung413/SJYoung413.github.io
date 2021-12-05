library(shiny)
shinyUI(fluidPage(
  titlePanel("401k Growth"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "Starting 401k Value",
                  0, 50, value = 20),
    checkboxInput("showModel1", "Show/Hide X Axis Label", value = TRUE),
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("401k Growth"),
      textOutput("pred1")
    )
  )
))