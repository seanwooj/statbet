class BetsController < ApplicationController

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.create!(bet_params)
    redirect_to new_bet_path
  end

  def appropriate_bet_metrics
    @metrics = Player.get_appropriate_metric(params[:player_type])

    respond_to do |format|
      format.json { render :json => @metrics }
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:player_id, :comparison, :bet_metric_amount, :bet_metric, :start_week_id, :end_week_id, :amount)
  end


end