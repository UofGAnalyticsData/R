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
        ggplot(data=crabs) +
            aes_string(x=input$x, y=input$y) +
            geom_point() +        
            xlab(contVariables[input$x]) + 
            ylab(contVariables[input$y])  
    } )    

})
