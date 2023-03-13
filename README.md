# shinyCyJS <img src='https://user-images.githubusercontent.com/6457691/78387821-e7e51a00-761a-11ea-9295-cd52c9e11c6f.png' width ='120' align='right'/>

<img src='https://travis-ci.com/jhk0530/shinyCyJS.svg?branch=master'/>
<img src='https://www.r-pkg.org/badges/version/shinyCyJS'/>



shinyCyJS is R/Shiny Package to use cytoscape.js in R environment. <br>

cytoscape.js is a great javascript library for visualize/analysis Graph theory ( network ) <br>
if you interested, please refer to this [Link](https://js.cytoscape.org/ "link"). <br>

shinyCyJS is built with cytoscape.js version 3.12.0. (2019/11)


# How to install : 

```r

# CRAN Ver, 0.0.11
install.packages('shinyCyJS')

# Development Ver, 0.0.12
library(devtools)
devtools::install_github('jhk0530/shinyCyJS')
library(shinyCyJS)


```

# Example : 

bulid Graph with node 4 = A, B, C, D and edge = A-B, B-C, C-D, B-D <br>

<details><summary>Code</summary>

```r
library(shiny)
library(shinyCyJS)

ui = function(){
  fluidPage(
    ShinyCyJSOutput(outputId = 'cy')
  )
}

server = function(input, output, session){  
  
  nodes = data.frame(
    id = c('A','B','C','D'),
    width = c(10,20,30,40),
    height = c(10,20,30,40)
  )  
  
  edges = data.frame(
    source = c('A','B','C','D'),
    target = c('B','C','D','B')
  )
  
  nodes = buildElems(nodes, type = 'Node')
  edges = buildElems(edges, type = 'Edge')  
  
  obj = shinyCyJS(c(nodes, edges))  
  output$cy = renderShinyCyJS(obj)
}

shinyApp(ui,server, options = list(launch.browser = TRUE, display.mode ='normal'))

```
</details>

<img src = 'https://user-images.githubusercontent.com/6457691/68040069-d36dc000-fd10-11e9-9ef5-d021768ac548.gif' width = 400></img>

# Used in 

netGO <https://github.com/unistbig/netGO> <br>
GScluster <https://github.com/unistbig/GScluster> ( on progress ) <br>

# Suggest or comment

Make issue on [here](https://github.com/jhk0530/shinyCyJS/issues)
