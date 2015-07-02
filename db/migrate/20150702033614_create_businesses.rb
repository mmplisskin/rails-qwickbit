class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :adress
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
