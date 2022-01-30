
# Created by Jose Fernandez
# Aug 2020

###########################

#Minimal app to showcase sport uses of fabricerin package

###########################


library(shiny)
library(fabricerin)
library(shinyalert)
library(dashboardthemes)

ui <- fluidPage(
  
  shinyDashboardThemes(theme = "purple_gradient"),
  
  use_fabric(),
  useShinyalert(),
  
  tags$br(),
  
  tabsetPanel(type = "tabs",
              
  tabPanel("Basketball",
  
  h1(strong("Drill Clipboard")),
  h4("Draw driagrams of your drills"),
  
  #first row
  tags$br(),
  
 fluidRow(
  column(width = 4,
  uiOutput("background1"),
  uiOutput("drawing1"),
  tags$br(),
  actionButton("explanation1", label = "Explanation", icon = icon("plus-square")),
  tags$br(),
  tags$br(),
  verbatimTextOutput("value1")),
  
  column(width = 2),
  
  column(width = 4,
  uiOutput("background2"),
  uiOutput("drawing2"),
  tags$br(),
  actionButton("explanation2", label = "Explanation", icon = icon("plus-square")),
  tags$br(),
  tags$br(),
  verbatimTextOutput("value2"))
 ),
  
 #second row
 
 tags$br(),
 
 fluidRow(
   column(width = 4,
          uiOutput("background3"),
          uiOutput("drawing3"),
          tags$br(),
          actionButton("explanation3", label = "Explanation", icon = icon("plus-square")),
          tags$br(),
          tags$br(),
          verbatimTextOutput("value3")),
   
   column(width = 2),
   
   column(width = 4,
          uiOutput("background4"),
          uiOutput("drawing4"),
          tags$br(),
          actionButton("explanation4", label = "Explanation", icon = icon("plus-square")),
          tags$br(),
          tags$br(),
          verbatimTextOutput("value4"))
 )
 
  ),
 
 tabPanel("Kinogram",
   
   tags$br(),
   
   fluidRow(
     
     column(width = 12,
            uiOutput("background.kin", width = "100%"),
            uiOutput("drawing.kin", width = "100%"),
            tags$a(href="https://simplifaster.com/articles/altis-kinogram-method/", "Photo Credit: The ALTIS Kinogram method."))
     
      )
   
    )
 
  )
 
)

server <- function(input, output, session) {
  
  #basketball tab
  
  #draw 1
  
  observeEvent(input$explanation1, {
    shinyalert("Drill Explanation", type = "input", inputId = "value1.1", inputType = "text")
    
  })
  
  output$value1 <- reactive ({input$value1.1})
  
  
  output$drawing1 <- renderUI ({
    
    fabric_drawing(cid = "full_court", 
                   cwidth = 700, 
                   cheight = 400, 
                   cfill = "white",
                   drawingWidth = 6)
    
    
  })
  
  
  
  output$background1 <- renderUI ({
    
    fabric_curtail(cid = "full_court",
                   imgsrc = "https://www.dropbox.com/s/3pandn308gzw6lx/full%20court.png?raw=1",
                   type = "background")
    
    
  })
  
  #draw 2
  
  observeEvent(input$explanation2, {
    shinyalert("Drill Explanation", type = "input", inputId = "value2.2", inputType = "text")
    
  })
  
  output$value2 <- reactive ({input$value2.2})
  
  
  
  output$drawing2 <- renderUI ({
    
    fabric_drawing(cid = "half_court", 
                   cwidth = 400, 
                   cheight = 400, 
                   cfill = "white",
                   drawingWidth = 6)
    
    
  })
  
  
  
  output$background2 <- renderUI ({
    
    fabric_curtail(cid = "half_court",
                   imgsrc = "https://www.dropbox.com/s/0v7uy3f7fh6vcna/halfcourt.png?raw=1",
                   type = "background")
    
    
  })
  
  #draw 3
  
  observeEvent(input$explanation3, {
    shinyalert("Drill Explanation", type = "input", inputId = "value3.3", inputType = "text")
    
  })
  
  output$value3 <- reactive ({input$value3.3})
  
  
  output$drawing3 <- renderUI ({
    
    fabric_drawing(cid = "full_court2", 
                   cwidth = 700, 
                   cheight = 400, 
                   cfill = "white",
                   drawingWidth = 6)
    
    
  })
  
  
  
  output$background3 <- renderUI ({
    
    fabric_curtail(cid = "full_court2",
                   imgsrc = "https://www.dropbox.com/s/3pandn308gzw6lx/full%20court.png?raw=1",
                   type = "background")
    
    
  })
  
  
  #draw 4
  
  observeEvent(input$explanation4, {
    shinyalert("Drill Explanation", type = "input", inputId = "value4.4", inputType = "text")
    
  })
  
  output$value4 <- reactive ({input$value4.4})
  
  
  
  output$drawing4 <- renderUI ({
    
    fabric_drawing(cid = "half_court2", 
                   cwidth = 400, 
                   cheight = 400, 
                   cfill = "white",
                   drawingWidth = 6)
    
    
  })
  
  
  
  output$background4 <- renderUI ({
    
    fabric_curtail(cid = "half_court2",
                   imgsrc = "https://www.dropbox.com/s/0v7uy3f7fh6vcna/halfcourt.png?raw=1",
                   type = "background")
    
    
  })
  
  #kinogram tab
  
  output$drawing.kin <- renderUI ({
    
    fabric_drawing(cid = "kinogram", 
                   cwidth = 700, 
                   cheight = 400, 
                   cfill = "white",
                   drawingWidth = 6)
    
    
  })
  
  
  
  output$background.kin <- renderUI ({
    
    fabric_curtail(cid = "kinogram",
                   imgsrc = "https://1xw7c62t8pgj1bq3qetvvsg1-wpengine.netdna-ssl.com/wp-content/uploads/2018/05/Crawford-15-768x304.jpg",
                   type = "background")
    
    
  })
  
  
}

shinyApp(ui = ui, server = server)


