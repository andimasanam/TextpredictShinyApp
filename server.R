library(shiny)
library(tm)
library(data.table)
library(qdap)


source("model_final.R")

predictions <- as.character(NULL)
num.rows = 0


predict <- function(input) {
  
  input <- tolower(input) 
  input <- removePunctuation(input)
  input <- removeNumbers(input)
  input <- stripWhitespace(input)
  
  input.words <- strsplit(input," ")[[1]]
  SizePhrase <- length(input.words)
  
  if(SizePhrase >= 3){
    
    predictions = QuaPredict(input.words)
   
  }
    
  if(SizePhrase == 2){
    predictions = TriPredict(input.words)
  }
  
  if(SizePhrase == 1){
    predictions = BiPredict(input.words)
  }
  
  if(NROW(predictions)<3){
    uni = as.character(UNIgram[!(UNIgram$Value1.1 %in% input.words),
                               c("Value1.1")])

    
    predictions = c(QuaPredict(input.words),
                        TriPredict(input.words),
                        BiPredict(input.words))
    
    predictions = c(predictions,uni)
    predictions = unique(predictions)
    predictions = predictions[1:3]
    
  }
  
  if(NROW(predictions) > 3){
    
    predictions = unique(predictions)
    predictions = predictions[1:3]
    
  }
  
  return(predictions)
  
}


shinyServer(function(input, output) {
  
  output$predicted.word <- renderUI({
    li <- paste(paste0("<li>", predict(input$sentence), "</li>"), collapse ="" )
    li <- paste("<ul>",li,"</ul>",sep = "")
    HTML(li)
  })
  
  output$mytable1 <- renderDataTable({
    miss = which_misspelled(input$sentence,suggest=TRUE)
    miss = data.frame("Probably.Wrong" = miss$not.found,
                      "Suggestion" = miss$suggestion)
    
  },
  options = list(lengthMenu = c(20, 10, 20), pageLength = 5,
                 searching = FALSE,paging = FALSE)
  )
  
})
