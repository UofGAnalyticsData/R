library(ggplot2)
library(MASS)

contVariables <- c("FL"="Frontal lobe size",
                   "RW"="Rear width",
                   "CL"="Carapace length",
                   "CW"="Carapace width",
                   "BD"="Body depth")


shinyServer(function(input, output) {
   
    output$plot <- renderPlot( {
        data(crabs)
        p <- ggplot(data=crabs) +
            aes_string(x=input$x, y=input$y)
        if (input$colour!="none")
            p <- p + aes_string(colour=input$colour)
        if (input$shape!="none")
             p <- p + aes_string(shape=input$shape)
        p <- p + geom_point() +
                xlab(contVariables[input$x]) + 
                ylab(contVariables[input$y])  
        p
    } )    

})
