library(ggplot2)
library(MASS)

shinyServer(function(input, output) {
   
    output$plot <- renderPlot( {
        data(crabs)
        ggplot(data=crabs) +
            aes(x=BD, y=CW) +
            geom_point() +
            xlab("Body depth") + 
            ylab("Carapace width")
    } )    

})
