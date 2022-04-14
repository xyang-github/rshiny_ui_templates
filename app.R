library(shiny)
library(waiter)

options(shiny.maxRequestSize=200*1024^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "app.css"),
    tags$link(rel = "stylesheet", href = "https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"),
    tags$script(src = "app.js"),
    tags$script("
      Shiny.addCustomMessageHandler('remove_load_server', function(message) {
        $('#header_database').removeClass('animate-flicker');
        $('#header_database').text('Select a database:');
        $('#select_database_wrapper').removeClass(message);
        $('#select_database_wrapper').addClass('is-info');
        $('#select_database').prop('disabled', false);});

      Shiny.addCustomMessageHandler('remove_load_submit', function(message) {
        $('#btn_submit').removeClass(message);})")
  ),
  fluidRow(
    column(width = 8, offset = 2,
           fluidRow(
             tags$h4("Select a model vendor:")),
           fluidRow(
             column(width = 6,
                    tags$button(class = "button is-small is-info is-outlined
                                shiny-bound-input action-button",
                                id = "btn_air", "AIR")),
             column(width = 6,
                    tags$button(class = "button is-small is-info is-outlined
                                shiny-bound-input action-button",
                                id = "btn_rms", "RMS"))
             ),
           fluidRow(
             tags$h4(id = "header_server",
                     class = "hidden",
                     "Select a server:")
           ),
           fluidRow(
             tags$div(class = "select is-info is-fullwidth hidden",
                      id = "select_server_wrapper",
                      tags$select(
                        id = "select_server",
                        tags$option(selected = TRUE, ""),
                        tags$option("Option 1"),
                        tags$option("Option 2")

                        )
                      )
           ),
           fluidRow(
             tags$h4(id = "header_database",
                     class = "hidden animate-flicker",
                     "Loading the database...")
           ),
           fluidRow(
             tags$div(class = "select is-info is-fullwidth is-loading hidden",
                      id = "select_database_wrapper",
                      tags$select(
                        id = "select_database",
                        disabled = TRUE,
                        tags$option(selected = TRUE, "")
                      )
             )),
           fluidRow(
             tags$button(class = "button is-fullwidth is-rounded is-outlined
                         is-info shiny-bound-input action-button",
                         id = "btn_submit",
                         "Submit Dataset")
           )
           )
    ))

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  # Remove loading spinner after database has loaded, and updates selection
  # options
  observeEvent(input$select_server, {
    req(input$select_server)

    Sys.sleep(3)
    updateSelectInput(inputId = "select_database",
                      choices = c("Option 1", "Option 2"))

    session$sendCustomMessage(type = "remove_load_server",
                              message = "is-loading")
  })

  # Remove loading spinner after an event has completed
  observeEvent(input$btn_submit, {
    Sys.sleep(3)

    session$sendCustomMessage(type = "remove_load_submit",
                              message = "is-loading")
  })

}

# Run the application
shinyApp(ui = ui, server = server)
