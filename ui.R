library(shiny)

shinyUI(fluidPage(
  
 
  titlePanel("Coursera Capstone Next Word Prediction Project"),
  

  sidebarLayout(
    sidebarPanel(
      textInput("sentence",
                "Your phrase:",
                "Have a nice"),
      submitButton("Predict")
    ),
    
    
    mainPanel(
      tabsetPanel(
        tabPanel("Next Word", p("The next three predicted words for your phrase: "),
                 htmlOutput('predicted.word')
                 ,br()
                 ,dataTableOutput("mytable1")
                 ), 
        
        tabPanel("Help me", 
                 p("Put you phrase a textbox and press predict button."),
                 p("you will see 5 word as suggestion for your next word in your phrase."),
        p("teste")
        )
      )
    )
  )
))
