#' @import htmlwidgets

#' @export
shinyCyJS <- function(elements = list(), options = list(), layout = list(name = "cose"),
                      width = NULL, height = NULL, elementId = NULL) {
  input <- list(elements = elements, options = options, layout = layout)

  htmlwidgets::createWidget(
    name = "shinyCyJS",
    input,
    width = width,
    height = height,
    package = "shinyCyJS",
    elementId = elementId
  )
}


#' @export
ShinyCyJSOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "shinyCyJS", width, height, package = "shinyCyJS")
}

#' @export
renderShinyCyJS <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, ShinyCyJSOutput, env, quoted = TRUE)
}

#' @export
buildNode <- function(
                      id, width = 15, height = 15, shape = "ellipse", bgColor = "#48DBFB",
                      bgOpacity = 1, bgFill = "solid", borderWidth = 0, borderStyle = "solid",
                      borderColor = "#8395a7", borderOpacity = 1, isParent = FALSE, labelColor = "#8395a7",
                      textOpacity = 1, fontSize = 16, textOutlineColor = "#222f3e", textOutlineOpacity = 1,
                      textOutlineWidth = 0, textbgColor = "#FFF", textbgOpacity = 0, textBorderColor = "#222f3e",
                      textBorderOpacity = 0, textBorderWidth = 0, parent = NULL, opacity = 1, pieSize = rep("0%", 16), pieColor = rep("#000", 16), tooltip = "") {
  # megaman SKY #48DBFB
  # storm petrel #8395A7
  # impreial primer #222F3E

  l <- list(group = "nodes")

  options <- list(
    width = width, height = height, label = id, id = id, shape = shape,
    bgColor = bgColor, bgOpacity = bgOpacity, bgFill = bgFill,
    borderWidth = borderWidth, borderStyle = borderStyle, borderColor = borderColor,
    borderOpacity = borderOpacity, labelColor = labelColor, textOpacity = textOpacity,
    fontSize = fontSize, textOutlineColor = textOutlineColor, textOutlineOpacity = textOutlineOpacity,
    textOutlineWidth = textOutlineWidth, textbgColor = textbgColor, textbgOpacity = textbgOpacity, opacity = opacity,
    textBorderColor = textBorderColor, textBorderOpacity = textBorderOpacity, textBorderWidth = textBorderWidth, parent = parent,
    pieSize1 = pieSize[1], pieSize2 = pieSize[2], pieSize3 = pieSize[3], pieSize4 = pieSize[4],
    pieSize5 = pieSize[5], pieSize6 = pieSize[6], pieSize7 = pieSize[7], pieSize8 = pieSize[8],
    pieSize9 = pieSize[9], pieSize10 = pieSize[10], pieSize11 = pieSize[11], pieSize12 = pieSize[12],
    pieSize13 = pieSize[13], pieSize14 = pieSize[14], pieSize15 = pieSize[15], pieSize16 = pieSize[16],
    pieColor1 = pieColor[1], pieColor2 = pieColor[2], pieColor3 = pieColor[3], pieColor4 = pieColor[4],
    pieColor5 = pieColor[5], pieColor6 = pieColor[6], pieColor7 = pieColor[7], pieColor8 = pieColor[8],
    pieColor9 = pieColor[9], pieColor10 = pieColor[10], pieColor11 = pieColor[11], pieColor12 = pieColor[12],
    pieColor13 = pieColor[13], pieColor14 = pieColor[14], pieColor15 = pieColor[15], pieColor16 = pieColor[16],
    tooltip = tooltip
  )

  if (isParent) { # parent node
    options$bgColor <- "#c8d6e5" # light blue ballerina
    options$bgOpacity <- "0.5"
  }

  l$data <- options

  l
}

#' @export
buildEdge <- function(source, target, width = 3, curveStyle = "haystack",
                      lineColor = "#FECA57", lineStyle = "solid", sourceArrowColor = "#feca57",
                      targetArrowColor = "#feca57", sourceArrowShape = "none", targetArrowShape = "none",
                      opacity = 1) {
  # casandora YELLOW #FECA57
  l <- list()
  l$group <- "edges"
  options <- list(
    source = source, target = target, width = width,
    curveStyle = curveStyle, lineColor = lineColor, lineStyle = lineStyle,
    sourceArrowColor = sourceArrowColor, targetArrowColor = targetArrowColor,
    sourceArrowShape = sourceArrowShape, targetArrowShape = targetArrowShape,
    opacity = opacity
  )
  l$data <- options
  l
}

#' @export
buildElems <- function(elems, type) {
  func <- paste0("build", type, "(")

  res <- list()
  params <- colnames(elems)
  for (i in 1:nrow(elems)) {
    command <- c()
    for (j in 1:length(params)) {
      command[j] <- paste0(params[j], " = ", "'", elems[i, j], "'")
    }
    command <- paste(command, collapse = ", ")
    command <- paste0(func, command, ")")
    res[[length(res) + 1]] <- eval(parse(text = command))
  }
  return(res)
}
