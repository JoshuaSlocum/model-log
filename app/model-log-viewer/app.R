# Header ------------------------------------------------------------------
# Created: 1/23/2016
# Author: Joshua Slocum
# Purpose: simple function to add model call to log


# Initialize --------------------------------------------------------------
library(shiny)
log_data <- read.csv("./model_log.csv")

# Define UI for application that draws a histogram

# UI ----------------------------------------------------------------------


ui <- fluidPage(
   
   # Application title
   titlePanel("Model Log Viewer"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         DT::dataTableOutput("log_table")
      )
   )
)


# Server ------------------------------------------------------------------


# Define server logic required to draw a histogram
server <- function(input, output) {
  
   output$log_table <- DT::renderDataTable(log_data)
}

# Run the application 
shinyApp(ui = ui, server = server)

