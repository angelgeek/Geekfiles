library(shiny)

ui <- fluidPage(
  titlePanel("This is an action button!"),
  actionButton(inputId = "actn", 
               label = "Click Me!"),
  textOutput('hw')
)

server <- function(input, output){
  observeEvent(input$actn, 
               {output$hw <- renderText({'Hello World'}) }) 
}

shinyApp(ui=ui, server=server)