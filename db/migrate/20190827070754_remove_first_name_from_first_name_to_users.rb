class RemoveFirstNameFromFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :first_name_to_users, :first_name, :string
  end
end
