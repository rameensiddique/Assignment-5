#install.packages("shinydashboard")
library(shinydashboard)
dig <- read.csv("DIG.csv")

ui <- dashboardPage(
  dashboardHeader(title = "DIG Trial Dataset"),
  dashboardSidebar(),
  dashboardBody(
    
    box(
      title = "About the DIG Trial",
      width = 12,
      
      "The DIG (Digitalis Investigation Group) Trial was a large randomized,
      double-blind clinical trial that investigated the safety and effectiveness
      of Digoxin in patients with congestive heart failure. Participants were
      assigned to receive either Digoxin or a placebo, and outcomes such as
      mortality, hospitalisation, and worsening heart failure were assessed."
    ),
    
    
    box(
      title = "Dataset Overview",
      width = 12,
      
      textOutput("Patients"),
      textOutput("Variables")
    )
  )
)

server <- function(input, output){
  
  output$Patients <- renderText({
    paste("Number of patients:", nrow(dig))
  })
  
  output$Variables <- renderText({
    paste("Number of variables:", ncol(dig))
  })
}

shinyApp(ui, server)
