fluidPage(
    titlePanel("Binomial and Poisson distribution"),
    sidebarLayout(
        sidebarPanel(
            selectInput("dist", "Distribution", choices=c("Binomial", "Poisson"), selected="Binomial"),
            conditionalPanel(
                condition = "input.dist == 'Binomial'",         
                sliderInput("n", "Sample size n", min=1, max=100, value=10),
                sliderInput("theta", "Probability of success", min=0, max=1, value=0.5)
           ),
            conditionalPanel(
                condition = "input.dist == 'Poisson'",
                sliderInput("lambda", "Rate", min=0, max=100, value=1)
            )
        ),
        mainPanel(
            plotOutput("pmf"),
            plotOutput("cdf")
        )
    )
)
