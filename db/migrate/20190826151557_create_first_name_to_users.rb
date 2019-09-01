class CreateFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :first_name_to_users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :first_name, null: false
      t.string :last_name
    end
  end
end
