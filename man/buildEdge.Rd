% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildEdge.R
\name{buildEdge}
\alias{buildEdge}
\title{build single Edge element}
\usage{
buildEdge(
  source = NULL,
  target,
  width = 3,
  curveStyle = "haystack",
  lineColor = "#FECA57",
  lineStyle = "solid",
  sourceArrowColor = "#feca57",
  targetArrowColor = "#feca57",
  sourceArrowShape = "none",
  targetArrowShape = "none",
  opacity = 1
)
}
\arguments{
\item{source}{edge linked node's id. [string]}

\item{target}{edge linked target node's id. [string]}

\item{width}{The width of an edge’s line. [numeric]}

\item{curveStyle}{The curving method used to separate two or more edges between two nodes. [string]}

\item{lineColor}{The colour of the edge’s line. [string]}

\item{lineStyle}{The style of the edge’s line; may be solid, dotted, or dashed. [string]}

\item{sourceArrowColor}{The colour of the edge’s source arrow. [string]}

\item{targetArrowColor}{The colour of the edge’s target arrow. [string]}

\item{sourceArrowShape}{The shape of the edge’s source arrow. [string]}

\item{targetArrowShape}{The shape of the edge’s target arrow. [string]}

\item{opacity}{Opacity of edge itself. [numeric between 0 ~ 1]}
}
\description{
build single Edge element
}
\seealso{
https://js.cytoscape.org/#style
}