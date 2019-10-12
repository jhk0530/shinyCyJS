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
Dawn <https://github.com/jhk0530/Dawn> <br>
GScluster <https://github.com/unistbig/GScluster> ( on progress ) <br>

# suggest or comment
hwanistic@gmail.com
Thanks !

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

0.0.4 -> now available tooltip feature on Nodes <br> 
for information, <br>
Qtip2 <https://github.com/qTip2/qTip2> <br> 
Cytoscape-Qtip <https://github.com/cytoscape/cytoscape.js-qtip> <br> 
<br>
<img src = 'https://user-images.githubusercontent.com/6457691/66700551-70e65d00-ed2c-11e9-8b87-22074b228882.png' width = 350></img>
<br>
demo code : 
<pre><code> shinyCyJS(list( buildNode('have tooltip',tooltip = 'Tooltip!'), buildNode('not Tooltip')) )
</code></pre>

# todo 
build readme ( manual )
