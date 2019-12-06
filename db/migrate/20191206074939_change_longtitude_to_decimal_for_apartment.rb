class ChangeLongtitudeToDecimalForApartment < ActiveRecord::Migration[6.0]
  def change
  	remove_column :apartments, :latitude
  	remove_column :apartments, :longtitude
  	remove_column :apartments, :decimal
  	add_column :apartments, :latitude, :decimal
  	add_column :apartments, :longtitude, :decimal
  end
end