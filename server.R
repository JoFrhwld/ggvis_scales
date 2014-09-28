
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggvis)
library(dplyr)

shinyServer(function(input, output) {
  
    selected <- reactive(input$gear)
    
    selectedData <- reactive({
      mtcars %>%
        filter(gear %in% selected())%>%
        mutate(gear = as.character(gear))%>%
        group_by(gear)
    })

    fill_domain = c("3","4","5")
    fill_range = c("red","blue","green")
      
    mtcars%>%
      ggvis(~wt, ~mpg)%>%
      layer_points()%>%
      layer_points(data = selectedData, fill = ~gear)%>%
      scale_ordinal("fill", range = fill_range, domain = fill_domain)%>%
      bind_shiny("ggvis", "ggvis_ui")
})
