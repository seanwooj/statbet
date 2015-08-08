class WeeksController < ApplicationController
	skip_before_filter :authenticate_user!

	def index
		@weeks = Week.all

		respond_to do |format|
			format.json { render :json => @weeks }
		end
	end

	def valid_weeks

	end
end