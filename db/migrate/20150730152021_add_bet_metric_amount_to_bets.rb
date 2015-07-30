class AddBetMetricAmountToBets < ActiveRecord::Migration
  def change
    add_column :bets, :bet_metric_amount, :integer
  end
end
