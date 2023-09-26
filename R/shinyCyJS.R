#' @import htmlwidgets
#' @title cytoscape.js in shiny application
#'
#' @description generate canvas with given network element and options
#'
#' @param elements node and edge objects, it should be list of element.
#' @param options rendering / interaction options, can be created with buildIoption(), buildRoption()
#' @param layout list type layout, it must be contain name and other optional values
#' @param width canvas width.
#' @param height canvas height.
#' @param elementId id used to identify in application.
#' @param ... other parameters
#'
#' @export
shinyCyJS <- function(elements = list(), options = list(), layout = list(name = "cose"),
                      width = NULL, height = NULL, elementId = NULL, ...) {
  input <- list(elements = elements, options = options, layout = layout)

  htmlwidgets::createWidget(
    name = "shinyCyJS",
    input,
    width = width,
    height = height,
    package = "shinyCyJS",
    elementId = elementId,
    ...
  )
}

#' @title create an cytoscape canvas element
#'
#' @description render a renderShinyCyJS() within an application page.
#'
#' @param outputId output variable to read the canvas from
#' @param width canvas width
#' @param height canvas height
#' @import htmlwidgets
#'
#' @export
#' @seealso renderShinyCyJS()
ShinyCyJSOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "shinyCyJS", width, height, package = "shinyCyJS")
}


#' @title ShinyCyJS output
#'
#' @param expr expression that returns a list
#' @param env the environment in which to evaluate expr
#' @param quoted is expr a quoted expression (with quote())
#' @import htmlwidgets
#'
#' @description renders a cytoscape image for output
#' @seealso ShinyCyJSOutput()
#'
#'
#' @export
#'
renderShinyCyJS <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, ShinyCyJSOutput, env, quoted = TRUE)
}
