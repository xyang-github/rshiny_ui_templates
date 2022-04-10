library(shiny)

options(shiny.maxRequestSize=200*1024^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    tags$head(
        tags$link(rel = "stylesheet",
                  type = "text/css",
                  href = "progressbar.css"),
        tags$script(src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"),
        tags$script(src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"),
        tags$script(src="progressbar.js")
    ),
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
                             tags$h2(class="fs-title", "Step 1"),
                             tags$h3(class="fs-subtitle", "This is step 1"),
                             tags$input(type="button",
                                        name="next",
                                        class="next action-button",
                                        value="Next")
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
server <- function(input, output) {

}

# Run the application
shinyApp(ui = ui, server = server)
