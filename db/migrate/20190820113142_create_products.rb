class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.integer :state, null: false
      t.string :price, null: false
      t.boolean :sold
      t.references :user
      t.integer :buyer_id,
      t.string :cost_bearer, null: false
      t.string :delivery_method
      t.string :delivery_souce, null: false
      t.integer :day_to_ship, null: false
      t.timestamps
    end
  end
end
