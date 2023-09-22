#' @title build multiple network elements by dataframe
#'
#' @description call buildNode or buildEdge function, note that only one function can be called
#'
#' @seealso buildNode(), buildEdge()
#' @param elems value of elements consisted in dataframe
#' @param type Either 'Node' or 'Edge' [string]
#' @return List typed multiple 'Node' or 'Edge' elements. It consisted with repeated buildNode or buildEdge function results with given parameter.
#'
#' @export
#'
#' @examples
#' nodes = buildElems( # will generate 5 nodes
#'  elems = data.frame(
#'    id = paste0('node',1:5),
#'    bgColor = "#FFFFFF",
#'    borderColor = "#48DBFB",
#'    borderWidth = 2,
#'    fontSize = 10,
#'    width = 60, height = 20, opacity = 1, stringsAsFactors = FALSE
#'  ), type = "Node")
#'
#'
buildElems <- function(elems, type) {
  func <- paste0("build", type)
  res <- lapply(seq_len(nrow(elems)), function(i) do.call(func, as.list(elems[i,])))
  return(res)
}
