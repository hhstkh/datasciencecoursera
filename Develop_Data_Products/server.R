library(shiny)
fit <- lm(mpg ~  wt + qsec + factor(am), data = mtcars)

# Define server logic for random distribution application
shinyServer(function(input, output) {
 
    newdata <- reactive({
        wtInput <- as.numeric(input$wt)
        qsecInput <- as.numeric(input$qsec)
        amInput <- as.numeric(input$am)
        
        data.frame(wt = wtInput, qsec = qsecInput, am = amInput)
    })
    
    
    output$predict <- renderPrint({
        predict(fit, newdata(), interval = "predict")
    })

    output$plot <- renderPlot({
        mtcars$transType <- factor(mtcars$am, labels = c("automatic", "manual"))
        boxplot(mpg ~ transType, data = mtcars, col = "blue", ylab = "Gasoline mileage (mile/gallon)", xlab = "Transmission", main = "Gasoline mileage on transmission")
    })
    
    # Generate a summary of the data
    output$summary <- renderPrint({
        str(mtcars)
    })
    
    

})