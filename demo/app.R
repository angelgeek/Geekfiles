library(shiny)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme('superhero'),
  fluidRow(
    tags$h1('The Metric 8 Ball')),
  tags$hr(),
  fluidRow(tags$img(src="8ball.jpg")),
  fluidRow(
    actionButton(inputId='ShakeMe', label='Shake Me')),
  tags$hr(),
  fluidRow(textOutput('answer'))
)

server <- function(input, output){
  observeEvent(input$ShakeMe, {
    ynm <- sample(1:3,1)
    if (ynm==2) {
      politeNo <- c("I'm swamped right now, but feel free to follow up.",
                    "I'm not qualified to do what you\'re asking. Talk with the IT department.",
                    "This isn't in my wheelhouse. You might want to talk with the product owner.",
                    "If I helped you, I'd have to let other projects down.",
                    "We would love to help you with that, but we don't have access to that data.",
                    "Biz dev is handling that.",
                    "Rob already solved this, right?",
                    "I think that is part of that other group's project. Pass that on to them.",
                    "We can't consider that. It is a permissions issue.")
      ranno <- sample(1:9,1)
      answ <- paste0("Say, '", politeNo[ranno], "'")
    }  else if (ynm==3) {
      rantime <- sample(c(1,2,3,5,8,13,21,34,55),1)
      ranunit <- sample(c(' day(s).', ' week(s).', ' year(s).', ' hour(s).', ' month(s).', ' lifetime(s).') , 1)  
      answ <- paste0("Say, 'That it is a complex project. It could take ",rantime,ranunit, "'" )
    }  else {
      verb <- c('analyzed', 'computed', 'summarized', 'determined', 'randomized', 
                'approximated', 'derived', 'reduced', 'leveraged', 'ensembled', 'optimized')
      vno <- sample(1:11,1)
      noun1 <- c('streaming data', 'production processes', 'mortality outcomes', 'operational metrics',
                 'costs', 'revenue sources', 'lives saved', 'illness prevented', 'some numbers', 
                 'forecast solution', 'predictive probability', 'pie chart', 'outlier detection algorithm',
                 'virtual data stack')
      n1no <- sample(1:14,1)
      noun2 <- c('ETL process.', 'predictive model.', 'inferential statistics.', 'Haddop script.',
                 'Baynesian model.', 'APACHE spank process.', 'advanced analytics.', 'stepwise regression.',
                 'agile approach.', 'streaming cloud technology.', 'enterprise solution.',
                 'integrated BI solution.', 'step wedge design.', 'Cloudera toad platform.',
                 'lassoed uzi index.', 'data lake with a cascading data waterfall into an \n 
                 event stream processing unit that is fully deployable within a Hadoop \n 
                 wildlife ecosystem with zookeeper installed.', 'darkside shadow IT approach.')
      n2no <- sample(1:17,1)
      ranMetric <- sample(42:150000,1)
      answ <- paste("Use the Rob approach to approximate an answer. Say,\n", 
                    "'I", verb[vno], 'the', noun1[n1no], 'using the', noun2[n2no],
                    '\nThe answer is',ranMetric,".'")
  }
    output$answer <- renderText({paste('The Metric 8 Ball indicates you should..\n', answ)})
  })
}

shinyApp(ui=ui, server=server)