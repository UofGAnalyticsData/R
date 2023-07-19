
library(shiny)

fluidPage(
  titlePanel("Here is my title"),
  sidebarLayout(
    sidebarPanel(
      p("Here is my sidebar panel"),
      sliderInput("newslider","Control Numbers",min=0,max=50,value=25)
    ),
    mainPanel(
      p("Possibly add in a table"),
      p("and maybe some plots")
    )
  )
)