class DropTeamGame < ActiveRecord::Migration
  def change
    drop_table :team_games
  end
end
