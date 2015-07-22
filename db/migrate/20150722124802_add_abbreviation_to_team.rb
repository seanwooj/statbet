class AddAbbreviationToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :abbreviated_name, :string
  end
end
