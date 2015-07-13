class CreateWalletTransactions < ActiveRecord::Migration
  def change
    create_table :wallet_transactions do |t|

      t.timestamps null: false
    end
  end
end
