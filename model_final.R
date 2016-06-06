load("UNIgram.RData")
load("BIgram.RData")
load("TRIgram.RData")
load("QUAgram.RData")

QuaPredict = function (input.words){
  
  predictions=NULL
  
  Vector = QUAgram$Value4.1==input.words[NROW(input.words)-2] & QUAgram$Value4.2==input.words[NROW(input.words)-1] & QUAgram$Value4.3==input.words[NROW(input.words)]
  
  if (length(Vector[Vector==TRUE])  > 0){ 
    
    predictions = as.character(QUAgram[Vector,c("Value4.4")])
  }
  return(predictions)
}

TriPredict = function(input.words){
  
  predictions=NULL
  
  Vector = TRIgram$Value3.1==input.words[NROW(input.words)-1] & TRIgram$Value3.2==input.words[NROW(input.words)]
  
  if (length(Vector[Vector==TRUE])  > 0){ 
    
    predictions = as.character(TRIgram[Vector,c("Value3.3")])
  }

  return(predictions)
}

BiPredict = function(input.words){
  
  predictions= NULL

  Vector = BIgram$Value2.1==input.words[NROW(input.words)] 
  
  if (length(Vector[Vector==TRUE])  > 0){ 
    
    predictions = as.character(BIgram[Vector,c("Value2.2")])
  }
  return(predictions)
}
