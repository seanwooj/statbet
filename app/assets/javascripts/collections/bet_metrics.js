var Statbet = Statbet || {};

(function () {
	Statbet.BetMetrics = Backbone.Collection.extend({
		model: Statbet.BetMetric,
		url: '/bets/metrics',

		initialize: function () {
			this.fetch();
		}
	});
})();