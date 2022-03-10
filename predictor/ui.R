library(shiny)

# Predict Next Word application UI defined 

shinyUI(navbarPage("Data Science Capstone: Final Project",
                   tabPanel("Next word prediction",
                            titlePanel("Next word prediction app"),
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Enter word(s) for prediction:"),
                                textInput("inputString", "Input",value = "")
                              ),
                              # Main panel to display the results of the word prediction
                              mainPanel(
                                h2("Predicted next word (the most common 5 words)"),
                                verbatimTextOutput("prediction")
                              )
                            )
                            
                   )
                   )
)


