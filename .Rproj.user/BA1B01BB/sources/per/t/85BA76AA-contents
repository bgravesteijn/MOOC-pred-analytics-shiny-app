
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({

    no_rx <- function(x){0.99-(0.99-0.90)*x}
    rx    <- function(x){0.975-(0.975-0.93)*x}
    
    netharm    <- 0.015
    netbenefit <- 0.030
    test <- function(x){
        itcpt <- 0.99-(netharm*input$fpr) 
        slope <- -(itcpt-(0.93-(netbenefit*input$fnr))) 
        res <- (itcpt+slope*x)-input$Toll
        return(res)
        }
    
    x_val <- seq(0,1, by=0.05)
    plot.df <- expand.grid(x=x_val,
                           y=NA,
                           label=c("No PCI", "PCI", "Test"))
    plot.df$y[plot.df$label=="No PCI"] <- no_rx(x_val)
    plot.df$y[plot.df$label=="PCI"] <- rx(x_val)
    plot.df$y[plot.df$label=="Test"] <- test(x_val)
    
    ggplot(plot.df, aes(x=x, y=y, col=label))+
      geom_line(cex=2)+
      theme_bw()+
      scale_y_continuous(limits=c(0.9,1),
                         minor_breaks = seq(0.9, 1, 0.005), 
                         breaks = seq(0.9, 1, 0.01))+
      scale_x_continuous(minor_breaks=seq(0, 1, 0.05),
                         breaks=seq(0,1,0.1))+
      scale_color_discrete("Legend")+
      xlab("Risk of heart attack")+
      ylab("10-year event free survival")+
      theme(text=element_text(size=16))

    # # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2]
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    # # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
