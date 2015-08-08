class HomeController < ApplicationController

	def dashboard
		@all_bets = Bet.all
		@user_created_bets = current_user.created_bets
		@accepted_bets = '' # this doesn't exist yet
	end

end