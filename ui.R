
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(TTR)
library(MASS)
library(markdown)
shinyUI(fluidPage(

  # Application title
  titlePanel("Attation Value Data"),
  selectInput(inputId = "file",
              label = "choose file:",
              choices = c("2015.10.09 zsm.txt","2015.10.09 wsy.txt","2015.10.08 bh.txt","2015.10.07 txy.txt"),
              selected = 20),
  sidebarLayout(
    sidebarPanel(
      sliderInput("time_average",
                  "Number of time average:",
                  min = 1,
                  max = 50,
                  value = 10),
      tabsetPanel(
        tabPanel("Documentation",includeMarkdown("documentation.md"))
      )
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("dispACF")
      
    )
    
  )
))
