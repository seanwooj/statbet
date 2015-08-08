class PlayersController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @players = Player.all
    
    respond_to do |format|
      format.json { render :json => @players.as_json(:methods => :full_name) }
    end
    
  end

  def show
  	@player = Player.find(params[:id])

  	respond_to do |format|
  		format.json { render :json => @player.to_json(:methods => [:full_name]) }
  	end
  end
end