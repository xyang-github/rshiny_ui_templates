library(shiny)
library(sass)

sass(
  sass_file("www/app.scss"),
  "www/app.css",
  options = sass_options(
    output_style = "compressed",
    source_map_embed = TRUE
  )
)

# Define UI for application that draws a histogram
ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "app.css"),
    # tags$link(rel = "stylesheet", href = "https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"),
    # tags$link(rel = "stylesheet", href = "https://cdn.jsdelivr.net/gh/octoshrimpy/bulma-o-steps@master/bulma-steps.css"),
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"),
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
  fluidRow(class = "hero is-fullwidth",
           tags$div(class = "hero-body",
                    tags$p(class = "title", "Title"),
                    tags$p(class = "subtitle", "Subtitle"))

  ),
  fluidRow(class = "pl-2 pr-2",
    tags$ul(class = "steps has-gaps is-small has-content-centered is-balanced",
            tags$li(class = "steps-segment is-active is-dashed",
                    id = "step-model",
                    tags$div(class ="steps-marker is-info is-hollow",
                             id = "marker-model"),
                    tags$div(class = "steps-content",
                             "Model Vendor"
                             )),
            tags$li(class = "steps-segment is-dashed",
                    id = "step-server",
                    tags$div(class = "steps-marker",
                             id = "marker-server"),
                    tags$div(class = "steps-content",
                             "Server")
                    ),
            tags$li(class = "steps-segment is-dashed",
                    id = "step-database",
                    tags$div(class ="steps-marker",
                             id = "marker-database"),
                    tags$div(class = "steps-content",
                             "Database")
                    ),
            tags$li(class = "steps-segment is-dashed",
                    tags$div(class = "steps-marker"),
                    tags$div(class = "steps-content",
                             "Portfolio")
                    ),
            tags$li(class = "steps-segment is-dashed",
                    tags$div(class ="steps-marker"),
                    tags$div(class = "steps-content",
                             "Peril")
                    ),
            tags$li(class = "steps-segment is-dashed",
                    id = "steps-bob",
                    tags$div(class ="steps-marker"),
                    tags$div(class = "steps-content",
                             "Book of business")
            ),
            tags$li(class = "steps-segment is-dashed",
                    id = "steps-date",
                    tags$div(class = "steps-marker"),
                    tags$div(class = "steps-content",
                             "As of Date")
            ),
            tags$li(class = "steps-segment is-dashed",
                    id = "steps-description",
                    tags$div(class ="steps-marker"),
                    tags$div(class = "steps-content",
                             "Description")
            ),
            tags$li(class = "steps-segment is-dashed",
                    tags$div(class = "steps-marker"),
                    tags$div(class = "steps-content",
                             "Submit")),

  )),
  fluidRow(class = "mt-4",
    column(width = 8, offset = 2,
           fluidRow(
             tags$h4("Model vendor"),
             tags$button(class = "button is-info is-outlined
                         shiny-bound-input action-button",
                         id = "btn_air", "AIR"),
             tags$button(class = "button is-info is-outlined
                       shiny-bound-input action-button",
                       id = "btn_rms", "RMS")),
           fluidRow(
             tags$h4(id = "header_server",
                     class = "hidden",
                     "Server:"),
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
                     "Loading the database..."),
             tags$div(class = "select is-info is-fullwidth hidden",
                      id = "select_database_wrapper",
                      tags$select(
                        id = "select_database",
                        disabled = TRUE
                        )
             )),
           fluidRow(
             column(width = 6,
                    class = "pl-0 pr-1",
                    tags$h4(id = "header_portfolio",
                            class = "hidden",
                            "Portfolio"),
                    tags$div(class = "select is-info is-fullwidth hidden",
                             id = "select_portfolio_wrapper",
                             tags$select(
                               id = "select_portfolio",
                               tags$option("Option 1"),
                               tags$option("Option 2")
                             ))
                    ),
             column(width = 6,
                    class = "pl-0 pr-0",
                    tags$h4(id = "header_peril",
                            class = "hidden",
                            "Peril"),
                    tags$div(class = "select is-info is-fullwidth hidden",
                             id = "select_peril_wrapper",
                             tags$select(
                               id = "select_peril",
                               tags$option("Option 1"),
                               tags$option("Option 2")
                             ))
             )),
           fluidRow(
             column(width = 6,
                    class = "pl-0 pr-1",
                    tags$h4(id = "header_bob",
                            class = "hidden",
                            "Book of business"),
                    tags$div(class = "select is-info is-fullwidth hidden",
                             id = "select_bob_wrapper",
                             tags$select(
                               id = "select_bob",
                               tags$option("Option 1"),
                               tags$option("Option 2")
                             ))
                    ),
             column(width = 6,
                    class = "pl-0 pr-0",
                    tags$h4(id = "header_date",
                            class = "hidden",
                            "As Of Date"),
                    tags$div(class = "hidden",
                             dateInput(inputId = "select_date",
                                       label = NULL)
                             )
                    )
           ),

           fluidRow(
             tags$button(class = "button is-fullwidth is-rounded is-outlined
                         is-info shiny-bound-input action-button hidden",
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
                      choices = c("Option 1", "Option 2"),
                      selected = character(0))

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
