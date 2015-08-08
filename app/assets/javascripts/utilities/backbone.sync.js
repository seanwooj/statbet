/* globals Backbone */

// alias the sync method
Backbone._sync = Backbone.sync;

// define a new sync method
Backbone.sync = function(method, model, options) {
    var csrfToken = $("meta[name='csrf-token']").attr("content");

    if (csrfToken && method && method.match(/(create|update|delete)/)) {
        // add csrf token to header
        options.beforeSend = function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', csrfToken);
        };

        // add csrf token as attribute
        model.set({ authenticity_token: csrfToken }, { silent: true });
    }

    return Backbone._sync(method, model, options);
};
