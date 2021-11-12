fluidPage(
    titlePanel("Binomial distribution"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("n", "Sample size n", min=1, max=100, value=10),
            sliderInput("theta", "Probability of success", min=0, max=1, value=0.5)
        ),
        mainPanel(
            plotOutput("pmf"),
            plotOutput("cdf")
        )
    )
)
