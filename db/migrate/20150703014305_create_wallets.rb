class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :wallet_address
      t.string :private_key
      t.string :name
      t.references :business, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
