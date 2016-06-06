library(shiny)

shinyUI(fluidPage(
  
 
  titlePanel("Coursera - Data Science Capstone Project"),
  

  sidebarLayout(
    sidebarPanel(
      textInput("sentence",
                "Your phrase:",
                "Business Analytics"),
      submitButton("Predict")
    ),
    
    
    mainPanel(
      tabsetPanel(
        tabPanel("Next Word", p("The next three predicted words for your phrase: "),
                 htmlOutput('predicted.word')
                 ,br()
                 ,p("Spell Checker: Help you with any misspelling")
                 ,dataTableOutput("mytable1")
                 )
        ),
        p("teste")
        )
      )
    )
  )
))
