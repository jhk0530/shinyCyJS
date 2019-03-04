var myCytoscape;

HTMLWidgets.widget({
  name:'shinyCyJS',
  type:'output',
  factory : function(el, width, height) {

	// Initialisation
	var cy = cytoscape({ container : document.getElementById(el.id) });
	myCytoscape = cy;

    return {
      renderValue: function(input){

		// Options
		var Ioptions = input.options.Ioptions
		for( var key in Ioptions ){ myCytoscape[[key]](Ioptions[key]) }
		var Roptions = input.options.Roptions
		for(var key in Roptions){ myCytoscape.renderer()[[key]] = Roptions[key] }

		// add elements
		cy.add(input.elements)

		// set Layout
		var Layout = input.layout
		myCytoscape.layout(Layout).run()

	  },
      resize : function(width, height) { }  // not yet
    };
  }
});
