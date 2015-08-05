var Statbet = Statbet || {};

(function() {
	'use strict';

	Statbet.BetFormView = Backbone.Marionette.ItemView.extend({
		template: JST['bets/bet_form'],

		ui: {
			playerSearch: '.player-search',

		},

		events: {

		},

		initialize: function (options) {
			this.players = new Statbet.Players()
		},

		onRender: function() {
			// use onRender function to append the element to the dom
			// this isn't the best use of marionette (at all. in fact, this is probably
			// egregiously bad. but you know, lack of time and such.)
			$('.bet-form').append(this.el);
		}
	});
})();