// Globals: select2, $, _

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
			this.players = new Statbet.Players();
			this.listenToOnce(this.players, 'sync', this.instantiatePlayerSelect);
		},

		instantiatePlayerSelect: function () {
			// instantiate the select2 plugin
			this.$(this.ui.playerSearch).select2({
				placeholder: 'Select a player',
				data: this.select2ifyPlayers(),
			});
		},

		select2ifyPlayers: function () {
			var data = this.players.toJSON();
			// this is horrible double iteration, but i guess we need to do it for now
			// until i know what else to do.,
			data = _.map(data, function(value, index) {
				return {id: value.id, text: value.first_name + ' ' + value.last_name }
			});

			return data;
		},

		onRender: function() {
			// use onRender function to append the element to the dom
			// this isn't the best use of marionette (at all. in fact, this is probably
			// egregiously bad. but you know, lack of time and such.)
			$('.bet-form').append(this.el);
		}
	});
})();