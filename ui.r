library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Treatment Pattern Exploration"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("sub_sample","Select Sub Sample Size:", min=10, max=500, value=c(20), step = 10, round = 0, format = "#,##0.#####",
                  locale = "us", ticks = TRUE, animate = FALSE),
      sliderInput("age_range","Select Age Range:", min=1, max=100, value=c(15,65), step = 5, round = 0, format = "#,##0.#####",
                  locale = "us", ticks = TRUE, animate = FALSE),
      radioButtons("gender", "Select Gender:",list("Male","Female","Both"), selected = "Both"),
#       checkboxGroupInput("region", "Select Regions:",list("1","2","3","4","5","6","7","8","9","10","11","12","13"),
#                          selected = NULL),
      radioButtons("subtype", "Select Severity Group:",list("Mild","Severe","Both"), selected = "Both"),
      selectInput("analysistype", "Select Analysis Type:", 
                  choices = c("Sequence Sub Sample", "Frequency", "Entropy","Turbulence","Cluster"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
#         tabPanel("Summary", plotOutput("output$histPlot"),
#                  helpText("**Data used in this application is simulated**")
#                  ),
       tabPanel("Summary", textOutput("textDisplay")),
        tabPanel("Treatment",plotOutput("histPlot"),
                 h4("**Data used in this application is simulated**"))
      ))
 
)))