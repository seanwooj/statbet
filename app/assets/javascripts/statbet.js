var Statbet = Statbet || {};

(function() {
	"use strict";

	Statbet.App = Backbone.Marionette.Application.extend({
		// nothing here yet.
	});
	
	Statbet.app = new Statbet.App();

	// run some after initialization code.
	Statbet.app.on('start', function (options) {
		// some initialization code that we don't need quite yet.
	});

	Statbet.app.start();
})();