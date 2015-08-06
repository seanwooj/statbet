class BetMetricsController < ApplicationController
	# we don't have a model for bet metrics -- we use the bet
	# model. but for now we have a controller. will probably add
	# a model later if necessary

	def get_by_position
		@bet_metrics = Bet.get_appropriate_metric(params[:position])

		respond_to do |format|
			format.json { render :json => @bet_metrics.to_json }
		end
	end

end