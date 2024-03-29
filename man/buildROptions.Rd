% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildRoptions.R
\name{buildROptions}
\alias{buildROptions}
\title{buildROptions}
\usage{
buildROptions(
  headless = FALSE,
  styleEnabled = TRUE,
  hideEdgesOnViewport = FALSE,
  textureOnViewport = FALSE,
  motionBlur = FALSE,
  motionBlurOpacity = 0.2,
  wheelSensitivity = 1,
  pixelRatio = "auto"
)
}
\arguments{
\item{headless}{A convenience option that initialises the instance to run headlessly. [logical]}

\item{styleEnabled}{Whether style available or not. [logical]}

\item{hideEdgesOnViewport}{Whether edge will show on canvas manipulation. [logical]}

\item{textureOnViewport}{Whether texture used in canvas manipulation. [logical]}

\item{motionBlur}{Whether use motionBlur effect. [logical]}

\item{motionBlurOpacity}{opacity of motion blur frames [numeric between 0 ~ 1 (transparent)]}

\item{wheelSensitivity}{Changes the scroll wheel sensitivity when zooming. [numeric between 0 (zoom slower) ~ 1 (zoom faster)]}

\item{pixelRatio}{Overrides the screen pixel ratio with a manually set value [numeric]}
}
\value{
List typed Rendering Option for Cytoscape.js canvas object.
}
\description{
build Rendering Option
}
\details{
undescribed parameter will set as default.
}
\examples{
ropt <- buildROptions(wheelSensitivity = 0.5)

}
\seealso{
https://js.cytoscape.org/#core/initialisation
}
