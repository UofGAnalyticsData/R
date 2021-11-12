library(ggplot2)

shinyServer(function(input, output) {

    # All the computating will happen in this function
    plotdata <- reactive( {
        x <- 0:(round(input$lambda)+4*sqrt(input$lambda))
        # Set range to be 0 to the mean plus 4 standard deviations
        data.frame(x=x, pmf=dpois(x, input$lambda),
                   cdf=ppois(x, input$lambda))
    } )
     
    output$pmf <- renderPlot( {
        data <- plotdata()
        qplot(x, pmf, data=data, geom="point", xlab="x", ylab="p(x)") 
    } )

    output$cdf <- renderPlot( {
        data <- plotdata()
        qplot(x, cdf, data=data, geom="step", xlab="x", ylab="F(x)")
    } )    

})
