library(shiny)
library(ggplot2)
library(dplyr)
library(downloader)

# Download the raw data file
download(url = "https://raw.githubusercontent.com/STAT545-UBC/STAT545-UBC.github.io/master/shiny_supp/2016/bcl-data.csv", destfile = "bcl-data.csv")
gapminderData<-read.delim("bcl-data.csv",sep = ",")

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

function(input, output) {
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })  
  
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }    
    
    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  
  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram()
  })
  
  output$results <- renderTable({
    filtered()
  })
}
