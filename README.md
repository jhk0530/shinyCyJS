# shinyCyJS

R package to link shiny and Cytoscape.js

# install : 
<pre><code>library(devtools)
install_github('unistbig/shinyCyJS')
library(shinyCyJS)
</code></pre>

# example code : 
<pre><code>elem = list()
elem[[1]] = buildNode('Node1')
elem[[2]] = buildNode('Node2')
elem[[3]] = buildEdge('Node1','Node2')
shinyCyJS(elem)
</code></pre>

<img src = 'https://user-images.githubusercontent.com/6457691/65883784-aefd8b80-e3d2-11e9-96cf-4dd390ad3141.png' width = 150></img>



# Used in 

netGO <https://github.com/unistbig/netGO> <br>
Dawn <https://github.com/jhk0530/Dawn>

# update log 
0.0.2 -> added pie background feature ( only size and color )<br>
<img src = 'https://user-images.githubusercontent.com/6457691/65883045-34803c00-e3d1-11e9-87f1-fb8dfc028484.png' width = 150></img>
<br>
demo code : 
<pre><code> shinyCyJS(buildNode(id = 'pieNode', width = 100, height = 100, 
pieSize = c(40,40,20,0,0,0,0,0,0,0,0,0,0,0,0,0), 
pieColor = c('cyan','magenta','yellow',rep('#000',13))))
</code></pre>

0.0.3 -> pre-built elements didn't clear when using rendershinyCyJS. Fixed

# todo 
build readme ( manual )
