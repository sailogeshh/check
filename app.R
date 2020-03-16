
  library(shiny)
  library(bs4Dash)
  library(shinyLP)
  library(shinyWidgets)
  library(shinyBS)
  
  shiny::shinyApp(
    ui = bs4DashPage(
      navbar = bs4DashNavbar(skin = "dark",controlbarIcon = "phone",sidebarIcon = "align-justify"),#controlbarIcon = NULL
      sidebar = bs4DashSidebar(tags$head(
        tags$style(HTML("
                  .btn {
                    display:block;
                    height: 220px;
                    width:220px;
                    border-radius: 30%;
                    border: 8px solid white;

                    }

                    "))
      ),
                                             tags$style(HTML("
                                             .main-sidebar{
                                               width: 250px;
                                             }
                                           ")),
        disable = F,skin = "dark",brandColor = "gg",br(),
                               title = tags$div(h3("Anomaly detection",style="font-size:25px;color:white;font-weight:bold"),align="center"),
                               # column(id="columns",12,tags$div(selectInput("Apps", label=tags$div(h4("Choose an App:",style="font-size:30px;")),
                               #    choices=c('--Select One','Default Credit Customer','Employee Churn',"Customer Churn"),selected = '--Select One'),align="center")),
                               # 
                               # tags$div( pickerInput(
                               #   inputId = "Apps",
                               #   label = tags$div(h4("Choose an App:",style="font-size:30px;")),
                               #   choices = c('Basic Analysis','Anomaly detection - Univariate','Anomaly detection - Multivariate'),selected = 'Basic Analysis',
                               #   multiple = F,
                               #   choicesOpt =  list(
                               #     style = rep(("color: black; background: #; font-weight: #;text-align:right"),10)),
                               #   options = list(`actions-box` = TRUE)
                               # ),align="center"),
                              tags$div(bsButton("one",tags$div(h4("Basic Analysis",style="font-size:20px;font-weight:bold")),style = "primary",size = "large",type = "toggle",block = TRUE),align="center"),
        br(),                     
      tags$div(bsButton("two",tags$div(h4("Anomaly detection - Single Factor",style="font-size:20px;font-weight:bold"),align="center"),style = "danger",size = "large",type = "toggle",block = TRUE),align="center"),
      tags$div(br(),bsButton("three",tags$div(h4("Anomaly detection - Multiple Factors",style="font-size:20px;font-weight:bold;color:white"),align="center"),
                             style = "success",size = "large",type = "toggle",block = TRUE),align="center"),
       
                               #  bs4ValueBox(
                               #   value = NULL,
                               #   subtitle = tags$div(h4("Basic Analysis",style="font-size:20px;font-weight:bold"),align="center"),
                               #   status = "success",
                               #   icon = NULL,
                               #   href = "#",width = 12
                               # ),
                               # bs4ValueBox(
                               #   value = NULL,
                               #   subtitle = tags$div(h4("Anomaly detection - Single Factor",style="font-size:20px;font-weight:bold"),align="center"),
                               #   status = "danger",
                               #   icon = NULL,width = 12,#"cogs"
                               #    href = "#"
                               # ),
                               # bs4ValueBox(
                               #   value = NULL,
                               #   subtitle = tags$div(h4("Anomaly detection - Multiple Factors",style="font-size:20px;font-weight:bold;color:black"),align="center"),
                               #   status = "warning",
                               #   icon = NULL,width = 12, href = "#"#"sliders"
                               # ),tags$div(id = 'logo1',img(src="gg2.png",height='90%',width='90%'),align="center")
                               # # bs4ValueBox(
                               # #   value = NULL,
                               # #   subtitle = tags$div(h4("Anomaly detection - with past reference",style="font-size:20px;font-weight:bold"),align="center"),
                               # #   status = "info",
                               # #   icon = "arrows-alt",
                               # #   href = "#",width = 12
                               # # ),
                               # # bs4ValueBox(
                               # #   value = NULL,
                               # #   subtitle = tags$div(h4("Image Analysis",style="font-size:20px;font-weight:bold"),align="center"),
                               # #   status = "primary",
                               # #   icon = "bolt",width = 12,
                               # #    href = "#"#footer = shiny::div("Hello World"),
                               # # )
      ),
      controlbar = bs4DashControlbar(br(),br(),skin = "light",
                                     tags$div(id = 'logo1',img(src="logo.png",height='100%',width='100%'),align="center"),
          #tags$div(h5(strong("SeaportAI"),style="font-size:30px;color:white;"),align="left"),
        tags$div(class = "header", checked = NA,style="text-align:center;color:white;font-size:100%",
                 tags$a(href = "http://seaportai.com/privacy-policy/", "Privacy policy & terms..")
        ),
        tags$div(class = "header", checked = NA,style="text-align:center;color:#929292;font-size:100%",
                         tags$a(href = "http://seaportai.com/contact-us/", "Contact Us...")
        )
      ),
      footer = bs4DashFooter(
         tags$div(class = "header", checked = NA,style="text-align:center;color:#929292;font-size:100%",
                 tags$tbody("Need Help ?"),
                 tags$a(href = "http://seaportai.com/contact-us/", "Contact Us...")
        )
       
      ),
      title = "Anomaly-detection",
      body = bs4DashBody(br(), htmlOutput("frame")),
      controlbar_collapsed = TRUE,
      controlbar_overlay = TRUE,
      enable_preloader = TRUE,
      loading_duration = 2,
      loading_background = "#1E90FF",
      old_school = FALSE,
      sidebar_mini = FALSE
    ),
    server = function(input, output) {
      output$frame <- renderUI({
        if(input$one == TRUE){
          address <- "https://seaportaiapps.shinyapps.io/statspivot/"
        }
        else if(input$two == TRUE){
          address <- "https://seaportais.shinyapps.io/risk2/"
        }
        else if(input$three == TRUE){
          address <- "https://seaportaiapps.shinyapps.io/multioutlier/"
        }
        else {
          address <- "https://seaportaiapps.shinyapps.io/ssss/"
        }
        # if(input$Apps == "Anomaly detection - with past ref"){
        #   address <-  "https://seaportaiapps.shinyapps.io/anomaly/"
        # }
        # if(input$Apps == "Image Analysis"){
        #   address <-  "https://seaportai.com/contact/"
        # }
          
        
        my_test <-iframe(width = "100%",height = "860",
              url_link = address)
        my_test
      })
    }
  )
