install.packages("shinydashboard")
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input, output){ }

shinyApp(ui, server)
