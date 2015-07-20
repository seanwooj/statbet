class AddFieldsToWallet < ActiveRecord::Migration
  def change
    change_table :wallets do |t|
      t.float :available_funds
      t.integer :user_id
    end
  end
end
