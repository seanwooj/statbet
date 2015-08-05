var Statbet = Statbet || {};

(function () {
	Statbet.Players = Backbone.Collection.extend({
		model: Statbet.Player,
		url: '/players',

		initialize: function () {
			this.fetch();
		}
	});
})();