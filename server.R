
server <- function(input, output, session) {
  
  ## Define max file size
  options(shiny.maxRequestSize=530*1024^2)
  #options(DT.options = list(pageLength = 15))
  options(DT.options = list(scrollX = TRUE))
  source('global.R', local = TRUE)
  
  ## Read answers for patient from UI and show back 
  patient_data_collect <- eventReactive(input$buttonPredictDementia, ignoreNULL = TRUE, ignoreInit = FALSE, {
    # validate(
    #   #need(as.character(input$RwYR) !=  "Select Column", "Please select patient year score")
    # )
    # validate(
    #   #need(as.character(input$RwADDRESS) !=  "Select Column", "Please select patient address score")
    # )
    
    patient_data <- as.data.frame(data_frame(r1yr=as.integer(input$RwYR),r1season=as.integer(input$RwSEASON),r1mo=as.integer(input$RwMO),
                                             r1date=as.integer(input$RwDATE),r1dw=as.integer(input$RwDW),r1state=as.integer(input$RwSTATE),
                                             r1name=as.integer(input$RwNAME),r1city=as.integer(input$RwCITY),r1floor=as.integer(input$RwFLOOR),
                                             r1address=as.integer(input$RwADDRESS),r1prime=as.integer(input$RwPRIME),IQSCORE1=as.integer(input$R1IQSCORE1),
                                             IQSCORE2=as.integer(input$R1IQSCORE2),IQSCORE3=as.integer(input$R1IQSCORE3),IQSCORE4=as.integer(input$R1IQSCORE4),
                                             IQSCORE5=as.integer(input$R1IQSCORE5),IQSCORE6=as.integer(input$R1IQSCORE6),IQSCORE7=as.integer(input$R1IQSCORE7),
                                             IQSCORE8=as.integer(input$R1IQSCORE8),IQSCORE9=as.integer(input$R1IQSCORE9),IQSCORE10=as.integer(input$R1IQSCORE10),
                                             IQSCORE11=as.integer(input$R1IQSCORE11),IQSCORE12=as.integer(input$R1IQSCORE12),IQSCORE13=as.integer(input$R1IQSCORE13),
                                             IQSCORE14=as.integer(input$R1IQSCORE14),IQSCORE15=as.integer(input$R1IQSCORE15),IQSCORE16=as.integer(input$R1IQSCORE16)))
    
    testing <- patient_data[,c(1:11)]
    testing$r1jormscore <- rowMeans(patient_data[,c(12:27)])
    load("ML-models.rdata")
    model <- models[[6]]
    predictions <- model %>% predict(testing)
    predictions
    
    ## make graph
    predictions <- predict(model, newdata = testing, type = "prob")
    row.names(predictions) <- row.names(testing)
    predictions_prob <- data.frame(predictions)
    predictions <- predict(model, newdata = testing)
    predictions
    predictions_prob$Predicted_class <- predictions
    colnames(predictions_prob) <- c("Dementia","Healthy","Prediction")
    if(predictions_prob$Prediction=="responder"){
      predictions_prob$Prediction <- "Dementia"
    }else{
      predictions_prob$Prediction <- "Healthy"
    }
    ## Plot with ggplot
    df <- data.frame(Prediction=c("Dementia", "Healthy"),
                     Probability=c(round(predictions_prob$Dementia,2),round(predictions_prob$Healthy,2)))
    p<-ggplot(df, aes(x=Prediction, y=Probability, fill=Prediction)) +
      geom_bar(stat="identity")+theme_minimal()+
      geom_text(aes(label=Probability), vjust=1.6, color="white",
                position = position_dodge(0.9), size=3.5)
    #p
    
    return(list(patient_data[,c(1:11)],patient_data[,c(12:27)],p))
  })
  
  
  output$patientDataShow1 = DT::renderDataTable(DT::datatable(patient_data_collect()[[1]], escape=FALSE,
                                                            options = list(
                                                              pageLength = 5, autoWidth = TRUE,
                                                              columnDefs = list(list( targets = 6, width = '100px')),
                                                              scrollX = TRUE
                                                            )))
  output$patientDataShow2 = DT::renderDataTable(DT::datatable(patient_data_collect()[[2]], escape=FALSE,
                                                             options = list(
                                                               pageLength = 5, autoWidth = TRUE,
                                                               columnDefs = list(list( targets = 6, width = '100px')),
                                                               scrollX = TRUE
                                                             )))
  
  
  output$probPlot <- renderPlot({
        return(patient_data_collect()[[3]])
      })
  output$rocPlot <- renderPlot({
    return(gse87211_validate()[[2]])
  })
  

  

}