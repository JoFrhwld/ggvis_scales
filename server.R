
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
        mutate(gear = as.character(gear))
    })

    colorRange <- reactive({
      c(`3` = "red", `4` = "blue", `5` = "green")[sort(selected())]
    })
    
    output$jawn <- renderText(colorRange())
    
      
    mtcars%>%
      ggvis(~wt, ~mpg)%>%
      layer_points()%>%
      layer_points(data = selectedData, fill = ~gear)%>%
      scale_ordinal("fill", range = colorRange) %>% 
      bind_shiny("ggvis", "ggvis_ui")
})
