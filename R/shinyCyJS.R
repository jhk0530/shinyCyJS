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
buildNode = function(...){
  options = as.list(match.call())[-1] # remove function name
  l$group = 'nodes'
  no = names(options)
  if(!'id' %in% no){ print("id must be exist, return")}
  if(!'width' %in% no){ options$width = 30 }
  if(!'height' %in% no){ options$height = 30 }
  if(!'shape' %in% no){ options$shape = 'ellipse' }
  if(!'bgColor' %in% no){ options$bgColor = '#48dbfb' } # megaman
  if(!'bgOpacity' %in% no){ options$bgOpacity = 1 }
  if(!'borderWidth' %in% no){ options$borderWidth = 0}
  if(!'borderStyle' %in% no){ options$borderStyle = 'solid'}
  if(!'borderColor' %in% no){ options$borderColor = '#8395a7'} # storm petrel
  if(!'borderOpacity' %in% no){ options$borderOpacity = 1}
  options$label = options$id
  if(!'labelColor' %in% no){ options$labelColor = '#8395a7'}
  if(!'textOpacity' %in% no){ options$textOpacity = 1}
  if(!'fontSize' %in% no){ options$fontSize = 16}
  if(!'textOutlineColor' %in% no){ options$textOutlineColor = '#222f3e'} # impreial primer
  if(!'textOutlineOpacity' %in% no){ options$textOutlineOpacity = 1}
  if(!'textOutlineWidth' %in% no){ options$textOutlineWidth = 0}
  if(!'textbgColor' %in% no){ options$textbgColor = '#FFF'}
  if(!'textbgOpacity' %in% no){ options$textbgOpacity = 0 }
  if(!'textBorderColor' %in% no){ options$textBorderColor = '#222f3e'} # impreial primer
  if(!'textBorderOpacity' %in% no){ options$textBorderOpacity = 0}
  if(!'textBorderWidth' %in% no){ options$textBorderWidth = 0}

  l$data = options

  l
}

#' @export
buildEdge = function(...){
  options = as.list(match.call())[-1] # remove function name
  l$group = 'edges'
  no = names(options)

  if(!'width' %in% no){ options$width = 3 }
  if(!'curveStyle' %in% no){ options$curveStyle = 'haystack' }
  if(!'lineColor' %in% no){ options$lineColor = '#feca57' }  # casandora yellow
  if(!'lineStyle' %in% no){ options$lineStyle = 'solid'}
  if(!'sourceArrowColor' %in% no){ options$sourceArrowColor = '#feca57'}
  if(!'targetArrowColor' %in% no){ options$targetArrowColor = '#feca57'}
  if(!'sourceArrowShape' %in% no){ options$sourceArrowShape = 'none'}
  if(!'targetArrowShape' %in% no){ options$targetArrowShape = 'none'}
  l$data = options
  l
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
