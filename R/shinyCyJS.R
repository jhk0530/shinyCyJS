#' @import htmlwidgets
#' @export

shinyCyJS = function(elements = list(), options = list(),layout = list(name='cose'),
                     width = NULL, height = NULL, elementId = NULL){

  input = list( elements = elements, options = options, layout = layout )

  htmlwidgets::createWidget(
    name = 'shinyCyJS',
    input,
    width = width,
    height = height,
    package = 'shinyCyJS',
    elementId = elementId
  )

}

#' @export
#'
#' touchTapThreshold, desktopTapthreshold not available
buildIOptions = function(...){
  options = as.list(match.call())[-1] # remove function name
  options = options[
    c('minZoom','maxZoom','zoomingEnabled',
      'userZoomingEnabled','panningEnabled','userPanningEnabled',
      'boxSelectionEnabled','selectionType','autolock',
      'autoungrabify', 'autounselectify')]
  options[which(!sapply(options, is.null))] # if option not given : remove
}

#' @export
buildROptions = function(...){
  options = as.list(match.call())[-1] # remove function name
  options = options[
    c('headless','styleEnabled','hideEdgesOnViewport',
      'hideLabelsOnViewport','textureOnViewport','motionBlur',
      'motionBlurOpacity','wheelSensitivity','pixelRatio')]
  options[which(!sapply(options, is.null))] # if option not given : remove
}


#' @export
ShinyCyJSOutput = function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'shinyCyJS', width, height, package = 'shinyCyJS')
}

#' @export
renderShinyCyJS = function(expr, env = parent.frame(), quoted = FALSE){
  if(!quoted){ expr = substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, ShinyCyJSOutput, env, quoted = TRUE)
}


#' @export
viewElement = function(elements){
  output = data.frame(
    id = character(),
    type = factor(c("Node", "Edge")),
    style = list(),
    stringsAsFactors = FALSE
  )
}
