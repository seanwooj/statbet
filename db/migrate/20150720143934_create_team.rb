class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :home_field # may be redundant, or the one on game may be redundant. not sure
    end
  end
end
