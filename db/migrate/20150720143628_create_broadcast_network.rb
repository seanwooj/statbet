class CreateBroadcastNetwork < ActiveRecord::Migration
  def change
    create_table :broadcast_networks do |t|
      t.string :name
      t.string :name_abbreviation
      # need to add a logo, but not sure I want it directly on the model. though it doesn't really matter
    end
  end
end
