
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggvis)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("gear", label = "Gears", choices = c("3","4","5")) 
    ),

    # Show a plot of the generated distribution
    mainPanel(
      uiOutput("ggvis_ui"),
      ggvisOutput("ggvis"),
      textOutput("jawn"))
  )
))
