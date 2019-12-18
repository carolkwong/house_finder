class AddProfileFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :integer
    add_column :users, :avatar, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :admin, :boolean
  end
end
