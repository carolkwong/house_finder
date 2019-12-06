class RemoveUserFieldFromApartment < ActiveRecord::Migration[6.0]
  def change
  	remove_column :apartments, :user
  end
end
