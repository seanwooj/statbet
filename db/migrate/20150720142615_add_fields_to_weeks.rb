class AddFieldsToWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.date :week_start
      t.date :week_end
      t.string :state
      t.string :name # this might not be necessary
    end
  end
end
