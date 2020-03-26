#' @name buildROptions
#' @title buildROptions
#' @description build Rendering Option
#'
#' @details undescribed parameter will set as default.
#'
#' @param headless A convenience option that initialises the instance to run headlessly. [logical]
#' @param styleEnabled Whether style available or not. [logical]
#' @param hideEdgesOnViewport Whether edge will show on canvas manipulation. [logical]
#' @param textureOnViewport Whether texture used in canvas manipulation. [logical]
#' @param motionBlur Whether use motionBlur effect. [logical]
#' @param motionBlurOpacity opacity of motion blur frames [numeric between 0 ~ 1 (transparent)]
#' @param wheelSensitivity Changes the scroll wheel sensitivity when zooming. [numeric between 0 (zoom slower) ~ 1 (zoom faster)]
#' @param pixelRatio Overrides the screen pixel ratio with a manually set value [numeric]
#'
#' @return List typed Rendering Option for Cytoscape.js canvas object.
#'
#' @examples
#' ropt = buildROptions(wheelSensitivity = 0.5)
#'
#' @seealso https://js.cytoscape.org/#core/initialisation
#'
#'
#' @export
#'

buildROptions <- function(
  headless = FALSE, styleEnabled = TRUE, hideEdgesOnViewport = FALSE,
  textureOnViewport = FALSE, motionBlur = FALSE, motionBlurOpacity = 0.2, wheelSensitivity = 1,
  pixelRatio = 'auto'
){

  if(!is.numeric(motionBlurOpacity)) stop('motionBlurOpacity must be numeric')
  if(!is.numeric(wheelSensitivity)) stop('wheelSensitivity must be numeric')
  if(motionBlurOpacity > 1 | motionBlurOpacity < 0) stop('motionBlurOpacity must be in 0 ~ 1')
  if(wheelSensitivity > 1 | wheelSensitivity < 0) stop('wheelSensitivity must be in 0 ~ 1')

  if(!is.logical(headless)) stop('headless must be logical')
  if(!is.logical(styleEnabled)) stop('styleEnabled must be logical')
  if(!is.logical(hideEdgesOnViewport)) stop('hideEdgesOnViewport must be logical')
  if(!is.logical(textureOnViewport)) stop('textureOnViewport must be logical')
  if(!is.logical(motionBlur)) stop('motionBlur must be logical')

  return(
    list(
      headless = headless,
      styleEnabled = styleEnabled,
      hideEdgesOnViewport = hideEdgesOnViewport,
      textureOnViewport = textureOnViewport,
      motionBlur = motionBlur,
      motionBlurOpacity = motionBlurOpacity,
      wheelSensitivity = wheelSensitivity,
      pixelRatio = pixelRatio
    )
  )
}

