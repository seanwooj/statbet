var Statbet = Statbet || {};

(function () {
	Statbet.BetMetrics = Backbone.Collection.extend({
		model: Statbet.BetMetric,
		url: '/bet_metrics'
	});
})();