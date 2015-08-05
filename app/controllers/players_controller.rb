class PlayersController < ApplicationController
  def index
    @players = Player.all

    respond_to do |format|
      format.json { render :json => @players }
    end
    
  end

  def show
  	@player = Player.find(params[:id])

  	respond_to do |format|
  		format.json { render :json => @player }
  	end
  end
end