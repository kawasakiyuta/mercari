class AddBirthdayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    
    add_column :users, :phone_number, :integer, null: false
    
    add_column :users, :postcode, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :block, :string, null: false
    add_column :users, :building, :string

    add_column :users, :wallet, :integer, null: false
  end
end
