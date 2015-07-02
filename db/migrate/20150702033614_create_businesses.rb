class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone_number
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
