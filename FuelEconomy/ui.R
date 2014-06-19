library(shiny)
library(AppliedPredictiveModeling)
data(FuelEconomy)

shinyUI(pageWithSidebar(
  headerPanel('k-means clustering of Fuel Economy Dataset'),
  
  sidebarPanel(
    selectInput('dataset', 'Choose Data Set', choices = c('cars2010', 'cars2011', 'cars2012')),
    selectInput('xcol', 'X Variable', names(cars2012)),
    selectInput('ycol', 'Y Variable', names(cars2012),
                selected=names(cars2012)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    p("This Shiny App allows you to explore the three data sets 
    in the FuelEconomy dataset in the Applied Predictive Modeling Package in R.")),
  
  mainPanel(
    plotOutput('plot1'),
    p("The", a(href="http://fueleconomy.gov", "http://fueleconomy.gov"),"website, run by the U.S. Department of Energy's Office of Energy Efficiency and Renewable Energy 
    and the U.S. Environmental Protection Agency, lists different estimates of fuel economy for passenger cars and trucks. 
    For each vehicle, various characteristics are recorded such as the engine displacement or number of cylinders. 
    Along with these values, laboratory measurements are made for the city and highway miles per gallon (MPG) of the car.")  
  )
))