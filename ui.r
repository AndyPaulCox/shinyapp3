library(shiny)

# Define UI for application that draws a explores treatment histories
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Treatment Pattern Exploration"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      #slider to select sub sample size for sequence plot
      sliderInput("sub_sample","Select Sub Sample Size:", min=10, max=500, value=c(20), step = 10, round = 0, format = "#,##0.#####",
                  locale = "us", ticks = TRUE, animate = FALSE),
      #Slider to select upper and lower bounds of age range
      sliderInput("age_range","Select Age Range:", min=1, max=100, value=c(15,65), step = 5, round = 0, format = "#,##0.#####",
                  locale = "us", ticks = TRUE, animate = FALSE),
      #Radio button to select gender
      radioButtons("gender", "Select Gender:",list("Male","Female","Both"), selected = "Both"),
      #Radio button to select severity group
      radioButtons("subtype", "Select Severity Group:",list("Mild","Severe","Both"), selected = "Both"),
      #Drop down menu to slect analysis type
      selectInput("analysistype", "Select Analysis Type:", 
                  choices = c("Sequence Sub Sample", "Frequency", "Entropy","Turbulence","Cluster"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        #First tab to show visualisations
        tabPanel("Treatment",plotOutput("histPlot"),
                 #Message to inform about simulated data
       h4("**Data used in this application is simulated**")),
       #Second panel with usage instructions
      tabPanel("Usage Instructions", h2("Treatment History Explorer Application"),
               h3("Background"),
               p("The application uses (simulated) data of patient drug treatment histories 
                 and provides a number of different types of interactive visualisations
                 from time of diagnosis. The main aim of the analysis is to show how stable 
                 treatment pathways are across time. In the case where treatments where not 
                 ideal or guidelines are poor we might expect patients to change drugs
                 frequently. In cases where guidelines are good and / or treatments are 
                 successful we might expect treatment pathways to remain stable with little 
                 change in treatments."),
               h3("Usage Instructions"),
               p("One the left hand panel there are a number of controls, which are 
                 described below from top to bottom."),
               h4("Select Sub Sample Size"),
               p("This slider allow you to select the number of the randomly selected sub sample of patients
                 for sequence sub sample visualisation (see details of visualisations below)"),
               h4("Selection of Age Ranges"),
               p("This slider allows the user to select the age group to be shown in the visualisations.
                 There are two sliders, one for the minimum age and one for the maximum age in the selected age range."),
               h4("Gender"),
               p("These radio buttons allow you to create a sub sample of only males, only females or both."),
               h4("Severity Group"),
               p("The condition in question is clinically present with two recognised levels of severity; the radio button
                 allows you select the sub sample of only mild or only severe or both levels of severity"),
               h4("Analysis Type"),
               p("The drop down box allows the user to select five different types of visualisation which are detailed below."),
               h5("Sequence Sub Sample"),
               p("The sequence sub sample draws a randomly selected number of patient treatment histories (vertical axis) and plot
                 the current treatment at each day since time of diagnosis (horizontal axis). Different drugs are represented 
                 with different colours. The size of the sub sample is selected in the select sub sample size slider in the left panel."),
               h5("Frequency"),
               p("This visualisation shows the most frequent patterns of treatment for the selected patient group. With percent of all patients
                 on the vertical axis and time since diagnosis on the horizontal axis. Only the most frequent patterns are shown."),
               h5("Entropy"),
               p("This visualisation plots the entropy of the treatment patterns for the entire selected population, with time 
                 since diagnosis on the horizontal axis."),
               h5("Turbulence"),
               p("This visualisation plots the Turbulence of the treatment patterns for the entire selected population with time 
                 since diagnosis on the horizontal axis."),
               h5("Clustering"),
               p("Uses hierarchical clustering to show the ‘relatedness’ of the treatment histories in the selected patient population"),
               h3("Possible Error Messages"),
               h5("Error: Undefined columns selected."),
               p("This will usually occur when the age range, gender, severity selections result in too few or no patient being present 
                 in the sub sample. In this case the selections should be adjusted to allow a sufficient sample of patients to visualise."),
               h5("Error: cannot take a sample larger than the population when: replace = FALSE"),
               p("This error message occurs when the sub sample selected in the ‘Select Sub Sample Size’ slider, is larger than the pool
                 of patient treatment histories from which the sample is to be drawn. For example trying to show a sub sample of 300
                 patient records when there are only 200 records available."),
               h3("Notes on Future Development"),
               p("Eventually slider values will be adjusted to automatically adapt the possible selections so that error messages cannot occur.
                 Error messages will be made more users friendly and informative, instructing the user to adjust settings to correct. 
                 A tab with options for basic visualisation of patient demographics of the selected population will be added.
                 Comparative visualisations between different selected patient groups will be added")
               
               )
        
      ))
 
)))