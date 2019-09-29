class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :coment,:text,null: false

    add_column :products, :child_category,:integer

    add_column :products, :grandchild_category,:integert
  end
end
