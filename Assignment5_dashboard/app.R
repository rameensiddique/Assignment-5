library(shiny)
dig <- read.csv("DIG.csv")
dig

ui <- fluidPage(
  titlePanel("DIG Trial Dataset"),
  wellPanel(
    h3("What is the DIG Trial?"),
    p("The Digitalis Investigation Group Trial was a large, randomised, double-blind clinical trial that investigated the safety and effectiveness of Digoxin in patients with congestive heart failure. Participants with an ejection fraction of 45% or less were assigned to receive either Digoxin or a placebo, and outcomes such as mortality, hospitilisation and worsening heart failure were monitored. The dig.csv dataset contains outcome data from the trial.")
  ), 
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
