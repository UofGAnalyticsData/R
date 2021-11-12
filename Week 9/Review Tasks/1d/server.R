library(ggplot2)

shinyServer(function(input, output) {

    plotdata <- reactive( {
        if (input$dist=="Binomial") {
            x <- 0:input$n                             # Range space
            mu <- input$n * input$theta                # Mean (for normal approx)
            sd <- sqrt(input$n * input$theta * (1-input$theta))
                                                       # Standard Dev (for normal approx)
            data <- data.frame(x=x, pmf=dbinom(x, input$n, input$theta),
                               cdf=pbinom(x, input$n, input$theta),
                               dist="Binomial", stringsAsFactors=FALSE)
                                                       # Binomial pmf and cdf
        } else {
            x <- 0:(round(input$lambda)+4*sqrt(input$lambda))
                                                       # Range for plot
            mu <- input$lambda                         # Mean (for normal approx)
            sd <- sqrt(input$lambda)                   # Standard Dev (for normal approx) 
            data <- data.frame(x=x, pmf=dpois(x, input$lambda),
                               cdf=ppois(x, input$lambda),
                               dist="Poisson", stringsAsFactors=FALSE)
          }
        if (input$normalapprox)
            data <- rbind(data,
                          data.frame(x=x, pmf=dnorm(x, mu, sd),
                               cdf=pnorm(x, mu, sd),
                               dist="Approximation by normal", stringsAsFactors=FALSE)
                          )           
        data            
    } )

     
   output$pmf <- renderPlot( {
        data <- plotdata()
        p <- qplot(x, pmf, data=data,  colour=dist, geom="point",
                   xlab="x", ylab="p(x)") 
        if (input$normalapprox) 
            p <- p + geom_line(aes(alpha=ifelse(dist=="Approximation by normal", 1, 0))) +
                scale_alpha_identity()
                              
        
        p
    } )

    output$cdf <- renderPlot( {
        data <- plotdata()
        p <- qplot(x, cdf, data=data,
                   alpha=ifelse(dist=="Approximation by normal", 0, 1),
                   # ^^ Hide normal approx by making it transparent ^^
                   colour=dist, geom="step", xlab="x", ylab="F(x)") + 
                 scale_alpha_identity()
        if (input$normalapprox) 
            p <- p + geom_line(aes(alpha=ifelse(dist=="Approximation by normal", 1, 0)))
        p
    } )    
 
})
