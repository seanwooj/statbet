// Globals: select2, $, _

var Statbet = Statbet || {};

(function() {
	'use strict';

	Statbet.BetFormView = Backbone.Marionette.ItemView.extend({
		template: JST['bets/bet_form'],

		ui: {
			playerSearch: '.player-search',
			comparison: '.comparison',
			betMetricAmount: '.bet-metric-amount',
			betMetric: '.bet-metric',
			startWeek: '.start-week',
			endWeek: '.end-week',
			number: '.number',
			submit: '.submit-bet'
		},

		events: {
			// select2 events can be put in the events hash and they work!
			'select2:select @ui.playerSearch': 'playerSelectHandler'
		},

		initialize: function (options) {
			this.players = new Statbet.Players();
			this.betMetrics = new Statbet.BetMetrics();
			this.listenToOnce(this.players, 'sync', this.instantiatePlayerSelect);
			this.instantiatePrePopulatedSelects();
		},

		onRender: function() {
			// use onRender function to append the element to the dom
			// this isn't the best use of marionette (at all. in fact, this is probably
			// egregiously bad. but you know, lack of time and such.)
			$('.bet-form').append(this.el);
			this.$('select').select2();
		},

		instantiatePrePopulatedSelects: function () {
			this.$(this.ui.comparison).select2();
		},

		instantiatePlayerSelect: function () {
			// instantiate the select2 plugin
			this.$(this.ui.playerSearch).select2({
				placeholder: 'Select a player',
				data: this.select2ifyPlayers(this.players),
			});
		},


		playerSelectHandler: function (ev) {
			var playerId = this.$(this.ui.playerSearch).val()
			var player = this.players.get(playerId);
			var position = player.get('position');
			this.betMetrics.fetch({
				data: {
					position: position
				},
				success: function (betMetrics) {
					this.$(this.ui.betMetric).select2({
						data: this.select2ifyBetMetrics(betMetrics),
					})
				}.bind(this),
				reset: true
			});
		},

		// =================================================================
		// SELECT2 DATA HELPER METHODS
		//
		// Helper functions to put the model data in the correct form
		// that select2 requires. this may not be necessary (eg. select2 has
		// some functionality that i'm not aware of to fix the data) but
		// for now, at least some refactored code here

		select2ifyData: function(data, desiredText, desiredValue) {
			var data = data.toJSON();
			data = _.map(data, function(value, index){
				return { id: value[desiredValue], text: value[desiredText]};
			});
			return data
		},

		select2ifyPlayers: function (players) {
			return this.select2ifyData(players, 'full_name', 'id');
		},

		select2ifyBetMetrics: function (betMetrics) {
			return this.select2ifyData(betMetrics, 'metric', 'metric');
		},

		select2ifyWeeks: function(weeks) {
			return this.select2ifyData(weeks, 'week_in_season', 'id');
		}

	});
})();