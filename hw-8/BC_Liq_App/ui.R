fluidPage(
  #Added BC Liquor store logo to the web application
  titlePanel(title=div(img(src="BC_Liquor_Store_logo.png", height = 50)), windowTitle = "BC Liquor Store Prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(),
      br(),
      # Added a download button to download the results returned
      downloadButton('downloadData', 'Download Results'),
      br(),
      br(),
      br(),
      tableOutput("results")
    )
  )
)