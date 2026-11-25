library(shiny)
dig <- read.csv("DIG.csv")
dig

ui <- fluidPage(
  titlePanel("DIG Trial Dataset"),
  h3("Dataset Information"),
  verbatimTextOutput("info"),
  h3("First 6 rows"),
  tableOutput("dataPreview")
)

server <- function(input, output){

  output$info <- renderPrint({
    cat("Number of Patients:", nrow(dig), "\n")
    cat("Number of Variables:", ncol(dig), "\n")
  })
  
  output$dataPreview <- renderTable({
    head(dig)
  })
} 

shinyApp(ui = ui, server = server)
