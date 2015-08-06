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

		instantiatePrePopulatedSelects: function () {
			this.$(this.ui.comparison).select2();
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

		select2ifyBetMetrics: function (betMetrics) {
			var data = betMetrics.toJSON();
			data = _.map(data, function(value, index){
				return { id: value.metric, text: value.metric };
			});
			return data;
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
						data: this.select2ifyBetMetrics(betMetrics)
					})
				}.bind(this)
			});
		},

		onRender: function() {
			// use onRender function to append the element to the dom
			// this isn't the best use of marionette (at all. in fact, this is probably
			// egregiously bad. but you know, lack of time and such.)
			$('.bet-form').append(this.el);
		}
	});
})();