class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.integer :product_stage, null: false
      t.string :price, null: false
      t.boolean :sold, null: false
      t.reference :user_id, null: false
      t.integer :buyer_id, null: false
      t.string :cost_bearer, null: false
      t.string :delivery_method, null: false
      t.string :delivery_souce, null: false
      t.integer :day_to_ship, null: false
      t.timestamps
    end
  end
end
