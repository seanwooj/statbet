class AddComparisonToBet < ActiveRecord::Migration
  def change
    add_column :bets, :comparison, :string
  end
end
