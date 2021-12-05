library(shiny)
shinyServer(function(input, output) {
  model1<-lm(hp ~mpg, data=mtcars)
  
  model1pred<-reactive({
    mpgInput<-input$sliderMPG
    predict(model1, newdata =data.frame(mpg=mpgInput)) 
  })
  
  output$plot1 <- renderPlot({
    mpgInput<-input$sliderMPG
    
    plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon", ylab = "Horsepower", bty ="n" , pch = 16,
         xlim = c(10, 35), ylim = c(50, 350))
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
    legend(23, 250,c("Model 1 Prediction"), pch = 16, col = c("red"),bty ="n", cex=1.2)
    points(mpgInput, model1pred(), col ="red", pch= 16, cex= 2)
  })
  output$pred1<-renderText({
    model1pred()
  })
})