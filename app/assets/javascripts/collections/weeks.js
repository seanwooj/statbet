var Statbet = Statbet || {};

(function () {
	Statbet.Weeks = Backbone.Collection.extend({
		model: Statbet.Week,
		url: '/weeks',

		initialize: function () {
			this.fetch();
		}
	});
})();