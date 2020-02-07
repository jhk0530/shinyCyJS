#' @name buildIOptions
#' @title buildIOptions
#' @description build Interact Option
#'
#' @details undescribed parameter will set as default. note that touchTapThreshold & desktopTapThreshold were not used.
#'
#' @param minZoom Minimal zoom level of canvas. [numeric]
#' @param maxZoom Maximal zoom level of canvas. [numeric]
#' @param zoomingEnabled Whether canvas can zoom or not. by both user event and programmatically. [logical]
#' @param userZoomingEnabled Whether canvas can zoom or not. by user event. [logical]
#' @param panningEnabled Whether canvas can move or not. by both user event and programmatically. [logical]
#' @param userPanningEnabled Whether canvas can move or not. by user event. [logical]
#' @param boxSelectionEnabled Whether box selection by drag available [logical]
#' @param selectionType Indicate selection by user input is addtive or single(default). ['single' or 'addtivie']
#' @param autolock Whether nodes should be locked (not draggable at all) by default (if true, overrides individual node state). [logical]
#' @param autoungrabify Whether nodes should be ungrabified (not grabbable by user) by default (if true, overrides individual node state). [logical]
#' @param autounselectify Whether nodes should be unselectified (immutable selection state) by default (if true, overrides individual element state). [logical]
#'
#' @examples
#' iopt = buildIOptions(
#' minZoom = 0.001, maxZoom = 3, zoomingEnabled = TRUE,
#' userZoomingEnabled = FALSE, panningEnabled = TRUE, userPanningEnabled = TRUE,
#' boxSelectionEnabled = FALSE, selectionType = 'single', autolock = FALSE,
#' autoungrabify = TRUE, autounselectify = FALSE)
#'
#'
#' @seealso https://js.cytoscape.org/#core/initialisation
#'
#'
#' @export
#'

buildIOptions <- function(
  minZoom = 1e-50, maxZoom = 1e50, zoomingEnabled = TRUE,
  userZoomingEnabled = TRUE, panningEnabled = TRUE, userPanningEnabled = TRUE,
  boxSelectionEnabled = TRUE, selectionType = 'single', autolock = FALSE, autoungrabify = FALSE, autounselectify = FALSE
  ){

  if(!is.numeric(minZoom)) stop('minZoom must be numeric')
  if(!is.numeric(maxZoom)) stop('minZoom must be numeric')

  if(!is.logical(zoomingEnabled)) stop('zoomingEnabled must be logical')
  if(!is.logical(userZoomingEnabled)) stop('userZoomingEnabled must be logical')
  if(!is.logical(panningEnabled)) stop('panningEnabled must be logical')
  if(!is.logical(userPanningEnabled)) stop('userPanningEnabled must be logical')
  if(!is.logical(boxSelectionEnabled)) stop('boxSelectionEnabled must be logical')
  if(!selectionType %in% c('single', 'additive')) stop('selectionType must be either "single" or "additive"')
  if(!is.logical(autolock)) stop('autolock must be logical')
  if(!is.logical(autoungrabify)) stop('autoungrabify must be logical')
  if(!is.logical(autounselectify)) stop('autounselectify must be logical')

  return(
    list(
      minZoom = minZoom,
      maxZoom = maxZoom,
      zoomingEnabled = zoomingEnabled,
      userZoomingEnabled = userZoomingEnabled,
      panningEnabled = panningEnabled,
      userPanningEnabled = userPanningEnabled,
      boxSelectionEnabled = boxSelectionEnabled,
      selectionType = selectionType,
      autolock = autolock,
      autoungrabify = autoungrabify,
      autounselectify = autounselectify
    )
  )
}
