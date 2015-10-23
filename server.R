
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(TTR)
library(MASS)
shinyServer(function(input, output) {
    
  output$distPlot <- renderPlot({
    con<-file(input$file,"rt")
    readLines(con,7)
    Att1<-readLines(con,1)#get Attation data
    result1<-strsplit(substring(Att1,8),";")
    result1<- rapply(result1, function (p) as.numeric(p))
    close(con = con)
    # generate bins based on input$bins from ui.R
    x <- result1
    ts<-ts(x)
    
    ts<-SMA(ts,n=input$time_average)
    ts<-na.omit(ts)
    tt<-time(ts)
    qplot(tt,ts)+geom_line()+geom_smooth(method="lm")
    
  })
  output$dispACF <- renderPlot(
    {
      con<-file(input$file,"rt")
      readLines(con,7)
      Att1<-readLines(con,1)#get Attation data
      result1<-strsplit(substring(Att1,8),";")
      result1<- rapply(result1, function (p) as.numeric(p))
      close(con = con)
      ts<-ts(result1)
      acf(ts)
    }
  )

})
