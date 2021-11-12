library(ggplot2)

shinyServer(function(input, output) {

    # All the computating will happen in this function
    plotdata <- reactive( {
        x <- 0:input$n                             # Range space
        data.frame(x=x, pmf=dbinom(x, input$n, input$theta),
                   cdf=pbinom(x, input$n, input$theta))
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
