class BetsController < ApplicationController

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.create!(bet_params)
    respond_to do |format|
      format.json { render :json => @bet }
    end
  end

  def show
    @bet = Bet.find(params[:id])

    respond_to do |format|
      format.json { render :json => @bet }
    end
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update_attributes(bet_params)

    respond_to do |format|
      format.json { render :json => @bet }
    end
  end

  def appropriate_bet_metrics
    @metrics = Bet.get_appropriate_metric(params[:player_type])

    respond_to do |format|
      format.json { render :json => @metrics }
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:player_id, :comparison, :bet_metric_amount, :bet_metric, :start_week_id, :end_week_id, :amount)
  end


end