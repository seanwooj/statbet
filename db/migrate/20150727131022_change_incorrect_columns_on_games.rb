class ChangeIncorrectColumnsOnGames < ActiveRecord::Migration
  def change
    remove_column :games, :home_team
    remove_column :games, :away_team
    add_column :games, :home_team_id, :integer
    add_column :games, :away_team_id, :integer
  end
end
