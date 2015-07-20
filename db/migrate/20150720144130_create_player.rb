class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :team_id
      # need to add a profile picture
    end
  end
end
