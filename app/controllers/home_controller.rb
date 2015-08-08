class HomeController < ApplicationController

	def dashboard
		@all_bets = Bet.all
		@user_bets = current_user.bets
		@accepted_bets = '' # this doesn't exist yet
	end

end