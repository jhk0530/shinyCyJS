# shinyCyJS

R package to link shiny and Cytoscape.js

# install : 
```r
library(devtools)
install_github('unistbig/shinyCyJS')
library(shinyCyJS)
```

# example code : 
```r
elem = list()
elem[[1]] = buildNode('Node1')
elem[[2]] = buildNode('Node2')
elem[[3]] = buildEdge('Node1','Node2')
shinyCyJS(elem)
```

<img src = 'https://user-images.githubusercontent.com/6457691/65883784-aefd8b80-e3d2-11e9-96cf-4dd390ad3141.png' width = 150></img>

# Used in 
netGO <https://github.com/unistbig/netGO> <br>
GScluster <https://github.com/unistbig/GScluster> ( on progress ) <br>

# suggest or comment
hwanistic@gmail.com
Thanks !

# update log 

<details><summary>0.0.2</summary>
  <p>
added pie background feature ( only size and color )<br>
<img src = 'https://user-images.githubusercontent.com/6457691/65883045-34803c00-e3d1-11e9-87f1-fb8dfc028484.png' width = 150></img>
<br>
demo code : <br>

```r
shinyCyJS(
  buildNode(id = 'pieNode', width = 100, height = 100, 
    pieSize = c(40,40,20,0,0,0,0,0,0,0,0,0,0,0,0,0), 
    pieColor = c('cyan','magenta','yellow',rep('#000',13))
  )
)
```

  </p>
</details>

<details><summary>0.0.3</summary>
  <p>
    bugFixed (pre-built elements didn't clear when using rendershinyCyJS)
  </p>
</details>

<details><summary>0.0.4</summary>
  <p>
  tooltip feature available on Nodes
    
  for information,
    
  Qtip2 <https://github.com/qTip2/qTip2>
  
  Cytoscape-Qtip <https://github.com/cytoscape/cytoscape.js-qtip>
    
  <img src = 'https://user-images.githubusercontent.com/6457691/66700551-70e65d00-ed2c-11e9-8b87-22074b228882.png' width = 350></img>  

  demo code : 
  
  ```r
  shinyCyJS(list( buildNode('have tooltip',tooltip = 'Tooltip!'), buildNode('not Tooltip')) )
  ```

  </p>
</details>

<details><summary>0.0.5</summary>
  <p>
    
  now selected item will have different color, 
  Node : ![#ff00ff](https://placehold.it/15/ff00ff/000000?text=+), Edge : ![#000000](https://placehold.it/15/000000/000000?text=+)
  
  <img src = 'https://user-images.githubusercontent.com/6457691/66729507-dbabab80-ee86-11e9-9544-ef9495aac21d.png' width = 150></img>
  <img src = 'https://user-images.githubusercontent.com/6457691/66729506-db131500-ee86-11e9-8159-e89b0c6bb40c.png' width = 150></img>
  <img src = 'https://user-images.githubusercontent.com/6457691/66729509-dbabab80-ee86-11e9-8800-0a945a92584b.png' width = 150></img>
  </p>
</details>

<details><summary>0.0.6</summary>
  fcose, spread, dagre layout available.
  
  fcose <https://github.com/iVis-at-Bilkent/cytoscape.js-fcose>
  
  spread <https://github.com/cytoscape/cytoscape.js-spread> 
  
  dagre <https://github.com/cytoscape/cytoscape.js-dagre> 
</details>

<details><summary>0.0.7</summary>
  <p>
  now multiple elements with data.frame can be built with <b>buildElems</b>

  below codes will work same

  ```r
  shinyCyJS(list(
    buildNode('a'),
    buildNode('b', width = 20),
    buildNode('c', width = 30),
    buildNode('d', width = 40),
    buildEdge('a','b'),
    buildEdge('a','c'),
    buildEdge('c','d'),
    buildEdge('b','d')
    ))
  ```

  ```r
  a = data.frame(
    id = c('a','b','c','d'),
    width = c(15,20,30,40)
  )

  b = data.frame(
    source = c('a','a','c','b'),
    target = c('b','c','d','d')
  )

  nodes = buildElems(a,'Node')
  edges = buildElems(b,'Edge')

  shinyCyJS(c(nodes, edges))

  ```
  
  </p>
  </details>
  


# todo 
build readme ( manual ) <br>
make funcion documents
