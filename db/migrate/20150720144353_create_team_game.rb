class CreateTeamGame < ActiveRecord::Migration
  def change
    create_table :team_games do |t|
      t.integer :game_id
      t.integer :team_id
    end
  end
end
