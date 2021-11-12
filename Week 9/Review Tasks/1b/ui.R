fluidPage(
    titlePanel("Poisson distribution"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("lambda", "Rate", min=0, max=100, value=1)
        ),
        mainPanel(
            plotOutput("pmf"),
            plotOutput("cdf")
        )
    )
)
