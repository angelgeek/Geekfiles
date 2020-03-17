library(shiny)

ui <- fluidPage(
  tags$h3('100 Flip Coin Toss'),
  tags$h5('We start with a fair coin. Click buttons to update.'),
  actionButton(inputId = "fair", 
               label = "Fair Coin"),
  actionButton(inputId = "biasd", 
               label = "Unfair Coin"),
  textOutput('num_heads')
)

server <- function(input, output){
  rv <- reactiveValues(data = rbinom(100, 1, .5))
  
  observeEvent(input$fair, { rv$data <- rbinom(100, 1, .5) })   
  observeEvent(input$biasd, { rv$data <- rbinom(100, 1, .2) }) 
  
  output$num_heads <- renderText({
    tab <- as.vector(table(rv$data))
    paste('You got', tab[2], 'heads')
  })
}

shinyApp(ui=ui, server=server)