#'
#' @name buildEdge
#' @title build single Edge element
#'
#' @param source edge linked node's id. [string]
#' @param target edge linked target node's id. [string]
#' @param label edge's label [string]
#' @param width The width of an edge’s line. [numeric]
#' @param curveStyle The curving method used to separate two or more edges between two nodes. [string]
#' @param lineColor The colour of the edge’s line. [string]
#' @param lineStyle The style of the edge’s line; may be solid, dotted, or dashed. [string]
#' @param sourceArrowColor The colour of the edge’s source arrow. [string]
#' @param targetArrowColor The colour of the edge’s target arrow. [string]
#' @param sourceArrowShape The shape of the edge’s source arrow. [string]
#' @param targetArrowShape The shape of the edge’s target arrow. [string]
#' @param opacity Opacity of edge itself. [numeric between 0 ~ 1]
#'
#' @seealso https://js.cytoscape.org/#style
#'
#' @export
buildEdge <- function(source = NULL, target, width = 3, curveStyle = "haystack", label = "",
                      lineColor = "#FECA57", lineStyle = "solid", sourceArrowColor = "#feca57",
                      targetArrowColor = "#feca57", sourceArrowShape = "none", targetArrowShape = "none",
                      opacity = 1) {
  l <- list()
  l$group <- "edges"

  if(is.null(source)) stop('source must given')
  if(is.null(target)) stop('target must given')

  if(!is.numeric(width)) stop('width must be numeric')

  if(!lineStyle %in% c('solid','dotted','dahsed')) stop('wrong lineStyle')

  if(!curveStyle %in% c('haystack','straight','bezier', 'unbundled-bezier', 'segments','taxi')) stop('wrong curveStyle')

  if(!is.numeric(opacity)) stop('opacity must be numeric value')
  if(opacity > 1 | opacity < 0) stop('opacity must be in 0 ~ 1')


  options <- list(
    source = source, target = target, width = width, label = label,
    curveStyle = curveStyle, lineColor = lineColor, lineStyle = lineStyle,
    sourceArrowColor = sourceArrowColor, targetArrowColor = targetArrowColor,
    sourceArrowShape = sourceArrowShape, targetArrowShape = targetArrowShape,
    opacity = opacity
  )
  l$data <- options
  return(l)
}
