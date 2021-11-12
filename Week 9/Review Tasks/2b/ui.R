variables <- list(
    continuous=c("Frontal lobe size"="FL",
                 "Rear width"="RW",
                 "Carapace length"="CL",
                 "Carapace width"="CW",
                 "Body depth"="BD"),
    categorial=c("Species"="sp",
                 "Sex"="sex")
)

fluidPage(
    titlePanel("Leptograpsus Variegatus Crabs"),
    sidebarLayout(
        sidebarPanel(
            selectInput("x", "x-Axis", variables$continuous, selected="BD"),
            selectInput("y", "y-Axis", variables$continuous, selected="CW")
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
)
