class BetsController < ApplicationController

  def new
    @bet = Bet.new
  end

  def create
    byebug
    @bet = Bet.create!(bet_params)
    redirect_to new_bet_path
  end

  private

  def bet_params
    params.require(:bet).permit(:player_id, :comparison, :bet_metric_amount, :bet_metric, :start_week_id, :end_week_id, :amount)
  end


end