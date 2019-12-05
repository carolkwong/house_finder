class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :status
      t.text :address
      t.integer :price
      t.decimal :latitude
      t.string :longtitude
      t.string :decimal
      t.string :district
      t.text :description
      t.integer :size
      t.integer :year_built
      t.integer :bedrooms
      t.boolean :elevator
      t.boolean :furnished
      t.string :user

      t.timestamps
    end
  end
end
