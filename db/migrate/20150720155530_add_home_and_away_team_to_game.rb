class AddHomeAndAwayTeamToGame < ActiveRecord::Migration
  def change
    add_column :games, :away_team, :integer
    add_column :games, :home_team, :integer
  end
end
