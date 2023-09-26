#' @name buildNode
#' @title build single node element.
#'
#' @param id id of node element. Also it will used as label. [string]
#' @param width Width. [numeric]
#' @param height Height. [numeric]
#' @param shape Shape of node body. polygon not accepted. [string]
#' @param bgColor Background color of node body. [string]
#' @param bgOpacity Opacity of backgroundColor. [numeric between 0 ~ 1]
#' @param bgFill The filling style of the node’s body; may be solid (default), linear-gradient, or radial-gradient. [string]
#' @param bgBlacken Blackens the node’s body for values from 0 to 1; whitens the node’s body for values from 0 to -1. [numeric between -1 ~ 1]
#' @param borderWidth The size of the node’s border. [numeric]
#' @param borderStyle The style of the node’s border; may be solid, dotted, dashed, or double. [string]
#' @param borderColor The colour of the node’s border. [string]
#' @param borderOpacity The opacity of the node’s border. [numeric between 0 ~ 1]
#' @param isParent whether this node is parent node or not [logical]
#' @param label node's label, default is node's id [string]
#' @param labelColor The color of node's label
#' @param textOpacity The opacity of the label text, including its outline. [numeric between 0 ~ 1]
#' @param fontSize The size of the label text. [numeric]
#' @param textOutlineColor The colour of the outline around the element’s label text. [string]
#' @param textOutlineOpacity The opacity of the outline on label text. [numeric between 0 ~ 1]
#' @param textOutlineWidth The size of the outline on label text. [numeric]
#' @param textbgColor colour to apply on the text background. [string]
#' @param textbgOpacity The opacity of the label background; the background is disabled for 0 (default value). [numeric between 0 ~ 1]
#' @param textBorderColor The colour of the border around the label. [string]
#' @param textBorderOpacity The width of the border around the label; the border is disabled for 0 (default value) [numeric between 0 ~ 1]
#' @param textBorderWidth The width of the border around the label. [numeric]
#' @param parent Indicate which node is parent of this node [string]
#' @param opacity Opacity of node itself. [numeric between 0 ~ 1]
#' @param pieSize Implement for pie node, consisted with 16 pie size[string]
#' @param pieColor Color for each pie part. [string]
#' @param tooltip Text for tooltip. [string]
#' @param position.x Location value (specify the location of of Node)
#' @param position.y Location value (specify the location of of Node)
#'
#'
#' @return List typed Node element, consisted with data options ( id ) and style options ( width, shape... )
#'
#' @seealso https://js.cytoscape.org/#style
#'
#'
#' @export
#'

buildNode <- function(
    id = NULL, width = 15, height = 15, shape = "ellipse", bgColor = "#48DBFB",
    bgOpacity = 1, bgFill = "solid", bgBlacken = 0, borderWidth = 0, borderStyle = "solid",
    borderColor = "#8395a7", borderOpacity = 1, isParent = FALSE, label = NULL, labelColor = "#8395a7",
    textOpacity = 1, fontSize = 16, textOutlineColor = "#222f3e", textOutlineOpacity = 1,
    textOutlineWidth = 0, textbgColor = "#FFF", textbgOpacity = 0, textBorderColor = "#222f3e",
    textBorderOpacity = 0, textBorderWidth = 0, parent = NULL, opacity = 1, pieSize = rep("0%", 16), pieColor = rep("#000", 16), tooltip = "",
    position.x = 0, position.y = 0) {
  if (is.null(id)) stop("id must given")
  if (!is.character(id)) stop("id must be string")


  if (!shape %in% c(
    "ellipse", "triangle", "round-triangle", "rectangle",
    "round-rectangle", "bottom-round-rectangle", "cut-rectagnel", "barrel", "rhomboid",
    "diamond", "round-diamond", "pentagon", "round-pentagon", "concave-hexagon", "heptagon", "round-heptagon",
    "octagon", "round-octagon", "star", "tag", "round-tag", "vee"
  )) {
    stop("wrong shape, check https://js.cytoscape.org/#style/node-body")
  }
  if (is.null(label)) label <- id

  l <- list(group = "nodes")

  options <- list(
    width = width, height = height, label = label, id = id, shape = shape,
    bgColor = bgColor, bgOpacity = bgOpacity, bgFill = bgFill, bgBlacken = bgBlacken,
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
  l$position <- list(x = position.x, y = position.y)
  return(l)
}
