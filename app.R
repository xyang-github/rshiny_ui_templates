library(shiny)
library(waiter)

options(shiny.maxRequestSize=200*1024^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    tags$head(
        tags$link(rel = "stylesheet",
                  type = "text/css",
                  href = "progressbar.css"),
        tags$link(rel = "stylesheet",
                  href = "https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"),
        tags$script(src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"),
        tags$script(src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"),
        tags$script(src="progressbar.js"),
        tags$script("
          Shiny.addCustomMessageHandler('load_select', function(load) {
            $('#bulma_select_2').addClass('is-loading')
            $('#bulma_select_2').removeClass('is-info')
            $('#select2').prop('disabled', true);
          });

          Shiny.addCustomMessageHandler('update_select', function(update) {
            $('#bulma_select_2').removeClass('is-loading');
            $('#bulma_select_2').addClass('is-info');
            $('#select2').prop('disabled', false);
          });
                    ")
    ),
    useWaiter(),
    fluidRow(
        column(8, offset=2,
               tags$form(id="msform",
                         tags$div(class="header",
                                  tags$h1("Web Application - Progressbar UI")
                         ),
                         # Progress bar
                         tags$div(id="progressbar_wrapper",
                                  tags$ul(id="progressbar",
                                          tags$li(HTML("<span class='step active'>1</span><br><span class='step_description'>Description</span>")),
                                          tags$li(HTML("<span class='step'>2</span><br><span class='step_description'>Description</span>")),
                                          tags$li(HTML("<span class='step'>3</span><br><span class='step_description'>Description</span>")))
                         ),

                         # Fieldsets
                         tags$fieldset(
                           fluidRow(tags$h2(class="fs-title", "Step 1")),
                           fluidRow(tags$h3(class="fs-subtitle", "This is step 1")),
                           fluidRow(
                             column(width=6,
                                    tags$div(class = "select is-fullwidth",
                                             id = "bulma_select_1",
                                             tags$select(
                                               id = "select1",
                                               tags$option(value = "", selected = TRUE, "Select an Option"),
                                               tags$option("Option 1"),
                                               tags$option("Option 2")
                                             ))
                                    ),
                             column(width=6,
                                    tags$div(class = "select is-fullwidth",
                                                 id = "bulma_select_2",
                                                 tags$select(
                                                   id = "select2",
                                                   disabled = TRUE,
                                                   tags$option(value = "",
                                                               selected = TRUE,
                                                               "Select an Option")
                                                 )
                                        ))),
                           fluidRow(tags$input(type="button",
                                               name="next",
                                               class="button is-info is-outlined",
                                               value="Next"))
                         ),
                         tags$fieldset(
                             tags$h2(class="fs-title", "Step 2"),
                             tags$h3(class="fs-subtitle", "This is step 2"),
                             tags$input(type="button",
                                        name="previous",
                                        class="previous action-button",
                                        value="Previous"),
                             tags$input(type="button",
                                        name="next",
                                        class="next action-button",
                                        value="Next")
                         ),
                         tags$fieldset(
                             tags$h2(class="fs-title", "Step 3"),
                             tags$h3(class="fs-subtitle", "This is step 3"),
                             tags$input(type="button",
                                        name="previous",
                                        class="previous action-button",
                                        value="Previous"),
                             tags$input(type="button",
                                        name="submit",
                                        class="submit action-button",
                                        value="Submit")
                             ))
               )
        )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  observeEvent(input$select1, {
    req(input$select1)

    # Trigger JS to run
    session$sendCustomMessage(type = "load_select", message = "load")

    Sys.sleep(3)

    updateSelectizeInput(inputId = "select2",
                         choices = c("", "Options1", "Options2"))
    session$sendCustomMessage(type = "update_select", message = update)

    runif(100)

  })
}

# Run the application
shinyApp(ui = ui, server = server)
