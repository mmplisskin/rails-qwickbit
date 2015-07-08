class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :business, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.text :item_address
      t.decimal :price
      t.timestamps null: false
    end
  end
end
