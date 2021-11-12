variables <- list(
    continuous=c("Frontal lobe size"="FL",
                 "Rear width"="RW",
                 "Carapace length"="CL",
                 "Carapace width"="CW",
                 "Body depth"="BD"),
    categorial=c("Species"="sp",
                 "Sex"="sex")
)

addNone <- function(x)
    c("None"="none", x)
   
                

fluidPage(
    titlePanel("Leptograpsus Variegatus Crabs"),
    sidebarLayout(
        sidebarPanel(
            selectInput("x", "x-Axis", variables$continuous, selected="BD"),
            selectInput("y", "y-Axis", variables$continuous, selected="CW"),
            selectInput("colour", "Colour", addNone(variables$categorial), selected="none"),
            selectInput("shape", "Plotting symbol", addNone(variables$categorial), selected="none")
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
)
