setwd("~")
brca = c('COL17A1','KCNJ16','FXYD1','OXTR','SCARA5','SAMD5','MYH11','SLC7A3','COL6A6',
         'CD300LG','SDPR','MAMDC2','CAPN11','HAS3','KCNE1','ZBTB16','TSHZ2','AK5','SEMA5A','PGM5')

load("c2gs.RData")
load('obj.RData')
load("PPIString.RData")

# netGOVis
library(shiny)
library(shinyjs)
library(shinyCyJS)
library(DT)

buildIG = function(genes, color = 'sky', parent = NULL){
  if(length(genes)==0){return();}
  nodes = list()
  if(color == 'sky'){color = '#48DBFB'}
  if(color == 'yellow'){color = '#FCCE00'}
  if(color == 'green'){color = '#03CB5D'}
  for(i in 1:length(genes)){
    nodes[[i]] = buildNode(id = genes[i], bgColor = '#FFFFFF' ,borderColor = color, parent = parent)
  }
  nodes
}

nodetojs = function(genes){
  paste0("cy.nodes('", paste('#',genes,sep='',collapse = ','),"')")
}


sigIdx = function(obj, v = 20){
  idx = which(rank(obj$pv, ties.method = 'first')<=v
              | rank(obj$pvh, ties.method = 'first')<=20)
}
# get gene, geneset, and find intersect, intersect will draw with GREEN COLOR
getIntersect = function(gene,geneset){
  elements = list()
  gs = intersect(geneset,rownames(PPI))
  g = intersect(gene,rownames(PPI))
  # nodes

  #G1 = buildIG(setdiff(gene,geneset),color = 'sky')
  #elements = append(elements, G1, after = length(elements))
  #G2 = buildIG(intersect(gene, geneset),color = 'green')
  #elements = append(elements, G2, after = length(elements))
  #G3 = buildIG(setdiff(geneset, gene),color = 'yellow')
  #elements = append(elements, G3, after = length(elements))

  edges = list()
  nwe = c()

  for(i in 1:length(g)){
    E = PPI[g[i],names(which(PPI[g[i],gs]>0))]
    if(length(E)>0){

      if(length(E)==1){
        n = names(which(PPI[g[i],gs]>0))
        edges[[length(edges)+1]] =
          buildEdge(source = g[i], target = n, width = E+.5, lineColor = '#4B4B4B', )
        nwe = append(nwe, n, after = length(nwe))
        next
      }
      for(j in 1:length(E)){
        edges[[length(edges)+1]] =
        buildEdge(source = g[i], target = names(E)[j], width = unname(E)[j]+.5, lineColor = '#4B4B4B')
        nwe = append(nwe, names(E)[j], after = length(nwe))
      }
    }
  }

  elements = append(elements, edges, after = length(elements))
  list(elements = elements, nwe = unique(nwe))
}

ui = function(){
  fluidPage(
    #titlePanel("Hello Shiny!"),
    useShinyjs(),
    tags$head(tags$style(type="text/css", "html, body {width: 100%; height: 100%; overflow: hidden}")),

    sidebarLayout(
      position = 'right',
      sidebarPanel(
        DTOutput(outputId = 'table1', height = '100%'),
        actionButton(inputId = 'btn2', label = 'Select'),
        width = 6
      ),
      mainPanel(
        actionButton(
          inputId = 'btn',label = 'Export',
          style = 'position:absolute;top:1em;right:1em; z-index:9999;'
        ),
        ShinyCyJSOutput(outputId = 'cy'),
        width = 6
      )
    )
  )

}

fit = function(sGs){
  runjs("cy.edges().style('opacity',0.3)")
  runjs(paste0(nodetojs(brca),
               ".layout({name:'random',
               boundingBox:{
               x1:0,x2:0.8*cy.width()/3,
               y1:0,y2:cy.height()},
               fit:false}).run()
               "))
  runjs(paste0(nodetojs(sGs),
               ".layout({name:'random',
               boundingBox:{
               x1:2.2*cy.width()/3,x2:cy.width(),
               y1:0,y2:cy.height()},
               fit:false}).run();
               "))
  runjs(paste0(nodetojs(intersect(brca,sGs) ),
               ".layout({name:'random',
               boundingBox:{
               x1:1.2*cy.width()/3,x2:1.8*cy.width()/3,
               y1:0.2*cy.height(),y2:0.8*cy.height()},
               fit:false}).run();
               "))
  runjs(
    "cy.nodes().style('border-width',2);
    cy.nodes().style('font-size',10);
    cy.nodes().style('width',60);
    cy.nodes().style('text-valign','center');
    cy.nodes().style('height',20);"
  )
  runjs('cy.fit()')
  }

server = function(input,output,session){
  sGs = genesets[[13]]
  elements = list()
  elements = append(elements, buildIG(setdiff(brca,sGs) ), after = length(elements))
  elements = append(elements, buildIG(intersect(sGs, brca), '#03CB5D'), after = length(elements))
  isobj = getIntersect(brca,sGs)
  elements = append(elements, buildIG(isobj$nwe, '#FCCE00'), after = length(elements))

  elements = append(elements, isobj$elements, after = length(elements))
  si = sigIdx(obj,v = 20)
  myTab = round(cbind(obj$pv,obj$pvh)[si,],4)

  output$cy = renderShinyCyJS(shinyCyJS(elements))
  output$table1 = renderDT(datatable(
    myTab,
    extensions = 'Scroller' ,
    options = list(
      deferRender = TRUE,
      scrollY = "240px", # each row takes 40 px
      scroller = TRUE),
    selection = 'single'
    )
  )

  observeEvent(input$btn, { fit(sGs) })


  observeEvent(input$btn2, {
    runjs('cy.$().remove();')
    sIdx = input$table1_rows_selected
    sGs <<- genesets[[rownames(myTab)[sIdx]]]
    elements = list()
    elements = append(elements, buildIG(intersect(sGs, brca), '#03CB5D'), after = length(elements))
    elements = append(elements, buildIG(setdiff(brca,sGs) ), after = length(elements))
    isobj = getIntersect(brca,sGs)
    elements = append(elements, buildIG(isobj$nwe, '#FCCE00'), after = length(elements)) #

    elements = append(elements, isobj$elements, after = length(elements)) # edge
    output$cy = renderShinyCyJS(shinyCyJS(elements))
    fit(sGs)
  })

}
shinyApp(ui,server)
