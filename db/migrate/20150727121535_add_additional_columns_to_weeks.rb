class AddAdditionalColumnsToWeeks < ActiveRecord::Migration
  def change
    change_table :weeks do |t|
      t.string :season
      t.integer :week_in_season
    end
  end
end
