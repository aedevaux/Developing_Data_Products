palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
library(AppliedPredictiveModeling)
## Import FuelEconomy data from the APM model
data(FuelEconomy)

## Change the factor variables in the three data sets to numeric

cars2012$Transmission <- as.numeric(cars2012$Transmission)
cars2012$AirAspirationMethod <- as.numeric(cars2012$AirAspirationMethod)
cars2012$DriveDesc <- as.numeric(cars2012$DriveDesc)
cars2012$CarlineClassDesc <- as.numeric(cars2012$CarlineClassDesc)

cars2011$Transmission <- as.numeric(cars2011$Transmission)
cars2011$AirAspirationMethod <- as.numeric(cars2011$AirAspirationMethod)
cars2011$DriveDesc <- as.numeric(cars2011$DriveDesc)
cars2011$CarlineClassDesc <- as.numeric(cars2011$CarlineClassDesc)

cars2010$Transmission <- as.numeric(cars2010$Transmission)
cars2010$AirAspirationMethod <- as.numeric(cars2010$AirAspirationMethod)
cars2010$DriveDesc <- as.numeric(cars2010$DriveDesc)
cars2010$CarlineClassDesc <- as.numeric(cars2010$CarlineClassDesc)

shinyServer(function(input, output, session) {
  
  #Choose dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "cars2010" = cars2010,
           "cars2011" = cars2011,
           "cars2012" = cars2012)
  })
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    datasetInput()[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
})