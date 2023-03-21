#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

shinyUI(fluidPage(
    titlePanel("Penguins Viewer"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("slidermax", 
                        "Show penguins with max body mass of:",
                        2700, 
                        6300, 
                        value = 6300),
            sliderInput("slidermin", 
                        "Show penguins with min body mass of:",
                        2700,
                        6300, 
                        value = 2700),
            checkboxGroupInput("species_box",
                        label = "Wich species should be shown?",
                        choices = list("Adelie",
                                       "Chinstrap",
                                       "Gentoo"),
                        selected = c("Adelie","Chinstrap","Gentoo")
                        )),
        mainPanel(
            h3("Palmer penguins plot"),
            plotlyOutput("plot_penguins"),
            h3("Documentation"),
            h4("The data for this plot can be found here: https://allisonhorst.github.io/palmerpenguins/"),
            h4("To use this app you should set the following options:"),
            h5("1.- Select a max body mass, only penguins with the same or less body mass will be shown"),
            h5("2.-Select a min body mass, only penguins with the same or higher body mass will be shown"),
            h5("3.-Select the species that will be shown, options are: Adelie, Chinstrap, Gentoo.")
        )
    )
))

