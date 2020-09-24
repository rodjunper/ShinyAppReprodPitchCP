#
# This is the user-interface definition of my Shiny web application. You can
# run the application by clicking 'Plot' button.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws the histogram of Normal distribution
shinyUI(fluidPage(
    titlePanel("Teaching: Normal Distribution format according to mean and standard deviation"),
    fluidRow(
        column(12,
               p("After select the parameters (Mean and SD), just click in the Plot button")
        )
    ),
    fluidRow(
        # The sliders to input parameters (mean and sd) for the Normal distributions
        column(3, wellPanel(
            sliderInput("mean1", "Mean A:", min = 10, max = 100, value = 50,
                        step = 5),
            sliderInput("std1", "Standard deviation A:", min = 5, max = 50, value = 25,
                        step = 5),
            sliderInput("mean2", "Mean B:", min = 10, max = 100, value = 50,
                        step = 5),
            sliderInput("std2", "Standard deviation B:", min = 5, max = 50, value = 25,
                        step = 5),
            actionButton("plotButt", "Plot")
        )),
        # The plot output
        column(6,
               plotOutput("plot1", width = 640, height = 480)
        )
    )
))
