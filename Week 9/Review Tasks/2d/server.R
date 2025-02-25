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
        normaliser <- ""
        if (input$ratio!="none") {
            crabs[,input$x] <- crabs[,input$x] /  crabs[,input$ratio]
            crabs[,input$y] <- crabs[,input$y] /  crabs[,input$ratio]
            normaliser <- paste("/", contVariables[input$ratio])
        }
        p <- ggplot(data=crabs) +
            aes_string(x=input$x, y=input$y)
        if (input$colour!="none")
            p <- p + aes_string(colour=input$colour)
        if (input$shape!="none")
             p <- p + aes_string(shape=input$shape)
        p <- p + geom_point() +
                xlab(paste(contVariables[input$x], normaliser)) + 
                ylab(paste(contVariables[input$y], normaliser))  
        p
    } )    

})
