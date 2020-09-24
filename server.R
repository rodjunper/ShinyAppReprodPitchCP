#
# This is the server logic of my Shiny web application. You can run the
# application by clicking 'Plot' button.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw the histogram
shinyServer(function(input, output) {
    # Generating data depending on Plot button click 
    myNormal <- eventReactive(input$plotButt, {
        data.frame(Normal = c(rep("A",100000),rep("B",100000)),
                   myData = c(rnorm(n = 100000, mean = input$mean1, sd = input$std1),
                   rnorm(n = 100000, mean = input$mean2, sd = input$std2)))
    })
    # Rendering the plot
    output$plot1 <- renderPlot({
            ggplot(myNormal(), aes(x = myData, col = Normal, fill = Normal)) + 
            geom_histogram(position="identity", alpha=0.75, bins = 200) +
            theme(legend.position="top") +
            labs(title="Normal Distributions",x="Values", y = "Count") +
            xlim(-200, 300)
    })
})
