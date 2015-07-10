class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.decimal :coinbase_rate
      t.decimal :bitfinex_rate
      t.decimal :okcoin_rate
      t.decimal :average_rate
      t.timestamps null: false
    end
  end
end
