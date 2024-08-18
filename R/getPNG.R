#' @import shinyjs
#' @title Export cytoscape image as PNG
#'
#' @description This function is used to download cytoscape image as png.
#'
#' @return NULL
#' @export
getPNG <- function() {
  shinyjs::runjs(
    "
    pngblob = cy.png({output: 'blob'});
    const blobURL = URL.createObjectURL(pngblob);

    const link = document.createElement('a');
    link.href = blobURL;
    link.download = 'cy.png';
    link.click();
    "
  )
  return(NULL)
}
