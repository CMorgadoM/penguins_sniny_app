#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)


shinyServer(function(input, output){
    
        
    penguins <- palmerpenguins::penguins    
    
    
    output$plot_penguins <- renderPlotly({
        
        # filter species selected in species_box 
        
        species_selected <- input$species_box
        
        p_aux <- penguins[penguins$species == species_selected[1]|
                              penguins$species == species_selected[2]|
                              penguins$species == species_selected[3], ]
        
        # filter by body mass limits
        
        p_aux <- p_aux[p_aux$body_mass_g >= input$slidermin &
                           p_aux$body_mass_g <= input$slidermax, ]
        
        # ploting the results
        
        plot_ly(data = p_aux,
                x= ~body_mass_g,
                y= ~flipper_length_mm,
                color = ~species)
    })
    
})