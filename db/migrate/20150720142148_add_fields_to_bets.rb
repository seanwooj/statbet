class AddFieldsToBets < ActiveRecord::Migration
  def change
    change_table :bets do |t|
      t.float :amount
      t.integer :game_id
      t.integer :player_id
      t.string :bet_metric
      t.integer :start_week_id
      t.integer :end_week_id
    end
  end
end
