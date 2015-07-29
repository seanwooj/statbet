class AddCreatorAndChallengerIdToBet < ActiveRecord::Migration
  def change
    add_column :bets, :challenger_id, :integer
    add_column :bets, :creator_id, :integer
  end
end
