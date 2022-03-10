pacman::p_load(shiny,stringr)

setwd("D:/study/data science capstone/milestone report")

bigram=readRDS("bi.rds")
trigram=readRDS("tri.rds")
quadgram=readRDS("quad.rds")
quintgram=readRDS("quint.rds")
hexgram=readRDS("hex.rds")

msg="Next word is"

# Cleaning of user input before predicting the next word


predict=function(x) {
  x=strsplit(x, " ")[[1]]
  if (length(x) == 5) {
    x=tail(x,5)
    if (hexgram$word1 == x[1] & hexgram$word2 == x[2] & hexgram$word3 == x[3] & hexgram$word4 == x[4] & hexgram$word5 == x[5]){
      {msg<<-"No match."; "N/A"}
    }
    else {msg; head(hexgram[hexgram$word1 == word(x,1) & hexgram$word2 == word(x,2) & hexgram$word3 == word(x,3)
                            & hexgram$word4 == word(x,4) & hexgram$word5 == word(x,5), 6],5)}}
  
  else if (length(x) == 4) {
    x=tail(x,4)
    if (quintgram$word1 == x[1] & quintgram$word2 == x[2]  & quintgram$word3 == x[3] & quintgram$word4 == x[4]){
      {msg<<-"No match."; "N/A"}    }
    else {msg ; head(quintgram[quintgram$word1 == x[1] & quintgram$word2 == x[2] & quintgram$word3 == x[3]
                            & quintgram$word4 == x[4], 5],5)}
  }
  
  else if (length(x) == 3) {
    x=tail(x,3)
    if (quadgram$word1 == x[1]  & quadgram$word2 == x[2]  & quadgram$word3 == x[3]) {
      {msg<<-"No match."; "N/A"}
      }
    else {msg ; head(quadgram[quadgram$word1 == x[1] & quadgram$word2 == x[2] & quadgram$word3 == x[3], 4],5)}
  }
  
  else if (length(x) == 2){
    x=tail(x,2)
    if (trigram$word1 == x[1] & trigram$word2 == x[2]) {
      {msg<<-"No match."; "N/A"}
    }
    else {msg ; head(trigram[trigram$word1 == x[1] & trigram$word2 == x[2],3],5)}
  }
  else if (length(x) == 1){
    x=tail(x,1)
    if (identical(character(0),head(bigram[bigram$word1 == word(x,1), 2],1))) {msg<<-"No match."; "N/A"}
    else {msg ; head(bigram[bigram$word1 == x[1],2],5)}
  }
}


shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- predict(input$inputString)
    output$text2 <- renderText({msg})
    result
  });
  
  output$text1 <- renderText({
    input$inputString});
}
)