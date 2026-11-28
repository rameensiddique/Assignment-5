#install.packages("shinydashboard")
library(shinydashboard)
dig <- read.csv("DIG.csv")

ui <- dashboardPage(
  
  dashboardHeader(title = "DIG Trial Dataset"),
  
  dashboardSidebar(
    sidebarMenu(
    
      menuItem("Home", tabName = "home", icon = icon("home")),
      
      menuItem("Variable Explorer", tabName = "variables", icon = icon("search")),
      
      menuItem("Relationships", tabName = "relationships", icon = icon("chart-line")),
      
      menuItem("Outcomes",tabName = "outcomes", icon = icon("heartbeat"))
  )
),

  dashboardBody(
    tabItems( 
      tabItem(tabName = "home",
        fluidRow(
      
         box(
          title = "About the DIG Trial",
          width = 12,
        
          "The DIG (Digitalis Investigation Group) Trial was a large randomized, double-blind clinical trial conducted across more than 300 centres in the United States and Canada. The study evaluated the safety and effectiveness of Digoxin in patients with congestive heart failure and sinus rhythm. Participants with a left ventricular ejection fraction of 45% or less were randomly assigned to receive either Digoxin or a placebo. Outcomes examined included mortality, hospitalisation, and worsening heart failure. The DIG dataset contains baseline characteristics and outcome data from the trial. To protect patient confidentiality, many variables have been anonymised and should not be used for research or publication purposes."
      ),
    
    
          box(
            title = "Dataset Overview",
            width = 12,
            
            textOutput("Patients"),
            textOutput("Variables")
          ),
    
          box(
            title = "Variable Descriptions",
            width = 6,
            
            p("ID: Patient Identifier"),
            p("TRTMT: Treatmeant assigned (Digoxin or Placebo)"),
            p("Age: Patient age in years"),
            p("SEX: Sex of the patient"),
            p("BMI: Body Mass Index"),
            p("KLevel : Serum Potassium level"),
            p("CREAT: Serum creatine levels"),
            p("SYSBP: Systolic blood pressure"),
            p("DIABP: Diastolic blood pressure")
          ),
         
          box(
            title = "Outcome Variables",
            width = 6,
            
            p("WHF: Worsening heart failure"),
            p("HOSP: Hospitilisation"),
            p("HOSPDAYS: Days spent in hospital"),
            p("DEATH: Death Outcome"),
            p("DEATHDAY: Time until death")
          ),
        
         box(
           title = "Baseline Risk Factors",
           width = 6,
           
           p("HYPERTEN: History of hypertension"),
           p("CVD: Cardiovascular disease history"),
           p("DIG: Previous digoxin use")
         )
      
        )
      ),
      
      tabItem(tabName = "variables",
              fluidRow(
                box(title = "Select a variable:",
                    width = 12,
                    
                    selectInput("variable", "Choose a variable:", choices = names(dig))),
                
                box(title = "Summary",
                    width = 12,
                    
                    verbatimTextOutput("Summary")),
                
                box(title = "Plot",
                    width = 12,
                    
                    plotOutput("Plot"))
              ))
      
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
  
  output$Summary <- renderPrint({
    summary(dig[[input$variable]])
  })
  
  output$Plot <- renderPlot({
    
    if(is.numeric(dig[[input$variable]])){
      
      hist(
        dig[[input$variable]],
        main = paste("Histogram showing", input$variable),
        xlab = input$variable,
        col = "#8856a7"
      )
    } else{
      
      barplot(
        table(dig[[input$variable]]),
        main = paste("Bar chart showing", input$variable),
        col = "#8856a7"
      )
    }
  })
} 

shinyApp(ui, server)

#Practicing pushing and pulling 
