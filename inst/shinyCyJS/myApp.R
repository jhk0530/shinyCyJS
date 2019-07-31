# Data prepare

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
library(googleVis)

cli = "clicknode = function(node){
  cy.nodes().style('opacity',0.1)
  cy.edges().style('opacity',0.05)
  node.style('opacity',1)
  node.connectedEdges().style('opacity',0.3)
  node.connectedEdges().connectedNodes().style('opacity',1)
}"
ucli = "unclick = function(){
  cy.nodes().style('opacity',1)
  cy.edges().style('opacity',0.3)
}"

buildIG = function(genes, color = 'sky'){
  if(length(genes)==0){return();}
  nodes = list()
  if(color == 'sky'){color = '#48DBFB'}
  if(color == 'yellow'){color = '#FCCE00'}
  if(color == 'green'){color = '#03CB5D'}
  for(i in 1:length(genes)){
    nodes[[i]] = buildNode(
    id = genes[i], bgColor = '#FFFFFF',
    borderColor = color, borderWidth = 2,
    fontSize = 10,width = 60, height = 20, opacity = 0)
  }
  nodes
}

nodetojs = function(genes){paste0("cy.nodes('", paste('#',genes,sep='',collapse = ','),"')")}

sigIdx = function(obj, R = 20, Q = NULL){
  pv = obj$pv
  pvh = obj$pvh
  if(!is.null(Q)){
    idx = which(p.adjust(pv,'fdr') <= Q | p.adjust(pvh,'fdr') <= Q)
    return(idx)
  }

  idx = which(rank(pv, ties.method = 'first') <= R | rank(pvh, ties.method = 'first') <= R)
  return(idx)
}

getIntersect = function(gene,geneset){
  elements = list()
  gs = intersect(geneset,rownames(PPI))
  g = intersect(gene,rownames(PPI))

  edges = list()
  nwe = c()

  for(i in 1:length(g)){
    E = PPI[g[i],names(which(PPI[g[i],gs]>0))]
    if(length(E)>0){
      if(length(E)==1){
        n = names(which(PPI[g[i],gs]>0))
        edges[[length(edges)+1]] =
          buildEdge(source = g[i], target = n, width = E+.5, lineColor = '#4B4B4B', opacity = 0)
        nwe = append(nwe, n, after = length(nwe))
        next
      }
      for(j in 1:length(E)){
        edges[[length(edges)+1]] =
        buildEdge(source = g[i], target = names(E)[j], width = unname(E)[j]+.5, lineColor = '#4B4B4B', opacity = 0)
        nwe = append(nwe, names(E)[j], after = length(nwe))
      }
    }
  }

  elements = append(elements, edges, after = length(elements))
  list(elements = elements, nwe = unique(nwe))
}

fit = function(brca, sGs){
  runjs(
    paste0('setTimeout(function(){',nodetojs(brca),
           ".layout({name:'random',boundingBox:{x1:0,x2:0.8*cy.width()/3,
            y1:0,y2:cy.height()},fit:false}).run()},3200);
           setTimeout(function(){",nodetojs(sGs),
           ".layout({name:'random',boundingBox:{x1:2.2*cy.width()/3,x2:cy.width(),
           y1:0,y2:cy.height()},fit:false}).run()},3300);
           setTimeout(function(){",nodetojs(intersect(brca,sGs)),
           ".layout({name:'random',boundingBox:{x1:1.2*cy.width()/3,x2:1.8*cy.width()/3,
           y1:0.2*cy.height(),y2:0.8*cy.height()},fit:false}).run()},3400);"
  )) # set butterfly layout

  runjs(
    "setTimeout(function(){
    cy.nodes().style('text-valign','center');
    cy.fit();
    cy.nodes().style('opacity',1);
    cy.edges().style('opacity',0.3);
    },3500)"
  ) # show graphs
}

afterCall = function(){
  runjs("setTimeout(function(){cy.on('click','node',function(e){clicknode(e.target)})},3500)")
  runjs("setTimeout(function(){cy.on('click',function(e){if(e.target===cy){unclick()}})},3500)")
}

ui = function(){
  fluidPage(
    useShinyjs(),
    tags$head(tags$style(type="text/css","html,body{width:100%;height:100%;overflow:hidden}")),
    tags$head(tags$style('.row,.col-sm-6,.container-fluid{height:100%}')),
    tags$head(tags$style('.well,#cy{height:95%;margin:1em}')),
    tags$head(tags$style('#view{height:50%;margin:1em};')),
    sidebarLayout(
      position = 'right',
      sidebarPanel(
        DTOutput(outputId='table1'),
        htmlOutput("view"),
        actionButton(inputId='btn2',label='Select',style='position:absolute;top:2em;'),
        width = 6
      ),
      mainPanel(
        #actionButton(
          #inputId = 'btn',label = 'Export',
          #style = 'position:absolute;top:1em;right:1em; z-index:9999;'
        #),
        ShinyCyJSOutput(outputId = 'cy', height = '95%'),
        width = 6
      )
    )
  )
}

buildCol = function(obj,v = 20){
  A = unname(which(rank(obj$pv, ties.method = 'first')<=v))
  B = unname(which(rank(obj$pvh, ties.method = 'first')<=v))
  C = intersect(A,B)
  res = rep('NONE', length(obj$pv))
  res[A] = 'netGO'
  res[B] = 'Hyper'
  res[C] = 'in Both'
  res
}

buildelement = function(brca, sGs){
  elements = list()
  elements = append(elements, buildIG(setdiff(brca,sGs) ), after = length(elements))
  elements = append(elements, buildIG(intersect(sGs, brca), '#03CB5D'), after = length(elements))
  isobj = getIntersect(brca,sGs)
  elements = append(elements, buildIG(isobj$nwe, '#FCCE00'), after = length(elements))
  elements = append(elements, isobj$elements, after = length(elements))
  elements
}

server = function(input,output,session){
  # declare click, unclick function
  runjs(cli)
  runjs(ucli)

  # build example network
  sGs = genesets[[13]]
  elements = buildelement(brca, sGs)
  output$cy = renderShinyCyJS(shinyCyJS(elements))

  afterCall()
  fit(brca, sGs)

  si = sigIdx(obj,R = 20)
  myTab = round(cbind(obj$pv,obj$pvh)[si,],4)
  output$table1 = renderDT(datatable(
    myTab,
    extensions = 'Scroller' ,
    options = list(
      deferRender = TRUE,
      scrollY = "240px", # each row takes 40 px
      scroller = TRUE,
      dom = 'ltipr'),
    selection = 'single'
    )
  )

  myData = list(
    name = names(si),
    ovl = unname(sapply(si, function(i){length(intersect(brca,genesets[[i]]))/ length(genesets[[i]])})),
    ppi = unname(sapply(si, function(i){sum(PPI[intersect(rownames(PPI),brca),intersect(rownames(PPI), genesets[[i]])])/ length(genesets[[i]]) })),
    size = as.numeric(sapply(unname(si), function(i){length(genesets[[i]])})),
    sig = buildCol(obj)[si]
  )

  output$view = renderGvis({
    gvisBubbleChart(
      myData,idvar = 'name',xvar = 'ovl',
      yvar = 'ppi', colorvar = 'sig',sizevar ='size',
        options = list(
          width = '100%', height = '100%',
          chartArea = "{left:'5%',top:'5%',width:'80%',height:'80%'}",
          colors= "['#8e44ad','#e74c3c', '#2980b9']",
          hAxis = "{title : 'Overlap'}",
          vAxis = "{title : 'Interact'}",
          colorAxis = "{legend:{position:'none'}}",
          bubble = '{textStyle:{color : "none" }}',# no label
          explorer ='{}'), chartid = 'BubbleChart'
      )
  })

  observeEvent(input$btn2, {
    runjs('cy.$().remove();')
    sIdx = input$table1_rows_selected
    sGs <<- genesets[[rownames(myTab)[sIdx]]]
    elements = buildelement(brca, sGs)
    output$cy = renderShinyCyJS(shinyCyJS(elements))
    fit(brca, sGs)
  })

}
shinyApp(ui,server)


myApp = function(obj, brca, genesets, PPI){
  # arg1 -> inst/FOLDERNAME ( GScluster )
  # arg2 -> ...?
  appDir = system.file("shinyCyJS", package = 'shinyCyJS')
  if(appDir ==''){
    stop(
      "Could not find shinyCyJS Directory, Try re-installing 'shinyCyJS'.",
      call. = FALSE
    )
  }

  .GlobalEnv$.obj = obj
  .GlobalEnv$.brca = brca
  .GlobalEnv$.PPI = PPI
  .GlobalEnv$.genesets = genesets

  on.exit(rm(list=c('.obj', '.brca', '.PPI','.genesets'),
             envir=.GlobalEnv))

  shiny::runApp(
    appDir,
    launch.browser = TRUE,
    display.mode ='normal'
  )
}
