class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :field_name # this needs to validated to make sure only certain values are allowed
      t.datetime :game_time
      t.integer :broadcast_network_id
      t.integer :week_id
      t.datetime :kickoff_time
    end
  end
end
