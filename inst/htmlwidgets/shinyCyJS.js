HTMLWidgets.widget({
  name:'shinyCyJS',
  type:'output',
  factory : function(el, width, height) {

	// Initialisation
	var cy = window.cy = cytoscape({ 
	container : document.getElementById(el.id),
	layout: { name: 'klay' },
	style: cytoscape.stylesheet()
		.selector('node').css({
			'width': 'data(width)',
			'height': 'data(height)',
			'shape': 'data(shape)',
			'background-color': 'data(bgColor)',				
			'background-opacity': 'data(bgOpacity)',
			'background-fill': 'data(bgFill)',
			'border-width': 'data(borderWidth)',
			'border-style': 'data(borderStyle)',
			'border-color': 'data(borderColor)',
			'border-opacity': 'data(borderOpacity)',
			'label': 'data(label)',
			'color': 'data(labelColor)',
			'text-opacity': 'data(textOpacity)',
			'font-size': 'data(fontSize)',				
			'text-outline-color': 'data(textOutlineColor)',
			'text-outline-opacity': 'data(textOutlineOpacity)',
			'text-outline-width': 'data(textOutlineWidth)',
			'text-background-color': 'data(textbgColor)',
			'text-background-opacity': 'data(textbgOpacity)',
			'text-border-opacity': 'data(textBorderOpacity)',
			'text-border-width': 'data(textBorderWidth)',
			'text-border-color': 'data(textBorderColor)',
		})
		.selector('edge').css({
			'width': 'data(width)',
			'curve-style': 'data(curveStyle)',
			'line-color': 'data(lineColor)',
			'line-style': 'data(lineStyle)',
			'source-arrow-color': 'data(sourceArrowColor)',
			'source-arrow-shape': 'data(sourceArrowShape)',
			'target-arrow-color': 'data(targetArrowColor)',
			'target-arrow-shape': 'data(targetArrowShape)',
		})	
	});	
	
    return {
      renderValue: function(input){

		// Options
		var Ioptions = input.options.Ioptions
		for( var key in Ioptions ){ cy[[key]](Ioptions[key]) }
		var Roptions = input.options.Roptions
		for(var key in Roptions){ cy.renderer()[[key]] = Roptions[key] }

		// add elements
		var Elements = input.elements;
		cy.add(Elements);
		
		// set Layout
		var Layout = input.layout
		cy.layout(Layout).run()

	  },
      resize : function(width, height) { }  // not yet
    };
  }
});
/*
import cytoscape from 'cytoscape';
import cola from 'cytoscape-cola';	
import klay from 'cytoscape-klay';

cytoscape.use(cola);	
cytoscape.use(klay);
*/