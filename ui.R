library(shiny)
library(DT)

ui <- fluidPage(
  theme = "bootstrap.css",
  hr(),
  titlePanel(title=div("DEMc: An App to classify Dementia Patients",h6("Developed & Maintained by R2C2 Team")), windowTitle = ""),  
  hr(),
  sidebarLayout(
    sidebarPanel(
      # wellPanel(
      #   h4("Upload Patient Information"),
      #   hr(),
      #   #fileInput("file1", "Upload CSV File", accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
      #   #fileInput("file2", "Upload Metadata CSV File", accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
      #   hr(),
      #   #div(style="display: inline-block;vertical-align:top; width: 94%;",uiOutput("selectedcolumn")),
      #   div(style="display: inline-block;vertical-align:top; width: 49%;",numericInput("age","Age", value=70)),
      #   div(style="display: inline-block;vertical-align:top; width: 49%;",selectInput("gender","Gender",choices = c("Male","Female","Other"))),
      #   #div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("age","Stroke",choices = c("Yes","No"))),
      #   ),
      
      wellPanel(
        h4("MMSE orientation questions"),
        h5("(score 1 for a correct answer, 0 for incorrect)"),
        #hr(),
        h5("Orientation to time"),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwYR","What is the year?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwSEASON","What is the season?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwMO","What month are we in?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwDATE","What is the date?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwDW","What day of the week is it?", choices=c("0", "1"))),
        hr(),
        
        h5("Orientation to space"),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwSTATE","What country are we in?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwCITY","What city are we in?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwNAME","What district are we in?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwFLOOR","What is this place used for?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwADDRESS","What is home address?", choices=c("0", "1"))),
        div(style="display: inline-block;vertical-align:top; width: 31%;",selectInput("RwPRIME","Who is the prime minister?", choices=c("0", "1")))
        #using country instead of state for uk
        
      ),
      
      wellPanel(h4("Informant Questionnaire on Cognitive Decline in the Elderly (IQCODE)"),
                h5("(1: much improved, 2: a bit improved, 3: not much change, 4: a bit worse, 5: much worse)"),
                
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE1","Remembering things about family and friends e.g. occupations, birthdays, addresses", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE2","Remembering things that have happened recently", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE3","Recalling conversations a few days later", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE4","Remembering his/her address and telephone number", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE5","Remembering what day and month it is", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE6","Remembering where things are usually kept", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE7","Remembering where to find things which have been put in a different place from usual", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE8","Knowing how to work familiar machines around the house", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE9","Learning to use a new gadget or machine around the house", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE10","Learning new things in general", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE11","Following a story in a book or on TV", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE12","Making decisions on everyday matters", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE13","Handling money for shopping", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE14","Handling financial matters e.g. the pension, dealing with the bank", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE15","Handling other everyday arithmetic problems e.g. knowing how much food to buy, knowing how long between visits from family or friends", choices=c(1:5))),
                div(style="display: inline-block;vertical-align:top; width: 100%;",selectInput("R1IQSCORE16","Using his/her intelligence to understand what’s going on and to reason things through", choices=c(1:5))),
                
      ),
      
      wellPanel(
        div(style="display: inline-block;vertical-align:top; width: 94%;",actionButton("buttonPredictDementia", "Predict Dementia")),
      
      ),
      
      
        
    , width = 6),
  
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Patient Information",
                           # column(8, wellPanel(
                           h5("DataTable showing various test inputs for a patient."),
                           hr(),
                           DT::dataTableOutput('patientDataShow1', width = "99%", height = "20em") %>% withSpinner(color="#0dc5c1"),
                           hr(),
                           DT::dataTableOutput('patientDataShow2', width = "99%", height = "20em") %>% withSpinner(color="#0dc5c1"),
                  ),
                  tabPanel("Dementia Prediction",
                           # column(8, wellPanel(
                           h5("DataTable showing various test inputs for a patient."),
                           hr(),
                           #DT::dataTableOutput('predictionprobs', width = "99%", height = "20em") %>% withSpinner(color="#0dc5c1"),
                           hr(),
                           plotOutput("probPlot")
                           #DT::dataTableOutput('predictionaccuracy', width = "99%", height = "10em") %>% withSpinner(color="#0dc5c1"),
                  )
      )
      
    , width=6),
    
  )

)