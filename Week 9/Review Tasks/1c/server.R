library(ggplot2)

shinyServer(function(input, output) {

    plotdata <- reactive( {
        if (input$dist=="Binomial") {
            x <- 0:input$n                             # Range space
            data <- data.frame(x=x, pmf=dbinom(x, input$n, input$theta),
                               cdf=pbinom(x, input$n, input$theta))
                                                       # Binomial pmf and cdf
        } else {
            x <- 0:(round(input$lambda)+4*sqrt(input$lambda))
                                                       # Range for plot
            data <- data.frame(x=x, pmf=dpois(x, input$lambda),
                               cdf=ppois(x, input$lambda))
        }
        data            
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
