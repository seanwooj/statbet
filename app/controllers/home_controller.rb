class HomeController < ApplicationController

	def dashboard
		unless params[:bets]
			@bets = current_user.created_bets
		else
			if params[:bets] == 'mine'
				@bets = current_user.created_bets
			elsif params[:bets] == 'open'
				@bets = Bet.open
			elsif params[:bets] == 'friends'
				# this needs to be changed
				# to current_user.friends_bets
				# once the concept of friendship has
				# been implemented.
				@bets = Bet.all
			end
		end
	end


end