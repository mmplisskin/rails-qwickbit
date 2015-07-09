class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.decimal :current_rate

      t.timestamps null: false
    end
  end
end
