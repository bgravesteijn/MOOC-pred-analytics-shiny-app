
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Clinical Decision Making"),

  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
      list(sliderInput("fpr", "False positive rate", min=0, max=0.5, value=0),
           sliderInput("fnr", "False negative rate", min=0, max=0.5, value=0),
           sliderInput("Toll", "Toll of the test", min=0, max=0.02, value=0)
           )
      
      ),
    
    # Show the plot of the decision figure
    mainPanel(
      plotOutput("distPlot")
    )
  )
))


rsconnect::setAccountInfo(name='leidenphm',
                          token='82EFA2940E83CA410D351A365D088AC4',
                          secret='z/CdqhuEBPBW3ll4/fVPd1IFYyiy4rt1+p1vsAhq')
